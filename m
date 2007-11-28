From: James Lay <jlay@slave-tothe-box.net>
Subject: Re: Blocking web-based proxy traffic
Date: Wed, 28 Nov 2007 13:01:05 -0700
Message-ID: <C3731711.2208%jlay@slave-tothe-box.net>
References: <474DBF89.8000609@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <474DBF89.8000609@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mail List - Netfilter <netfilter@vger.kernel.org>




On 11/28/07 12:20 PM, "Grant Taylor" <gtaylor@riverviewtech.net> wrote:

> (Please do not start a new thread by replying to an old one.)
> 
> On 11/28/07 11:56, James Lay wrote:
>> A curious question I have been asked from a client...any way to block
>> web-based proxies with iptables?  Wondering what it would take.
> 
> Well, IPTables can filter packets based on source IP of the proxies if
> they are known.  You could also use some sort of layer 7 match looking
> for some sort of header indicating that a proxy was in use.  However
> this would be very easy to circumvent and very much a catch up game on
> the IP blocking.
> 
> If you are really serious about doing this I would suggest that you do
> something that functioned based on the number of connections from a
> given source IP with in a time frame knowing that it is likely that
> proxies will possibly have a higher hit count than single systems.
> However this will also catch NATing gateways for companies.  So you will
> have to deal with white listing too.
> 
> 
> 
> Grant. . . .

Interesting idea.  I know that when I've captured this proxy traffic I see
in ASCII "http://" and then whatever proxied site (usually myspace).  I was
thinking maybe a matchstring type thing?  Here's a snippet from an
access.log from a transparent squid proxy, using sureproxy hitting playboy:

10.1.1.191 - - [28/Nov/2007:12:49:26 -0700] "GET
http://www.sureproxy.com/nph-index.cgi/011110A/http/www.playboy.com/imx/fron
tpage/2008-calendars.jpg HTTP/1.1" 200 366
"http://www.sureproxy.com/nph-index.cgi/011110A/http/www.playboy.com/"
"Opera/9.24 (Macintosh; Intel Mac OS X; U; en)" TCP_MISS:DIRECT

Does my idea make sense or am I on crack :D

James


