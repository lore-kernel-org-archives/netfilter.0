From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: FTP and netfilter
Date: Wed, 23 Apr 2003 20:34:23 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <002e01c309c6$f6712290$0401000a@sterenborg.info>
References: <NIENICGJBBAFMLFBMABHOEPACDAA.matti.luoma@bitboys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <NIENICGJBBAFMLFBMABHOEPACDAA.matti.luoma@bitboys.com>
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
To: 'Matti Luoma' <matti.luoma@bitboys.com>, netfilter@lists.netfilter.org

> What kinda lines i need to get FTP working from from LAN, if=20
> i use a linux as gateway machine..

insmod ip_conntrack_ftp
insmod ip_nat_ftp

iptables -P FORWARD DROP
iptables -A FORWARD -I <eth_lan> -o <eth_inet> -s <net_lan> -j ACCEPT

iptables -t nat -A POSTROUTING -s <net_lan> -o <eth_inet> -j SNAT
--to-destination <ip_inet>
(Or, if you have a dynamic IP or a ppp inet nic :)
iptables -t nat -A POSTROUTING -s <net_lan> -o <eth_inet> -j MASQUERADE


Gr,
Rob


