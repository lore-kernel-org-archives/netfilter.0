From: dhottinger@harrisonburg.k12.va.us
Subject: Re: Blocking web-based proxy traffic
Date: Wed, 28 Nov 2007 20:53:36 -0500
Message-ID: <20071128205336.pnlj3692vwwoc04g@webmail.harrisonburg.k12.va.us>
References: <C3731711.2208%jlay@slave-tothe-box.net>
	<474DE07F.4020903@dutro.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <474DE07F.4020903@dutro.com>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; delsp="Yes	format=flowed"
To: Tagg McDonald <taggm@dutro.com>
Cc: netfilter@vger.kernel.org

Quoting Tagg McDonald <taggm@dutro.com>:

>
>> Interesting idea.  I know that when I've captured this proxy traffic I see
>> in ASCII "http://" and then whatever proxied site (usually myspace).  I was
>> thinking maybe a matchstring type thing?  Here's a snippet from an
>> access.log from a transparent squid proxy, using sureproxy hitting playboy:
>>
>> 10.1.1.191 - - [28/Nov/2007:12:49:26 -0700] "GET
>> http://www.sureproxy.com/nph-index.cgi/011110A/http/www.playboy.com/imx/fron
>> tpage/2008-calendars.jpg HTTP/1.1" 200 366
>> "http://www.sureproxy.com/nph-index.cgi/011110A/http/www.playboy.com/"
>> "Opera/9.24 (Macintosh; Intel Mac OS X; U; en)" TCP_MISS:DIRECT
>>
>> Does my idea make sense or am I on crack :D
>>
>> James
>
> If you have a transparent squid proxy in place you can do ACL's and/or
> use squidguard or dans guardian.
>
> --
> Tagg McDonald
> Dutro Company
> 675 North 600 West
> Logan, UT 84321
> (435) 752-3921 x146
>
> -
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
Even with a proxy and filter in place, they can still circumvent using  
proxifier sites.  I block them at my firewall using the drop in my  
preroute.  I really dont care about the timeouts, if your going around  
the filter, your breaking policy.  Even then its hard to stop.  I cant  
use my transparent proxy for https, which a lot of the sites run.   
They will have http: and https:  both of which connect to the same  
site.  I have a list of close to 300 + sites I block at the firewall  
that I try to keep up to date, but new sites are out all the time.   
One thing I have found, is that snort rules help to detect when these  
things are happening.  Their are some policy rules that are able to  
detect when some of these sites are accessed or when someone is trying  
to use them.  In short, if anyone finds a way to block access to these  
sites 100% I would sure like to hear about it.  Short of denying  
access to the entire internet except for those sites specifically  
allowed.


-- 
Dwayne Hottinger
Network Administrator
Harrisonburg City Public Schools

"rarely do people communicate, they just take turns talking"

