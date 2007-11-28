From: Tagg McDonald <taggm@dutro.com>
Subject: Re: Blocking web-based proxy traffic
Date: Wed, 28 Nov 2007 14:41:19 -0700
Message-ID: <474DE07F.4020903@dutro.com>
References: <C3731711.2208%jlay@slave-tothe-box.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <C3731711.2208%jlay@slave-tothe-box.net>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org


> Interesting idea.  I know that when I've captured this proxy traffic I see
> in ASCII "http://" and then whatever proxied site (usually myspace).  I was
> thinking maybe a matchstring type thing?  Here's a snippet from an
> access.log from a transparent squid proxy, using sureproxy hitting playboy:
>
> 10.1.1.191 - - [28/Nov/2007:12:49:26 -0700] "GET
> http://www.sureproxy.com/nph-index.cgi/011110A/http/www.playboy.com/imx/fron
> tpage/2008-calendars.jpg HTTP/1.1" 200 366
> "http://www.sureproxy.com/nph-index.cgi/011110A/http/www.playboy.com/"
> "Opera/9.24 (Macintosh; Intel Mac OS X; U; en)" TCP_MISS:DIRECT
>
> Does my idea make sense or am I on crack :D
>
> James

If you have a transparent squid proxy in place you can do ACL's and/or
use squidguard or dans guardian.

-- 
Tagg McDonald
Dutro Company
675 North 600 West
Logan, UT 84321
(435) 752-3921 x146

