From: Peter Warasin <peter@endian.com>
Subject: Re: CONNMARK udp comprehension question
Date: Fri, 30 Nov 2007 17:50:33 +0100
Message-ID: <47503F59.8040102@endian.com>
References: <474B2C65.1060706@endian.com> <474B7458.1090307@login-lanstation.de>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------020001070009030003070200"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <474B7458.1090307@login-lanstation.de>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
To: =?ISO-8859-1?Q?J=F6rg_L=FCbbert?= <j.luebbert@login-lanstation.de>
Cc: netfilter@vger.kernel.org

This is a multi-part message in MIME format.
--------------020001070009030003070200
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi J=F6rg

Thanks for your answer. Much appreciated!

J=F6rg L=FCbbert wrote:
> This might help you without the need to mess with marks.
> For each uplink interface with an incremental $x
> alternatively use -j CONNMARK --restore-mark in -t mangle PREROUTING so
> that ip rules can match the mark or as a 3rd option use the ROUTE target.


Actually i have it already like you mentioned:

----------------------------
ip rule add from 192.168.75.0/24 lookup uplink-uplink1
ip route add default via 192.168.75.1 table uplink-uplink1

ip rule add from 192.168.69.0/24 lookup uplink-main
ip route add default via 192.168.69.1 table uplink-main
----------------------------

this should be ok for connections starting from the box, but seems that
is not for udp connections.

this works for connections passing through the box and also for tcp
connections
going to the box.

----------------------------
ip rule add prio 200 fwmark 0x20 lookup uplink-uplink1
ip rule add prio 200 fwmark 0x40 lookup uplink-main

-A PREROUTING -j INMARK -m state --state NEW
-A PREROUTING -j STOREMARK -m state ! --state NEW
-A INPUT -j INMARK -m state --state NEW
-A OUTPUT -j STOREMARK -m state ! --state NEW

-A INMARK -i eth3 -j CONNMARK --set-mark 0x20
-A INMARK -i eth4 -j CONNMARK --set-mark 0x40

-A STOREMARK -m connmark ! --mark 0x0 -j CONNMARK --restore-mark
----------------------------


but not for udp.

should'nt this work?

if i put in ulog rules i see that udp packets certainly will be
marked when coming in but don't have a mark when will going out.

just to know that i am not completely wrong.

peter

--=20
:: e n d i a n
:: open source - open minds

:: peter warasin
:: http://www.endian.com   :: peter@endian.com

--------------020001070009030003070200
Content-Type: text/x-vcard; charset=utf-8;
 name="peter.vcf"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="peter.vcf"

begin:vcard
fn:Peter Warasin
n:;Peter Warasin
org:Endian GmbH/Srl
adr:;;Pillhof 47;Frangart/Frangarto;BZ;I-39010;Italien/Italia
email;internet:peter@endian.com
tel;work:+39 0471 631763
tel;fax:+39 0471 631764
x-mozilla-html:FALSE
url:http://www.endian.com
version:2.1
end:vcard


--------------020001070009030003070200--
