From: "Sascha Reissner" <sascha.reissner@toxicnet.de>
Subject: Re: Strange misunderstandings
Date: Fri, 31 May 2002 23:11:15 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <000d01c208e7$b36ba8c0$026410ac@winxp>
References: <001301c208d6$f3a956a0$6301a8c0@JJONES1>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
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
To: jjones@merlintechnologies.com, 'Iptables' <netfilter@lists.samba.org>

From: "John Jones" <jjones@merlintechnologies.com>

> Two issues, first issue is a simple question:
>
> [root] iptables -h
> ...
>   --check   -C chain            Test this packet on chain
> ...
>
> [root] iptables --check
> iptables v1.2.6a: Unknown arg `--check'
>
> What's up with that?  The help screen shows me it is a command, but it
> doesn't exist?  Is this an optional kernel compilation thing that is
> missing, or has it been removed from the distro?

if you try it with iptables -C it will work.. and result in.. tataaaa

"iptables: Will be implemented real soon.  I promise ;)" so it aint in there
yet.



