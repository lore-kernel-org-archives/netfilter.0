From: Nikolay Kichukov <hijacker@oldum.net>
Subject: Re: [half_OT]Traffic shaping with tc and iptables
Date: Thu, 08 Sep 2011 15:40:55 +0300
Message-ID: <4E68B7D7.5080201@oldum.net>
References: <CAGRr-qktvGncegdp+7X7Xb7Q9L0Q+FAn3+gPHGy+XJhDRtkQYg@mail.gmail.com>	<4E688763.2060209@freemail.hu>	<CAGRr-qm4gF8ZzvE9D5vXb-RLKXiELsj_P8KrOk9aOHTWRK01kQ@mail.gmail.com>	<4E68A50B.5000901@freemail.hu> <CAGRr-qnYAGqqw8pt2CAzffs+9aL9LCQ9dcVN1NL61NzKHP9ZkA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=oldum.net; s=mail;
	t=1315485667; bh=LlOym0qfV7HE5Nlb7H9v7w1NLMq3ifgt6pwlMSmlDWo=;
	h=Message-ID:Date:From:MIME-Version:To:CC:Subject:References:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	b=iYU6vH8Wpi8oBnzIufF+7kJRbtZgkglNyNN8DFwP2YGdD1lTjd0Q67s5/nVBWhyCe
	 mVtOc7BcH4i1qF7WoYa0C3eugPXPYJsdwbR+Y28k9FkVxJgPoS4N5qU0krg2bPT1XY
	 HFs9JJ3dlzz5poeukq6KymCtL8fF7tqEgRgWVXL0=
In-Reply-To: <CAGRr-qnYAGqqw8pt2CAzffs+9aL9LCQ9dcVN1NL61NzKHP9ZkA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Marco Coda <marco.coda7@gmail.com>
Cc: netfilter@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,
tc does not require iptables to shape traffic at all. So why bothering?

Cheers,
- -Nik

On 09/08/2011 03:10 PM, Marco Coda wrote:
> 2011/9/8 G=C3=A1sp=C3=A1r Lajos <swifty@freemail.hu>:
>=20
>> $IPTABLES -t mangle -A OUTPUT -p tcp -o $nic --dport $port -j MARK -=
-set-mark 1
>=20
> With this rule it does not work at all.. :(
> At least before, even if I understand that concectually is not
> correct, with --sport, traffic was shaped, in some manner, whth a
> strange rate..
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJOaLfXAAoJEDFLYVOGGjgXG7UIAKW+y7j/t5R25HHYRYamaX5e
xZ5L+2TDS4KSsAjGQXq6ZvRhm/Z1QUWSL4U0qBbPZQNuw1KP2d/z+u6yuFe1XBPK
DBedlFlg6l7+O8H0ruyv8RXULRDTOkzQY9jXkh4qV/eJQy36+4Yg4D4JIwgqlf2r
MszARiQycw4Za6zX630tOwnl8bbZ30ifJUs6ZabZVrV45tY0JXV2y7lRuajBLb8q
=46oUPJPA7hxYwR6VzzNQJN0/WWZ4VDXKV0nGPUitCtdZvsO1iUb74ZeR+bpxTQZr6
4Y52UaUp4XUEuHr69BPt0C+C35Pk6O9hSUaD4UUWQU1zB7quC2wlrZ8ZqtJd/c8=3D
=3DNrKl
-----END PGP SIGNATURE-----
