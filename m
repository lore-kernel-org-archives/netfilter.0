From: Anatole Denis <anatole@rezel.net>
Subject: Re: Question regarding nft and tables
Date: Sat, 05 Aug 2017 14:45:19 +0100
Message-ID: <1501940719.30971.0@smtp.rezel.net>
References: <88DDA058-C2B7-4D1E-92F2-2F9198FD4EC5@nativemethods.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Filter: OpenDKIM Filter v2.11.0 inara.rezel.net D7C99C07F0A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rezel.net; s=dedi;
        t=1501940722; bh=7UUhConVmzvr/WQPpCiLhAFVaj7DiCc48Oqj2QrBtkI=;
        h=Date:From:Subject:To:Cc:In-Reply-To:References:From;
        b=t21Lba7u2IfmsPehpbH8X6j+S4BLPavUyJGGAeQKrQw9KISQ2SRXFYBucTPrITCnL
         AbtMa8j4qDjPHSX2ooiqV7zK2YmV6bJ1ZH75vyIwSOyATE2XgN2shjET/j9ST7FG3A
         JS+YERdbvGPtZu3bf7bXBEMd27ltHHmL76JewgBbLMX2j/HaeZoU6hp26Ufgjjka82
         1mlgrBgKllfcw4xhbaPvCR/dwuWAGUQoCiddg3nHRh7iKS+LcV2F1D0aXFRidgZpw/
         tBzOIDw04m6oD/oGqFJhpbRhZgLB2MfXE47FFv7du+22BJJqKNPw7G3SR2SOI7EOO1
         T445g6suPxE7g==
In-Reply-To: <88DDA058-C2B7-4D1E-92F2-2F9198FD4EC5@nativemethods.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="macroman"; format="flowed"
To: J Doe <general@nativemethods.com>
Cc: netfilter@vger.kernel.org

On ven., ao=C3=BBt 4, 2017 at 6:51 , J Doe <general@nativemethods.com>=20
wrote:
> Hi,
>=20
> I am new to nftables and have been experimenting with the syntax.  I=20
> am working on Ubuntu 16.04.3 LTS server with a kernel of 4.4.0.  I=20
> have installed the nftables package and nft is version 0.5.

This is a very old version, you *will* encounter bugs that have been=20
fixed since and you will miss several new features. The current version=20
is 0.7 and I would even encourage anyone to attempt to use the latest=20
git if anything seems not to work as expected even in 0.7.

>=20
> My goal is to create two tables - one of protocol family ip and one=20
> of protocol family inet.  To do so, I issued the following commands:
>=20
> $ sudo nft add table ip filter_ip
> $ sudo nft add table inet filter_inet
>=20
> I then create chains for inbound and outbound traffic:
>=20
> $ sudo nft add chain ip filter_ip input { type filter hook input=20
> priority 0 \; }
> $ sudo nft add chain ip filter_ip output { type filter hook output=20
> priority 0 \;}
> $ sudo nft add chain inet filter_inet input { type filter hook input=20
> priority 0 \; }
> $ sudo nft add chain inet filter_inet output { type filter hook=20
> output priority 0 \; }
>=20
> I then attempt to allow inbound and outbound traffic on the loop back=20
> interface:
>=20
> $ sudo nft add rule inet filter_inet input iif lo accept
> $ sudo nft add rule inet filter_inet output iif lo accept
>=20
> I then list the tables:
>=20
> $ sudo nft list tables
> table ip filter_ip
> table inet filter_inet
>=20
> But when I attempt to view the loop back rules in filter_inet, I get=20
> the following:
>=20
> $ sudo nft list table filter_inet
> <cmdline>:1:1-22: Error: Could not process rule: Table 'filter_inet'=20
> does not exist

In any command, when specifying a table that is not in the ip family,=20
you need to precise the family, just like you did in the add command.
Here, for example, you would use:

$ sudo nft list table inet filter_inet

You can also have multiple tables with the same name, if they don't=20
have the same family, so you could have named both your tables filter,=20
and distinguished between them using only the family:

$ sudo nft add table ip filter
$ sudo nft add table inet filter

$ sudo nft add chain ip filter input { type filter hook input priority=20
0 \; }
$ sudo nft add chain inet filter input { type filter hook input=20
priority 0 \; }
etc.

A note: if you have an inet table, you probably don't need an ip table=20
as well, as you can specify the network protocol in specific rules in=20
the inet table by prefixing them with `meta nfproto ipv4` or `meta=20
nfproto ipv6` when needed, and not have to repeat common rules.

--
Anatole Denis
=

