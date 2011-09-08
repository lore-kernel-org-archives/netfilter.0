From: Nikolay Kichukov <hijacker@oldum.net>
Subject: Re: [half_OT]Traffic shaping with tc and iptables
Date: Thu, 08 Sep 2011 17:57:07 +0300
Message-ID: <4E68D7C3.9010005@oldum.net>
References: <CAGRr-qktvGncegdp+7X7Xb7Q9L0Q+FAn3+gPHGy+XJhDRtkQYg@mail.gmail.com>	<4E688763.2060209@freemail.hu>	<CAGRr-qm4gF8ZzvE9D5vXb-RLKXiELsj_P8KrOk9aOHTWRK01kQ@mail.gmail.com>	<4E68A50B.5000901@freemail.hu>	<CAGRr-qnYAGqqw8pt2CAzffs+9aL9LCQ9dcVN1NL61NzKHP9ZkA@mail.gmail.com>	<4E68B39D.60703@freemail.hu> <CAGRr-qn=ngiO6oNdecnpa5BRcTBEJuZzd3g+JOk015P84JV0JA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=oldum.net; s=mail;
	t=1315493840; bh=IJHfR928hUF6cB2J7OaLzMbFCWCYGqqbTWiipG+o+Ig=;
	h=Message-ID:Date:From:MIME-Version:To:CC:Subject:References:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	b=w2fI4ZVjNeQgyvFgdIquERNMAGbHzkqfU43TS9X4QB9m86Ra3zKuISl1v3w89Tg1h
	 Zsf0H9aXlFq//GmqIEwZL08M1QPGQfr/IskzqLpUcN1gpXI7wqNiuy8hHhIaeUI86Z
	 duIWshHZCEahwMyqErZlHN0SshW9UQECiu/bAo98=
In-Reply-To: <CAGRr-qn=ngiO6oNdecnpa5BRcTBEJuZzd3g+JOk015P84JV0JA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Marco Coda <marco.coda7@gmail.com>
Cc: netfilter@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,
#create engress htb shaper:
tc qdisc add dev $IF root handle 1: htb
#setup some iface limits
tc class add dev $IF parent 1: classid 1:1 htb rate ${MAXOUT}kbit ceil =
${MAXOUT}kbit burst 50kb

#add subclass for your application attached to the root class 1:1 - 1:1=
0, set proper ceil value!
tc class add dev $IF parent 1:1 classid 1:10 htb rate 128kbit ceil ${MA=
XOUT}kbit prio 1 burst 5kb

#then just add filters, in that case port 53 - DNS
tc filter add dev $IF parent 1:0 protocol ip prio 10 u32 match ip dport=
 53 0xffff flowid 1:10


you are good to go!
tc qdisc -s show dev $IF

will tell you what is going on.

HTH,
- -N

On 09/08/2011 05:00 PM, Marco Coda wrote:
> 2011/9/8 G=C3=A1sp=C3=A1r Lajos <swifty@freemail.hu>:
>=20
>=20
>> - If you send an e-mail then you connect from your system (from a ra=
ndom
>> port) to a mail server (to 25)...
>> Would you try with my proposed settings???
>=20
> I just tried it, with rare 1Mbit, bandwidth 2 Mbit and iptables with
> --dport 25 and, even if the iptables rule is matched (I can see the
> packet count measuring the right size of the mail), tc seems to ignor=
e
> those packets. I know that my postfix open a connection to another mt=
a
> from a pseudo-random port to 25, but with --dport option tc does not
> consider these packets. Instead, with --sport option, I don't know
> why, something is filtered...
>=20
>> - If you set your upload limit to 10kbit then you can send 1,25KByte=
 per
>> sec. (It is veeerrryy slooow.)
>=20
> In this moment I set this speed so I can test the server with small
> attachments... When the script will be definitively complete,I'll set
> the real values..
>=20
>=20
> 2011/9/8 Nikolay Kichukov <hijacker@oldum.net>:
>=20
>> tc does not require iptables to shape traffic at all. So why botheri=
ng?
>=20
> I want to limit only one port, not the entire interface. I don't want
> other ports (such as pop3 or imap) limited
> So I used iptables for marking and then tc filter handle fw for filte=
ring..
> How should i do?
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJOaNfCAAoJEDFLYVOGGjgXIcsIAKTB5Azc5860kSvNmyLjaDTH
WgZfmiPzoyuSK88WhXaIVBXcwLgpBVVqkZZRV3AyXKQ/ucTGax6daDZdmINw+i53
YIkKzQCknaEff/WdVCfVi404OERxz/tzUwHAqN4/DsS7/h55XPkpmBEgUahIYeWP
3RQZ9mNFkzpdYWnoLefFgtgBjxecShocQ2wyRAybl4KJQnl+5tv+tTQqiOQ0t6Cz
aPyX4w26qaluQiSTQ6SXeJ846HWASjvAt3KIXaS1xc9c000OeGT0vHCLBf+I5whE
sghiHVMBqcF8IVs+s+2vVn200d2MSzfhtz2llYAiEqxExXOhQ1y6nm8k1XSqfu8=3D
=3Dip57
-----END PGP SIGNATURE-----
