From: Merlin =?ISO-8859-1?Q?B=FCge?= <toni@bluenox07.de>
Subject: Re: nftables: How to filter only ipv6 SSH traffic in an inet table?
Date: Thu, 8 Feb 2018 04:14:15 +0100
Message-ID: <20180208041415.96bade9856ee027fbab56fd5@bluenox07.de>
References: <20180206172809.f7a238e06cef71d52ec92ae0@bluenox07.de>
        <20180207003251.GA2621@dimstar.local.net>
        <20180207192632.6h2xczcmnpgai4yk@salvia>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="Multipart=_Thu__8_Feb_2018_04_14_15_+0100_yR+u5kiouLiQHil3"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20180207192632.6h2xczcmnpgai4yk@salvia>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

This is a multi-part message in MIME format.

--Multipart=_Thu__8_Feb_2018_04_14_15_+0100_yR+u5kiouLiQHil3
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, 7 Feb 2018 20:26:32 +0100
Pablo Neira Ayuso <pablo@netfilter.org> wrote:

> > Could you possibly post all of the output from nft list ruleset?

Of course, I attached a textfile showing all the commands and output,
and commenting what I don't understand / does not seem to work.

I also uploaded the textfile: http://termbin.com/8zql

Let me know if you need anything else.


> We need to keep ip6 nexthdr around, since this is implicitly
> restricting to match only IPv6 in the inet chain, where we can see
> IPv4 and IPv6 traffic.
>=20
> Looking into this.

So, are you saying that nftables is not behaving as intended, or am I
doing something wrong? I'm new to networking and nftables, so I'm not
sure my commands in the attached textfile are actually correct...


Thanks!

--=20
Merlin B=FCge <toni@bluenox07.de>

--Multipart=_Thu__8_Feb_2018_04_14_15_+0100_yR+u5kiouLiQHil3
Content-Type: text/plain;
 name="nftables_issue.txt"
Content-Disposition: attachment;
 filename="nftables_issue.txt"
Content-Transfer-Encoding: 7bit

[root@host test]# nft flush ruleset
[root@host test]# nft add table inet filter
[root@host test]# nft add chain inet filter input { type filter hook input priority 0 \; policy drop \; }
[root@host test]# # filtering all IPv6 SSH traffic doesn't work:
[root@host test]# nft add rule inet filter input ip6 nexthdr tcp tcp dport ssh accept
[root@host test]# nft add rule inet filter input meta nfproto ipv6 tcp dport ssh accept
[root@host test]# nft list ruleset
table inet filter {
	chain input {
		type filter hook input priority 0; policy drop;
		tcp dport ssh accept
		tcp dport ssh accept
	}
}
[root@host test]# # filtering all IPv6 traffic or all IPv6 TCP traffic seems to work:
[root@host test]# nft add rule inet filter input meta nfproto ipv6 accept
[root@host test]# nft add rule inet filter input ip6 nexthdr tcp accept
[root@host test]# nft list ruleset
table inet filter {
	chain input {
		type filter hook input priority 0; policy drop;
		tcp dport ssh accept
		tcp dport ssh accept
		meta nfproto ipv6 accept
		ip6 nexthdr tcp accept
	}
}
[root@host test]# # but this also does not work:
[root@host test]# nft add rule inet filter input meta nfproto ipv6 meta l4proto tcp accept
[root@host test]# nft list ruleset
table inet filter {
	chain input {
		type filter hook input priority 0; policy drop;
		tcp dport ssh accept
		tcp dport ssh accept
		meta nfproto ipv6 accept
		ip6 nexthdr tcp accept
		meta l4proto tcp accept
	}
}
[root@host test]# 


--Multipart=_Thu__8_Feb_2018_04_14_15_+0100_yR+u5kiouLiQHil3--
