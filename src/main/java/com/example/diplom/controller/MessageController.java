package com.example.diplom.controller;

import com.example.diplom.domain.Message;
import com.example.diplom.domain.User;
import com.example.diplom.domain.dto.MessageDto;
import com.example.diplom.repos.MessageRepo;
import com.example.diplom.service.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import javax.validation.Valid;
import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

@Controller
public class MessageController {
    @Autowired
    private MessageRepo messageRepo;

    @Autowired
    private MessageService messageService;

    @Value("${upload.path}")
    private String uploadPath;

      public static String getMySourcePath() {
        URL location = MessageController.class.getProtectionDomain().getCodeSource()
                .getLocation();
        String srcPath = location.toString().replace("file:/", "")
                .replace("bin", "src").replace("/target/classes/","/images");
        System.out.println("================================================================="+ srcPath+"=================================================================");
        return srcPath;
    }

    /*private void savePhoto1(@Valid Message message, @RequestParam("file") MultipartFile file) throws IOException {
        if (file != null && !file.getOriginalFilename().isEmpty()) {
            File uploadDir = new File(uploadPath);

            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }
             String path  = getMySourcePath();
            System.out.println(path);

            String uuidFile = UUID.randomUUID().toString();
            String resultFilename = uuidFile + "." + file.getOriginalFilename();

            file.transferTo(new File( path + "/" + resultFilename));

            message.setFilename(resultFilename);
        }
    }*/
    private void savePhoto(@Valid Message message, @RequestParam("file") MultipartFile file) throws IOException {
        if (file != null && !file.getOriginalFilename().isEmpty()) {
            File uploadDir = new File(uploadPath);

            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }

            String uuidFile = UUID.randomUUID().toString();
            String resultFilename = uuidFile + "." + file.getOriginalFilename();

            file.transferTo(new File(uploadPath + "/" + resultFilename));

            message.setFilename(resultFilename);
        }
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @GetMapping("/adminMes/{id}")
    public String delMessageAdmin(
            @PathVariable("id") Message message,
            Model model
    )  {

        messageRepo.delete(message);
        model.addAttribute("messageDelete",message);

        return "redirect:/main";
    }

    @GetMapping("/")
    public String homepage(Map<String, Object> model,@AuthenticationPrincipal User user) {
                return "greeting";
    }

    @GetMapping("/main")
    public String mainPage(
            @RequestParam(required = false, defaultValue = "") String filter,
            Model model,
            @PageableDefault(sort = { "id" }, direction = Sort.Direction.DESC) Pageable pageable,
            @AuthenticationPrincipal User currentUser
    ) {
        getMySourcePath();
        Page<MessageDto> page = messageService.messageList(pageable, filter, currentUser);

        model.addAttribute("page", page);
        model.addAttribute("url", "/main");
        model.addAttribute("filter", filter);

        return "main";
    }

    @PostMapping("/main")
    public String addMessage(
            @AuthenticationPrincipal User currentUser,
            @Valid Message message,
            BindingResult bindingResult,
            Model model,
            @RequestParam("file") MultipartFile file
    ) throws IOException {
        message.setAuthor(currentUser);

        if (bindingResult.hasErrors()) {
            Map<String, String> errorsMap = ControllerUtils.getErrors(bindingResult);

            model.mergeAttributes(errorsMap);
            model.addAttribute("message", message);
        } else {
            savePhoto(message, file);

            model.addAttribute("message", null);

            messageRepo.save(message);
        }

        Iterable<Message> messages = messageRepo.findAll();

        model.addAttribute("messages", messages);


        return "redirect:/main";
    }



    @GetMapping("/user-messages/{author}")
    public String messgesOfUsr(
            @AuthenticationPrincipal User currentUser,
            @PathVariable User author,
            Model model,
            @RequestParam(required = false) Message message,
            @PageableDefault(sort = { "id" }, direction = Sort.Direction.DESC) Pageable pageable
    ) {
        Page<MessageDto> page = messageService.messageListForUser(pageable, currentUser, author);

        model.addAttribute("userChannel", author);
        model.addAttribute("subscriptionsCount", author.getSubscriptions().size());
        model.addAttribute("subscribersCount", author.getSubscribers().size());
        model.addAttribute("isSubscriber", author.getSubscribers().contains(currentUser));
        model.addAttribute("message", message);
        model.addAttribute("isCurrentUser", currentUser.equals(author));
        model.addAttribute("page", page);
        model.addAttribute("url", "/user-messages/" + author.getId());

        return "userMessages";
    }

    @PostMapping("/user-messages/{user}")
    public String updateUserMessage(
            @AuthenticationPrincipal User currentUser,
            @PathVariable Long user,
            @RequestParam(value = "id", defaultValue = "1") Message message ,
            @RequestParam("text") String text,
            @RequestParam("tag") String tag,
            @RequestParam("phone") String phone,
            @RequestParam("file") MultipartFile file
    ) throws IOException {
        if(message.equals(null)){

            message.setId(1l);
        }
        if (message.getAuthor().equals(currentUser)) {
            if (!StringUtils.isEmpty(text)) {
                message.setText(text);
            }

            if (!StringUtils.isEmpty(tag)) {
                message.setTag(tag);
            }
            if (!StringUtils.isEmpty(phone)) {
                message.setPhone(phone);
            }

            savePhoto(message, file);

            messageRepo.save(message);
        }

        return "redirect:/user-messages/" + user;
    }
    @GetMapping("/main/{id}")
    public String deleteMessage(
            @AuthenticationPrincipal User currentUser,
            @PathVariable("id") Message message,
            Model model
    )  {
        if (message.getAuthor().equals(currentUser)) {
           messageRepo.delete(message);
           model.addAttribute("messageDelete",message);
        }
        return "redirect:/main";
    }

    @GetMapping("/messages/{message}/like")
    public String sendLikeToMsg(
            @AuthenticationPrincipal User currentUser,
            @PathVariable Message message,
            RedirectAttributes redirectAttributes,
            @RequestHeader(required = false) String referer
    ) {
        Set<User> likes = message.getLikes();

        if (likes.contains(currentUser)) {
            likes.remove(currentUser);
        } else {
            likes.add(currentUser);
        }

        UriComponents components = UriComponentsBuilder.fromHttpUrl(referer).build();

        components.getQueryParams()
                .entrySet()
                .forEach(pair -> redirectAttributes.addAttribute(pair.getKey(), pair.getValue()));

        return "redirect:" + components.getPath();
    }



}
