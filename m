From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: iptables on DLink DSL-502T Modem/Router
Date: Tue, 8 Nov 2005 16:28:52 -0600
Message-ID: <200511081628.52748.rob0@gmx.co.uk>
References: <cc8f3f150511071747m64e3841ava98596bfe776fcf3@mail.gmail.com>
	<200511081516.21132.rob0@gmx.co.uk>
	<cc8f3f150511081357s206b99d0m95942f124269b709@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <cc8f3f150511081357s206b99d0m95942f124269b709@mail.gmail.com>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Tuesday 2005-November-08 15:57, Paul Goodyear wrote:
> Thanks for that, I used the -I chain <ruleid> successfully. And added
> the rule 2 down, but the router still does not let me in. Could it be

Being an embedded device means this won't be as easy to debug. On a 
regular system I would suggest using a -j LOG rule before your ACCEPT 
rule to see what's happening. It might work on this, hard to say.

You can also use -v with the -L option to list rules. See if anything 
matched your rule. If not, your rule is wrong, or in the wrong place.

Don't use Microsoft tools for debugging. Try to telnet(1) to your RDP 
port from outside. Does telnet connect? Check /proc/net/ip_conntrack. 
Is your connection listed?

> possible that the iptables rule is in place, but the manufactures
> (DLink) have done something to stop this working?

I don't know what it would be. But on further thought I realised that 
some ISP's block RDP. Comcast does, both RDP and PPTP, likely to 
"encourage" residential users to upgrade to "business" service (the 
same hit-or-miss service for more money.)

Use nmap(8) to scan your router from outside. Is RDP open? Insert an 
INPUT and FORWARD rule to ACCEPT everything from the IP address where 
you are doing the scan. If anything shows as "filtered" it means either 
your ISP is blocking it or you're DNAT'ing to a closed host:port.

> I have a Safecom router also, with the same embeded linux version and
> this supports ip filtering and the iptables commands.

And you tested with that, and you found ... ?
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

