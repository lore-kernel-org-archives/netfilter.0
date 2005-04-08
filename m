From: "Ilo Lorusso" <sneak@ipnoc.co.za>
Subject: Re: Redirecting mail
Date: Fri, 8 Apr 2005 13:38:06 +0200
Message-ID: <001701c53c2f$6f97dc80$648045ac@sneak>
References: <MS_LEU1tDJt12e1s8HA000007ef@smtp.ttp.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: Rob Sterenborg <rob@sterenborg.info>
Cc: netfilter@lists.netfilter.org

> The networks seem to be connected, so can't you just configure a
> smtp-forwarder in your MTA configuration ? That would be easier I think.

I'd prefer just using iptables, so i can redirect when i need to..



> There is no need to use multiport because you only DNAT 1 port : smtp.
> But that should not be a problem.
>
> iptables -t nat -A OUTPUT -p tcp --dports smtp \
> -j DNAT --to-destination 192.168.12.56


if I try it without the multiport option i get the following error..

[root@posjia0h01 root]# iptables -t nat -A OUTPUT -p tcp --dports smtp -j
DNAT --to-destination 192.168.12.56
iptables v1.2.5: Unknown arg `--dports'
Try `iptables -h' or 'iptables --help' for more information.



And no I dont have any rules blocking this from working as shown below, but
would i need any iptables rules to make it work maybe? (like enable
ipforwarding and maybe a forward rule, im not sure)



[root@prxsaa0z02 root]# iptables -L
Chain INPUT (policy ACCEPT)
target     prot opt source               destination

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination
[root@prxsaa0z02 root]# iptables -L -t nat
Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination


