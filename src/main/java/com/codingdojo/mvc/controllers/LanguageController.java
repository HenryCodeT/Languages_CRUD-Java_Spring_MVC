package com.codingdojo.mvc.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.codingdojo.mvc.models.Language;
import com.codingdojo.mvc.services.languageService;

@Controller
public class LanguageController {
	
	// //// SERVICE ////
	@Autowired
	languageService languageService;
	
	// //// REDIRECT TO INDEX URL ////
	@GetMapping("/")
	public String index() {
		return "redirect:/languages";
	}
	
	// //// RENDER MAIN PAGE ////
	
	// ---- show all languages ---- //
	@GetMapping("/languages")
	public String main(@ModelAttribute("language") Language language , Model model) {
		List<Language> languages = languageService.allLanguages();
		System.out.println("controller-get-all-languages-to-show: "+languageService.allLanguages());
		model.addAttribute("languages", languages);
		System.out.println("---------------- RENDER ALL LANGAUGES --------------");
		return "index";
	}
	// ---- post language ---- //
	@PostMapping("/languages")
	public String newLanguage(	@Valid @ModelAttribute("language") Language language,
								BindingResult result,
								Model model) {
		System.out.println("Controller-get-expense-from-form: "+language);
		if (result.hasErrors()) {
			List<Language> languages = languageService.allLanguages();
			model.addAttribute("expenses", languages);
            return "index";
		} else {
			System.out.println("controller-form-get-isvalid-create: "+language);
			languageService.createLanguage(language);
			return "redirect:/languages";
		}
	}
	
	// //// RENDER EDIT PAGE //// 
	
	// ---- edit language ---- //
	
	@GetMapping("/languages/{id}/edit")
	public String editView(	@PathVariable("id") Long id, Model model) {
		Language language = languageService.findLanguageById(id);
		model.addAttribute("language", language);
		System.out.println("---------------- RENDER LANGUAGE EDIT VIEW ----------------");
		return "edit";
	}
	@PutMapping("/languages/{id}")
	public String editAction(	@PathVariable("id") Long id,
								@Valid @ModelAttribute("language") Language language,
								BindingResult result) {
		System.out.println("controller-id-update: "+id);
		System.out.println("controller-update-book: "+language);
		if (result.hasErrors()) {
			return "edit";
		} else {
			languageService.updateLanguage(id,language);
			return "redirect:/languages";
		}
	}
	
	// //// RENDER SHOW PAGE ////
	@GetMapping("/languages/{id}")
	public String showLanguage(@PathVariable("id") Long id,Model model) {
		System.out.println("controller-get-id-from-path: "+id);
		Language language = languageService.findLanguageById(id);
		System.out.println("Controler-show-test-show-name: "+language.getName());
		model.addAttribute("language", language);
		return "show";
	}
	// //// DELETE ////

	@DeleteMapping("languages/{id}")
	public String delete(@PathVariable("id") Long id) {
		languageService.deleteById(id);
		return "redirect:/languages";
	}
}
