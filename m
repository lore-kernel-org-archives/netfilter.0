From: Gert.Vandelaer@medisearch-int.com
Subject: Re: masquerading setting bogus source IP address
Date: Wed, 11 Sep 2002 10:52:57 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OF65B32C17.2F140FDE-ONC1256C31.003030A8-C1256C31.0030C91E@medisearch-int.com>
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
To: Stefan Praszalowicz <stefan@avedya.com>
Cc: netfilter@lists.netfilter.org


Hya,

first of all, I'd like to start by asking why you had to reboot the ser=
ver
?

After knowing that, there might be some more clues to follow ...
Your problem fixer is not going to last because masq is the same as sna=
t,
with the difference that snat does not handle dynamic ip's (explained i=
n
docs ...)

What IP range does your lan have ?  What is the IP (if any at all) of t=
he
nic connected to the DSL router ?

Cya,
Gert



                                                                       =
                                                                    =20
                    Stefan Praszalowicz                                =
                                                                    =20
                    <stefan@avedya.com>              To:     netfilter@=
lists.netfilter.org                                                 =20
                    Sent by:                         cc:               =
                                                                    =20
                    netfilter-admin@lists.net        Subject:     masqu=
erading setting bogus source IP address                             =20
                    filter.org                                         =
                                                                    =20
                                                                       =
                                                                    =20
                                                                       =
                                                                    =20
                    10/09/2002 08:04 PM                                =
                                                                    =20
                                                                       =
                                                                    =20
                                                                       =
                                                                    =20




Hi guys,

We're using a Linux 2.4 box as an ASDL gateway for our company office.

Today after rebooting this server we catched a very strange problem...

The gateway itself could access the net, but not the masqueraded machin=
es.
Running tcpdump, we saw that the gateway was setting the wrong source I=
P
for the masqueraded connections.

Basically, the packets it sent had src-addr set to 10.0.0.0.

After restarting the pppoe/PPP link to the dsl modem, the source IP see=
med
to be incremented. I don't know for sure but at one point the IP was
10.0.0.17 and next 10.0.0.18.

I solved the problem by adding a SNAT rule before the MASQ one:
iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE
iptables -t nat -I POSTROUTING 1 -j SNAT --to 217.128.104.14

Has anybody seen this before ?
Could it be related to the order in which we start things (like ppp,
firewall scripts, ...)

Thanks anyway

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Some details about the tcpdump results:

** packets originating from the masqueraded hosts, with bogus src ip:

19:09:19.693511 10.0.0.0.33514 > 128.8.10.90.domain:=A0 29756 A?
tracker.ambrosia.net. (38) (DF)
19:09:19.693539 10.0.0.0.33514 > 193.252.19.3.domain:=A0 17779+ A?
login.oscar.aol.com. (37) (DF)
mail.avedya.com. (33) (DF)
19:09:20.693477 10.0.0.0.33514 > 128.63.2.53.domain:=A0 6018 A?
mail.edi-presse.fr. (36) (DF)

** packets originating from the gateway itself, src is OK
19:09:23.985905 217.128.104.14.1049 > 193.252.19.3.domain:=A0 11374+ A?=

yahoo.com. (27) (DF)
19:09:24.128264 193.252.19.3.domain > 217.128.104.14.1049:=A0 11374 2/5=
/5 A
66.218.71.198, A 64.58.79.230 (229) (DF)



=



