From: "Leonardo Rodrigues ( listas )" <leolistas@solucoesip.net>
Subject: Re: problem with "-m owner" in kernel 2.4.20
Date: Thu, 5 Dec 2002 17:24:37 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001401c29c9c$55990c80$3201a8c0@leonardo>
References: <7a7vuu078d02e40u64231r4vpfgrvespap@4ax.com>
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
To: netfilter@lists.netfilter.org


    I got similar problems with several targets, including DNAT and SNAT !!!
How do I solve the problem ? Simply recompiling iptables with the newer
kernel running !!

    And, as usual, you should check if your kernel is really compiled with
ipt_owner support. You can do that with the command 'modinfo ipt_owner'. If
it shows ipt_owner module informations, that's fine. If it shows 'no module
by that name found', your kernel wasnt compiled with that iptables module
option.

    Sincerily,
    Leonardo Rodrigues

----- Original Message -----
From: "Torben Nielsen" <m@l4l.dk>
To: <netfilter@lists.netfilter.org>
Sent: Thursday, December 05, 2002 3:45 PM
Subject: problem with "-m owner" in kernel 2.4.20


Can anyone tell why the below shown line fails when running kernel version
2.4.20 but not when
running  kernel 2.4.19.

/usr/local/sbin/iptables -A OUTPUT -o eth0 -m owner --uid-owner root -j
ACCEPT
iptables: Invalid argument


