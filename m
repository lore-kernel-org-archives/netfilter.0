From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: NAT + NFS
Date: 12 Apr 2003 19:13:08 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1050189188.17682.23.camel@alpha.newkirk.us>
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
Content-Type: text/plain; charset="us-ascii"
To: doedelberlin@web.de
Cc: netfilter@lists.netfilter.org

On Fri, 2003-04-11 at 08:15, doedelberlin@web.de wrote:
> i have a Linux gateway performing NAT (SNAT and DNAT) with iptables_1.2.7a
> 
> on both sides there are UNIX machines (SOLARIS) 
> 
> telnet, ftp, ... works fine but when i mount on Solaris client a directory from 
> Solaris nfs server via gateway i have problems with performance.
> 
> it starts with "normal speed" but it gets worse and worse.
> after reboot of this gateway it is ok but then again the same game.
> 
> does anybody have experiences with this problem ?
> (best would be also a solution ... ;-)

Is the slowdown just of the NFS traffic, or everything?

j

> thank you
> ______________________________________________________________________________
> UNICEF bittet um Spenden fur die Kinder im Irak! Hier online an
> UNICEF spenden: https://spenden.web.de/unicef/special/?mc=021101
> 
> 


