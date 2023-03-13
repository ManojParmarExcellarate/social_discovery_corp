module Scraper
  module Facebook
    class ApplyDateFilter < FacebookApplicationService
      def initialize(browser, date_filter)
        @browser = browser
        @date_filter = date_filter
      end

      def perform
        # sleep(3)
        # @browser.div(css: '.x78zum5.xwib8y2.x1y1aw1k').children[0].children[0].click
        # sleep(1)
        # # click on year select
        # @browser.div(css: '.x1i10hfl.xjqpnuy.xa49m3k.xqeqjp1.x2hbi6w.xdl72j9.x2lah0s.xe8uvvx.x2lwn1j.xeuugli.x1hl2dhg.xggy1nq.x1t137rt.x1q0g3np.x87ps6o.x1lku1pv.x78zum5.x1a2a7pz.x6s0dn4.xjyslct.x1qhmfi1.xhk9q7s.x1otrzb0.x1i1ezom.x1o6z2jb.x13fuv20.xu3j5b3.x1q0q8m5.x26u7qi.x972fbf.xcfux6l.x1qhh985.xm0m39n.x9f619.x1ypdohk.x1qughib.xdj266r.x11i5rnm.xat24cr.x1mh8g0r.x889kno.xn6708d.x1a8lsjc.x1ye3gou.x1n2onr6.x1yc453h.x1ja2u2z').click rescue nil
        # sleep(3)

        # # get year options
        # year_options = @browser.div(css: '.x6umtig.x1b1mbwd.xaqea5y.xav7gou.xe8uvvx.x1hl2dhg.xggy1nq.x1o1ewxj.x3x9cwd.x1e5q0jg.x13rtm0m.x87ps6o.x1lku1pv.x1a2a7pz.x6s0dn4.xjyslct.x9f619.x1ypdohk.x78zum5.x1q0g3np.x2lah0s.x13mpval.x1w4qvff.xdj266r.xat24cr.xz9dl7a.x1sxyh0.xsag5q8.xurb0ha.x1n2onr6.x16tdsg8.x1ja2u2z').parent.children rescue nil
        # year_options.select{|year_option| year_option.inner_html.include?('2020')}.first.click
        # sleep(2)

        # # click on month select
        # @browser.div(css: '.x1i10hfl.xjqpnuy.xa49m3k.xqeqjp1.x2hbi6w.xdl72j9.x2lah0s.xe8uvvx.x2lwn1j.xeuugli.x1hl2dhg.xggy1nq.x1t137rt.x1q0g3np.x87ps6o.x1lku1pv.x78zum5.x1a2a7pz.x6s0dn4.xjyslct.x1qhmfi1.xhk9q7s.x1otrzb0.x1i1ezom.x1o6z2jb.x13fuv20.xu3j5b3.x1q0q8m5.x26u7qi.x972fbf.xcfux6l.x1qhh985.xm0m39n.x9f619.x1ypdohk.x1qughib.xdj266r.x11i5rnm.xat24cr.x1mh8g0r.x889kno.xn6708d.x1a8lsjc.x1ye3gou.x1n2onr6.x1yc453h.x1ja2u2z').parent.parent.parent.children[1].children[0].children[0].click
        # sleep(2)
        # # get month options

        # month_options = @browser.div(css: '.x1i10hfl.xjbqb8w.x6umtig.x1b1mbwd.xaqea5y.xav7gou.xe8uvvx.x1hl2dhg.xggy1nq.x1o1ewxj.x3x9cwd.x1e5q0jg.x13rtm0m.x87ps6o.x1lku1pv.x1a2a7pz.x6s0dn4.xjyslct.x9f619.x1ypdohk.x78zum5.x1q0g3np.x2lah0s.x13mpval.x1w4qvff.xdj266r.xat24cr.xz9dl7a.x1sxyh0.xsag5q8.xurb0ha.x1n2onr6.x16tdsg8.x1ja2u2z').parent.children rescue nil
        # month_options.select{|month_option| month_option.inner_html.include?('March')}.first.click rescue nil

        # sleep(2)

        # 3.times { @browser.send_keys(:tab) }
        # @browser.send_keys :enter
        # # $('h1.x1heor9g.x1qlqyl8.x1pd3egz.x1a2a7pz').click

        # @browser.h1(css: ".x1heor9g.x1qlqyl8.x1pd3egz.x1a2a7pz").click
        # sleep(2)

      end
    end
  end
end
