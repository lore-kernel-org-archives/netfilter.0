From: Tony Earnshaw <tonye@billy.demon.nl>
Subject: Re: [BUG] compile failure for linux-2.6.6
Date: Sat, 29 May 2004 12:19:36 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1085825976.9862.136.camel@localhost>
References: <0DFFBB11-B0DA-11D8-8EBC-0003931E0B62@gmx.li>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <0DFFBB11-B0DA-11D8-8EBC-0003931E0B62@gmx.li>
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
To: netfilter@lists.netfilter.org

fre, 28.05.2004 kl. 21.05 skrev Martin Schaffner:

> Currently, netfilter relies on the headers from a previous linux 
> version being installed on the system.
> If I try to compile netfilter from linux-2.6.6 with only the 2.6.6 
> headers installed in /usr/include,
> then net/ipv4/netfilter/ipt_ECN.c doesn't compile, because it uses 
> struct ipt_ECN_info,
> which isn't declared anywhere in the source tree of linux-2.6.6.
> The same holds for IPT_ECN_OP_* macros.

I posted more or less the same a few days ago - pointed 1.2.10 at my
2.6.4 kernel source and everything works ;) Don't much like workarounds
like that, though ...

--Tonni

-- 

We make out of the quarrel with others rhetoric
but out of the quarrel with ourselves, poetry.

mail: tonye@billy.demon.nl
http://www.billy.demon.nl


