From: "Lombardo Federico" <egopfe@hotmail.com>
Subject: Re: Re: how to drop out of state packets
Date: Thu, 17 Jul 2003 17:24:16 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Law14-OE39TcS51LfJv00009797@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

but, If I put these rule for first for example:

iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -m state --state NEW -p tcp ! --syn -j DROP

these mean for connection tracking that if I receive a packet, with all flag
not equal to SYN, that not belongs to any ESTABLISHED or RELATED connection,
netfilter will DROP the packet.

so, I think that this mean that it will drop any out of state packets, also
ACK out of state, isnt'it ?



>Le lun 07/07/2003 =E0 17:38, Lombardo Federico a =E9crit :
>> INVALID state also matches ACK out of state packets ?
>
>Unless you've patched your kernel with tcp-no-pickup patch, no.
>
>--=20
>C=E9dric Blancher  <blancher@xxxxxxxxxxxxxxxxxx>
>Consultant en s=E9curit=E9 des syst=E8mes et r=E9seaux - Cartel S=E9curit=
=E9
>T=E9l: +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
>PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE

