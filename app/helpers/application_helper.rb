# encoding: utf-8

module ApplicationHelper

  def display_flash flash
    html = ""

    tb_class = {:alert => 'error', :notice => 'success'}
    before_text = {:alert => '¡Oh oh!', :notice => 'Bien, '}

    flash.keys.each do |key|

      if !flash[key].blank?
        html << content_tag(:div, :class => "alert alert-#{tb_class[key]}") do
          "<strong> #{before_text[key]} </strong> #{flash[key]}
           #{button_tag('x', :class => 'close', :'data-dismiss' => 'alert')}
          ".html_safe        
        end.html_safe
      end
      flash[:key] = nil
    end
    html.html_safe
  end

  def marker_link link_key
    link_to(t(link_key, scope: [:copy_copter_text], default: link_key.to_s),'#', id: link_key.to_s, class: 'marker-link'  )    
  end

  def header_link_class controller
    (controller_name == controller)? 'active' : ''
  end


end
