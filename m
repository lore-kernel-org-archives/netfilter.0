From: Anders Fugmann <afu@fugmann.dhs.org>
Subject: Re: NAT + NFS
Date: Sun, 13 Apr 2003 01:27:15 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E98A0D3.7050209@fugmann.dhs.org>
References: <200304111215.h3BCF0q18594@mailgate5.cinetic.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200304111215.h3BCF0q18594@mailgate5.cinetic.de>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: doedelberlin@web.de
Cc: netfilter@lists.netfilter.org

doedelberlin@web.de wrote:
> i have a Linux gateway performing NAT (SNAT and DNAT) with iptables_1.2.7a
> 
> on both sides there are UNIX machines (SOLARIS) 
> 
> telnet, ftp, ... works fine but when i mount on Solaris client a directory from 
> Solaris nfs server via gateway i have problems with performance.
> 
> it starts with "normal speed" but it gets worse and worse.
> after reboot of this gateway it is ok but then again the same game.
Assuming that the gateway running iptables is the root to the problem,
have you tried to make a minimal working set of rules that exposes the 
problem? If yes then please state them.

Also, what is the load on the gateway when degradation occurs and is the 
degradation still present if you reboot one of the clients?

> 
> does anybody have experiences with this problem ?
No - but I have a few clues :-)

> (best would be also a solution ... ;-)
> 
> thank you

Regards
Anders Fugmann

--
Author of FIAIF
FIAIF is an intelligent firewall
http://www.fiaif.net


