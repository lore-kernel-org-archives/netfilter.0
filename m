From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: "NAT redirection", or NAT from inside to inside?
Date: Fri, 15 Aug 2008 09:32:26 -0500
Message-ID: <48A5937A.7080801@riverviewtech.net>
References: <bcc0d0530808140217y37de308cj5bee8c0b64971a4c@mail.gmail.com> <48A4D815.2050708@riverviewtech.net> <91417772-9FB8-4F64-88A4-80F2F84B35D2@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <91417772-9FB8-4F64-88A4-80F2F84B35D2@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 08/15/08 05:31, Philipp Periventas wrote:
> Hello Grant,

Morning.

> thank you very much for your mail and your effort! I finally solved the 
> problem with exactly the commands you wrote in your mail, plus a command 
> for letting the firewall itself getting access to the webserver by 
> manipulating the NAT output chain. I found this advice on the website 
> http://iptables-tutorial.frozentux.net/chunkyhtml/x4033.html - 
> unfortunately, I found it a bit too late!

*nod*

I'm glad that what I suggested worked as I had not had a chance to try 
it my self.

I *always* forget about the firewall its self being able to access 
things as I so seldom need it to be able to do so.

> The website also addresses the problem with "manipulated logs" - but I 
> guess by defining a source LAN address (like you did) I can live with 
> this constraint...

Yes.  I think who ever wrote that web page was working through things 
evolutionary (at least that's how it reads to me) and solved their 
problems as they came to them.  A simple TCPDump of unSNATed connections 
will show the problem which would prompt an SNAT rule.  After that 
looking at logs on the web server would it become obvious that you don't 
want to SNAT everything, just the LAN traffic.  This is one of the 
*many* reasons why having a DMZ be on a separate subnet is such a good ting.

> Damn! There should be special term for this kind of stupid - yet easy to 
> solve problem, because I was looking and asking for about a whole week 
> in forums, irc channels and so on...

Eh.  Most firewalling documentation is written around the idea that both 
the request and reply packets pass through the firewall (as opposed to 
some other route) and really one set of query / reply packets at that. 
When you start getting in to more complex things where the traffic might 
or might not pass through the firewall or you may want to deal with 
different IP addresses in subsequent query / reply sets or even 
different source / dest IPs in the query and reply (see the recent 
thread on SNMP and CUPS printing) the amount of documentation drops off 
and your need to truly understand what the packets are doing goes way 
up.  Try throwing hardware (switches) in there that do not like seeing 
the same MAC address on multiple VLANs and have to work around that...

> So, over again, thanks!

*nod*

You are quite welcome.  I'm glad that my ramblings helped.



Grant. . . .
