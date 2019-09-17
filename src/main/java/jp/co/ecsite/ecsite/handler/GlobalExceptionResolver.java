package jp.co.ecsite.ecsite.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

//@ControllerAdvice
public class GlobalExceptionResolver implements HandlerExceptionResolver {

@Override
public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) {
	ModelAndView model = new ModelAndView("error");
	model.addObject("error","ログイン画面から入力してください。");

	return model;
}

}
