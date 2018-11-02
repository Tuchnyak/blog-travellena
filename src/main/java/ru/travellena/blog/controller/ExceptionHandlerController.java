package ru.travellena.blog.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.method.annotation.ResponseEntityExceptionHandler;

/**
 * Handle Exceptions with custom page
 * @author tuchnyak, https://github.com/Tuchnyak
 *
 */
@ControllerAdvice
public class ExceptionHandlerController extends ResponseEntityExceptionHandler implements HandlerExceptionResolver {

	public static final String DEFAULT_ERROR_VIEW = "error-page";

	@Override
	public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object handler,
			Exception ex) {
		
		System.out.println("===>>> Resolving Exception");
		System.out.println("===>>> Response: " + response.getStatus());

		ModelAndView mav = new ModelAndView();
		mav.addObject("exception", ex);
		mav.addObject("url", request.getRequestURL());
		mav.setViewName(DEFAULT_ERROR_VIEW);

		return mav;
	}	

}
