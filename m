From: Tomas Mudrunka <mudrunka@spoje.net>
Subject: Re: Traffic shaping with nftables maps and tc
Date: Fri, 03 Nov 2017 13:37:50 +0100
Message-ID: <79baac2c7d201c134a2852cca86b5bce@spoje.net>
References: <62018f4d1c124ef84a7bd2281b1b2dcc@spoje.net>
 <392d67152072ea965fd56fbe6efefab7@spoje.net>
 <CAOkSjBh8H2tn6noj9BrbGcwdk4nnjZxm-4TiTVyhm+jciSYCew@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=spoje.net;
        s=spojemail; t=1509712672;
        bh=bJ7rSzMGBqbDSSSS9d9w46lX0t4m2xa21i+ju42F3Io=;
        h=Date:From:To:Subject:In-Reply-To:References:From;
        b=lXQo9c52S63j5ZQhygl0AHyf/GB4GsJxy3pghNMXyM9ILkeV9HU7n9QoLwlxKs3ff
         7gnMJ/Fn/+v1hyaEqBOPGfCjRyycJetUIVLZH2LhXr4oI1+cNlhKkdzxHs1c96wnJH
         4F0Nsq/tscDeLKYvFFnmsGXBAVONwP8RZkY+UOMo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=spoje.net;
        s=spojemail; t=1509712670;
        bh=bJ7rSzMGBqbDSSSS9d9w46lX0t4m2xa21i+ju42F3Io=;
        h=Date:From:To:Subject:In-Reply-To:References:From;
        b=fcvkNi+xKADeQ3v6YlNldy2QqIGUJx/v9UuLjUKRfB+7tECcFtxdGEseOH991JtzM
         kKIP7AVm0hMKzfTrgr3GGxj1PeGOPfu5YA/Kj2dfPjZ9m/s20LiO3MyOgR7onkNTxt
         zi2JK3mmSlbIF3wlx+T3ZpJ1iSvnZIdYt9Mv8Vl8=
In-Reply-To: <CAOkSjBh8H2tn6noj9BrbGcwdk4nnjZxm-4TiTVyhm+jciSYCew@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Netfilter Users Mailing list <netfilter@vger.kernel.org>

> Try this:
> meta priority set ip daddr map { 1.1.1.2 : 2:2222, 1.1.1.3 : 3:3333 }

Thank you, that looks promising. However is there way to name this map, 
so i can dynamicaly edit it? I've checked nft describe:

$ nft describe ip daddr
payload expression, datatype ipv4_addr (IPv4 address) (basetype 
integer), 32 bits

$ nft describe meta priority
meta expression, datatype classid (TC classid) (basetype integer), 32 
bits

But then later "classid" seems to fail when name defining table:

#  nft add map filter deucalion { type ipv4_addr : classid\; }
<cmdline>:1:45-51: Error: syntax error, unexpected classid, expecting 
string or dscp or ecn or mark
add map filter deucalion { type ipv4_addr : classid; }
                                             ^^^^^^^
<cmdline>:1:26-52: Error: map definition does not specify key data type
add map filter deucalion { type ipv4_addr : classid; }
                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^
Same goes for this:

	map deucalion {
		type ipv4_addr : classid;
		elements = { 1.1.1.2 : 2:2222, 1.1.1.3 : 3:3333 }
	}


	chain input {
		type filter hook input priority 0; policy accept;
		meta priority set ip daddr map @deucalion;
	}


-- 
S pozdravem
Best regards
      Tomáš Mudruňka - SPOJE.NET s.r.o.
