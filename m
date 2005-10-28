From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: why can't use connlimit ??
Date: Fri, 28 Oct 2005 09:13:00 +0200 (CEST)
Message-ID: <64005.193.173.147.3.1130483580.squirrel@webmail.sterenborg.info>
References: <43a0cdcb0510272319m69a7a1d4g@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <43a0cdcb0510272319m69a7a1d4g@mail.gmail.com>
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

On Fri, October 28, 2005 08:19, Buddy wu wrote:
>    I want to use connlimit to set the connections of each person to a
> certain number, but when I add a rule using iptables, error occured
> like these:
>
> [root@server1 linux]# /sbin/iptables -A INPUT -m connlimit
> --connlimit-above 6 -j DROP
> iptables: No chain/target/match by that name
>
>    I have searched for this problem, someone said it maybe need to
> load the ipt_connlimit module. I tried it, but it can not work. I
> doubted that I have the wrong command.
>    first I use '/sbin/modprobe ipt_connlimit' command ,and then I
> reaceive the error 'FATAL: Module ipt_connlimit not found.'
>    second, I use '/sbin/modprobe /lib/iptables/libipt_connlimit.so'
> and then error comes again 'FATAL: Module
> /lib/iptables/libipt_connlimit.so not found.'

Do you *have* ipt_connlimit ? (Try : "locate ipt_connlimit")

Also, AFAIK such module would be in
"/lib/modules/<kernel-version>/kernel/net/ipv4/netfilter".


Gr,
Rob



