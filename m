From: "Voltaire Pascual" <voltaire@voltaire.servebeer.com>
Subject: Re: Static compile issues - same problem.
Date: Sat, 31 May 2003 20:50:51 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001901c32773$44f90a80$6400a8c0@homes>
References: <Pine.LNX.4.30.0305270725050.7597-100000@phear.lwz.org>
Reply-To: "Voltaire Pascual" <voltaire@voltaire.servebeer.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: Cory Visi <merlin@phear.lwz.org>, netfilter@lists.netfilter.org

Anyone have solution to this problem yet? I have patched 2.4.20 with
ipt_pptp_conntrack successfully (static/module) but i cant use NAT in the
firewall after.

# iptables -t nat -A POSTROUTING -o $EXTERNAL -s $INTERNAL_NETWORK -j SNAT
--to-source $EXTERNAL_IP
Invalid argument

Appreciate your help.


----- Original Message -----
From: "Cory Visi" <merlin@phear.lwz.org>
To: <netfilter@lists.netfilter.org>
Sent: Tuesday, May 27, 2003 7:42 PM
Subject: Static compile issues


> I am using a 2.4.20 kernel with pom-20030107 and iptables v1.2.7a. From
> pom-20030107, I have installed all the pending patches and all the base
> patches. In addition, I have installed the following extra patches:
>
> ipt-amanda-conntrack-nat
> ipt-eggdrop-conntrack-nat
> ipt-proc
> ipt-mms-conntrack-net
> ipt-pptp-conntrack-net
> ipt-quake3-conntrack-net
> ipt-rsh-conntrack-net
> ipt-tftp-conntrack-net
>
> The patch names are not official or anything. I just split them up and
> called them that. Hopefully, the name is clear enough to you to recognize
> an "extra" patch. Please let me know if this is confusing.
>
> The problem is, when I compile the kernel statically and enable all the
> iptables options, I cannot do NAT. Any iptables line that specifies a
> chain in the nat table causes an Invalid Argument:
>
> # iptables -t nat -A POSTROUTING -o $EXTERNAL -s $INTERNAL_NETWORK -j SNAT
> --to-source $EXTERNAL_IP
> Invalid argument
>
> Another interesting thing to point out, is that I also compiled this
> kernel with modules and experienced the same problem. I was, however, able
> to fix it by disabling the IPv4 netfilter option for "NAT of local
> connections". For the module kernel, disabling this option fixes the
> problem. For the staticly compiled kernel, disabling this option has no
> effect-- the error persists.
>
> Anyone have any ideas?
> Please CC me directly if you respond to the list, since I am not
> subscribed (yet).
>
> Thank you,
> Cory Visi
>
>


