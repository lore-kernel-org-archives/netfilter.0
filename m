From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: iptable question
Date: Wed, 18 Jun 2003 11:20:35 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200306181120.35468.Alistair@nerdnet.ca>
References: <20030618134048.90305.qmail@web14708.mail.yahoo.com>
Reply-To: Alistair@nerdnet.ca
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030618134048.90305.qmail@web14708.mail.yahoo.com>
Content-Disposition: inline
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Craig <elitesyntax@yahoo.com>, netfilter@lists.netfilter.org

On June 18, 2003 09:40 am, Craig wrote:
> How can i debug my iptables script?
>
>
>
> #!/bin/sh
> #
> # The location of the IPTables binary file on your
> system.

<<SNIPPED FOR BREVITY >>

> $IPT -A INPUT -p icmp --icmp-type 11 -j ACCEPT
> $IPT -A INPUT -p icmp --icmp-type 8 -m limit --limit
> 1/second -j ACCEPT
> $IPT -A INPUT -p icmp -j DROP
>
>
> =====
> EliteSyntax  www.linuxnewbie.org
>
>
>

	Depends on what your trying to find, but I've been inclined to put
	"echo" statements between groups of rules to catch where the 
	errors are occurring and then narrow the search from there.
	
	?? 40 character line wrap on your MTA?  or b0rked script?
	if the line wraps are like that in the script ... you need to fix that 
	before anything else.   If the wraps are from your MTA ... thats okay.

	Alistair Tonner
	nerdnet.ca
	Senior Systems Analyst - RSS
	
     Any sufficiently advanced technology will have the appearance of magic.
	Lets get magical!

