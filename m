From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: IPtables redirect rules
Date: Mon, 12 May 2003 23:05:14 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000201c318ca$2f0e69c0$0401000a@sterenborg.info>
References: <00ee01c318c4$8616be80$0a00a8c0@sic.local>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <00ee01c318c4$8616be80$0a00a8c0@sic.local>
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
To: 'Netfilter/IPTables Mailing List' <netfilter@lists.netfilter.org>

> VPN, but with Win2K. So I want to redirect all VPN=20
> requests from the linux machine to my Win2K server.=20
> How can I do that?

Patch the kernel with the latest patch-o-matic. You need the pptp
conntrack and nat modules.
Configure the kernel so that you get the pptp conntrack and nat modules,
then compile and install it.
Make sure you load the modules when you rebooted and everything goes
well.

The iptables rules :

iptables -P FORWARD DROP

iptables -A FORWARD -i <if_inet> -d <pptp_svr_ip> \
 -m state --state RELATED,ESTABLISHED -j ACCEPT

iptables -A FORWARD -i <if_inet> -d <pptp_svr_ip> \
 -p gre -j ACCEPT
iptables -A FORWARD -i <if_inet> -d <pptp_svr_ip> \
 -p tcp --dport 1723 -j ACCEPT

iptables -t nat -A PREROUTING -i <if_inet> -p gre \
 -j DNAT --to-destination <pptp_svr_ip>
iptables -t nat-A PREROUTING -i <if_inet> -p tcp \
 --dport 1723 -j DNAT --to-destination <pptp_svr_ip>


But I have to tell you (and I read it from other people too) : I got
this working in the past (with kernel 2.4.17), but somehow I can't get
it working anymore. So I installed the poptop server which works fine.


Gr,
Rob


