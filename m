From: Walther@gehag-dsk.de
Subject: Re: Ping With Iptables.
Date: Tue, 29 Oct 2002 15:54:25 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OF1644C4CE.760A7B3A-ONC1256C61.005168C6-C1256C61.005771E2@GEHAG-DSK.DE>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
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
To: =?iso-8859-1?Q?H=E9lio_Dubeux?= <hdubeux@hotmail.com>
Cc: netfilter@lists.netfilter.org

set your default policy to drop and allow forwarding icmp-echo-request and =

icmp-echo-reply from your local lan:

<--snip-->

iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP

iptables -A FORWARD -i $INT -o $EXT -p icmp --icmp-type echo-request -j=20
ACCEPT
iptables -A FORWARD -o $EXT -i $INT -p icmp --icmp-type echo-reply -j=20
ACCEPT

<--snip-->

this should work

Best Regards,
MfG.

Stefan Walther
stefan=5Fwalther@gehag-dsk.de
dienst.: +4930/89786448
Funk: +49172/3943961
http://www.gehag-dsk.de

--------------------------------------------------------------=20
Linux/UNIX is like an Indian Tipi:
No Windows, no Gates and Apache inside.

Outgoing Mail is certified mistake-free.=20
Examined by DOGMATIC infallibility system.=20
Version 6.04




H=E9lio Dubeux <hdubeux@hotmail.com>
Sent by: netfilter-admin@lists.netfilter.org
29.10.2002 14:51

=20
        To:     netfilter@lists.netfilter.org
        cc:=20
        Subject:        Ping With Iptables.


Hi, everybody. This is my first message here and i hope you can help me.
I have a Linux Box as a Gateway of my network. And i want do allow=20
internal=20
machines to ping the Internet but i also want to block external machines=20
to=20
ping my Gateway. Is this is possible plz send me something... Thanx.

----------------------
H=E9lio Dubeux Neto




=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
MSN Hotmail, o maior webmail do Brasil. http://www.hotmail.com






