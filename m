From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Blocking web-based proxy traffic
Date: Wed, 28 Nov 2007 14:07:09 -0600
Message-ID: <474DCA6D.2010305@riverviewtech.net>
References: <C3731711.2208%jlay@slave-tothe-box.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <C3731711.2208%jlay@slave-tothe-box.net>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 11/28/07 14:01, James Lay wrote:
> Interesting idea.  I know that when I've captured this proxy traffic 
> I see in ASCII "http://" and then whatever proxied site (usually 
> myspace).  I was thinking maybe a matchstring type thing?  Here's a 
> snippet from an access.log from a transparent squid proxy, using 
> sureproxy hitting playboy:

Possibly.

> 10.1.1.191 - - [28/Nov/2007:12:49:26 -0700] "GET 
> http://www.sureproxy.com/nph-index.cgi/011110A/http/www.playboy.com/imx/frontpage/2008-calendars.jpg 
> HTTP/1.1" 200 366 
> "http://www.sureproxy.com/nph-index.cgi/011110A/http/www.playboy.com/" 
> "Opera/9.24 (Macintosh; Intel Mac OS X; U; en)" TCP_MISS:DIRECT
> 
> Does my idea make sense or am I on crack :D

Are you wanting to prevent proxy services from accessing your web 
site(s) or are you wanting to prevent people behind your proxy from 
accessing prohibited material?  This makes a *BIG* difference in what 
direction you go.



Grant. . . .
