From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: SNAT does not work
Date: Thu, 6 Jun 2002 14:40:02 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206061340.g56DeAA31074@vulcan.rissington.net>
References: <3CFF6327.5020306@globit.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <3CFF6327.5020306@globit.com>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

On Thursday 06 June 2002 2:27 pm, Uwe Eisner wrote:

> My problem is, that this rule does not work. When I start a Perl-code at
> the www, witch shows me my ip-address, it showes me the IP-address of
> the external interface of the router/firewall. I can not find the
> problem. If I set no POSTROUTING rule, it is the same game...
>
> Is it possible, that NAT is not activeted at my kernel. How can I test it?

If that were true you would not be able to enter the "-t nat -j SNAT" rule - 
you would get an error message.

I cannot see an obvious problem with your rules.   I suggest you put a LOG 
rule at the end of your FORWARD chain and see what gets logged (just before 
it gets default DROPped).


Antony.

