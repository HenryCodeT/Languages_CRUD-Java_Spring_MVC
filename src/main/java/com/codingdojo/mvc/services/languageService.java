package com.codingdojo.mvc.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.mvc.models.Language;
import com.codingdojo.mvc.repositories.LanguageRepository;

@Service
public class languageService {
	@Autowired
	LanguageRepository languageRepository;
	
	// //// find all languages ////
	public List<Language> allLanguages() {
		System.out.println("service - find - all - languages: "+languageRepository.findAll());
		System.out.println("-------------- FIND ALL LANGUAGES FROM DB ---------------");
		return languageRepository.findAll();
	}
	
	// //// create new language ////
	public Language createLanguage(Language language) {
		return languageRepository.save(language);
	}
	
	// //// Find Language By ID ////
	public Language findLanguageById(Long id) {
		Optional<Language> optional = languageRepository.findById(id);
		if (optional.isPresent()) {
			System.out.println("service-find-language-by-id: "+ languageRepository.findById(id));
			System.out.println("----------------- SERVICE GET LANGUAGE ---------------");			
			return optional.get();
		} else {
			return null;
		}
	}
	
	// //// UPDATE LANGUAGE ////
	public Language updateLanguage(Long id, Language language) {
		Optional<Language> optional = languageRepository.findById(id);
		System.out.println("service-update-get-lang-from-DB: "+optional.isPresent());
		if (optional.isPresent()) {
			Language data = optional.get();
			data.setName(language.getName());
			data.setCreator(language.getCreator());
			data.setVersion(language.getVersion());
			System.out.println("-------------------------UPDATED---------------------------");
			return languageRepository.save(data);
		} else {
			return null;
		}
	}
	
	// //// DELETE ////
	public void deleteById(Long id) {
		Optional<Language> optional = languageRepository.findById(id);
		if (optional.isPresent()) {
			languageRepository.deleteById(id);			
		}
	}
}
