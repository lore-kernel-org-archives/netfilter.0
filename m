From: Daniel <33.368460088@tootai.net>
Subject: nftables 0.9.8 - unknown rule handle
Date: Tue, 6 Jun 2023 12:30:06 +0200
Message-ID: <1ab13330-2469-adf1-89cb-96bb17c576d6@tootai.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
        t=1686047407; bh=BHCba9iHxUnFN66MdzSqlgg2aFVEV+OxckgmYu2dXd0=;
        h=Date:To:From:Subject:From;
        b=KaDuIfsEnQ2wqo9DgpnvhlZj2mcFVZA93aJdW9V/6oEE03+t5vaia+hW6zYClAmFy
         uccYrW9+DYGJq33Om5ZJuGax0rrdL6TzwKhU6Cuw4LVkTjk4+XAIvdquX++rCjP2TC
         fq+a0j0PNnGyu4n+t7xISoX00hKiDixBYMMmT6vw=
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
        t=1686047407; bh=BHCba9iHxUnFN66MdzSqlgg2aFVEV+OxckgmYu2dXd0=;
        h=Date:To:From:Subject:From;
        b=KaDuIfsEnQ2wqo9DgpnvhlZj2mcFVZA93aJdW9V/6oEE03+t5vaia+hW6zYClAmFy
         uccYrW9+DYGJq33Om5ZJuGax0rrdL6TzwKhU6Cuw4LVkTjk4+XAIvdquX++rCjP2TC
         fq+a0j0PNnGyu4n+t7xISoX00hKiDixBYMMmT6vw=
Content-Language: fr-FR
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi,

I face the above failure on mark rules. Ex:

chain TRACE_IN { # handle 6
  type filter hook prerouting priority -500; policy accept;
  iif "wig0" ip6 daddr fd99:a:b:98:10::ff1 meta nftrace set 1 # handle 7
}

chain TRACE_OUT { # handle 8
  type route hook output priority -500; policy accept;
  oif "lan" ip6 saddr fd99:a:b:98:10::ff1 meta nftrace set 1 # handle 9
}

nft monitor shows

trace id b606126c ip6 mangle TRACE_IN unknown rule handle 7 (verdict 
continue)
trace id b606126c ip6 mangle TRACE_IN verdict continue
trace id b606126c ip6 mangle TRACE_IN policy accept

trace id a7b94fc8 ip6 mangle TRACE_OUT packet: oif "lan" ip6 saddr 
fd99:a:b:98:10::ff1 ip6 daddr 2001:db8:c:b::1 ip6 dscp cs0 ip6 ecn 
not-ect ip6 hoplimit 64 ip6 flowlabel 283281 ip6 length 40 tcp sport 
5555 tcp dport 34618 tcp flags == 0x12 tcp window 65320
trace id a7b94fc8 ip6 mangle TRACE_OUT unknown rule handle 9 (verdict 
continue)
trace id a7b94fc8 ip6 mangle TRACE_OUT verdict continue
trace id a7b94fc8 ip6 mangle TRACE_OUT policy accept

I have this behavior also on all mark rules, ex:

chain output { # handle 2
  type route hook output priority mangle; policy accept;
  oif "lan" ip6 saddr fd99:a:b:98:10::ff1 meta mark set 0x00000100 ct 
mark set meta mark accept # handle 11
  oif "lan" meta mark set 0x00000000 ct mark set meta mark # handle 13
}

trace id a7b94fc8 ip6 mangle output unknown rule handle 11 (verdict accept)

chain postrouting { # handle 5
  type filter hook postrouting priority mangle; policy accept;
  meta mark 0x00000100 accept # handle 12
}

trace id a7b94fc8 ip6 mangle postrouting unknown rule handle 12 (verdict 
accept)

aso.

What's going on here ?
-- 
Daniel
