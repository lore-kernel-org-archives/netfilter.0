From: Roger Price <roger@rogerprice.org>
Subject: Re: iptables: unknown protocol "!" specified
Date: Sun, 22 Nov 2015 17:05:16 +0100 (CET)
Message-ID: <alpine.LNX.2.00.1511220946050.3864@maria.rogerprice.org>
References: <alpine.LNX.2.00.1511211917160.3864@maria.rogerprice.org> <56517A70.4020001@plouf.fr.eu.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <56517A70.4020001@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; format="flowed"; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Netfilter Users Mailing list <netfilter@vger.kernel.org>

On Sun, 22 Nov 2015, Pascal Hambourg wrote:

> No, it means to match anything but TCP. There are many other protocols
> than TCP, UDP and ICMP.

Aha! Does this mean that chapter 10.1 of the iptables tutorial at 
https://www.frozentux.net/iptables-tutorial/iptables-tutorial.html#GENERICMATCHES 
is both syntactically and semantically wrong?

Quoting: << ALL means that it matches only TCP, UDP and ICMP. If this 
match is given the integer value of zero (0), it means ALL protocols, 
which in turn is the default behavior, if the --protocol match is not 
used. This match can also be inversed with the ! sign, so --protocol ! tcp 
would mean to match UDP and ICMP. >>

Should this say:

<< ALL matches every protocol given in /etc/protocols, i.e. all protocols 
in the interval (0..255).  ALL is the default behaviour and can also be 
specified by writing 0 (zero). The match may be reversed by writing "! 
--protocol x" which means all the 256 protocol numbers except x.  E.g. "! 
-p tcp" means the protocols in intervals (0..5) and (7..255).  >>

If people have believed the tutorial and used "! -p icmp" as a shorthand 
for "TCP and UDP", then they will be letting through more than they 
expect.

Roger
