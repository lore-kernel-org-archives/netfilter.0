From: Ruben Di Battista <rubendibattista@gmail.com>
Subject: Re: How to allow traffic over VPN across namespaces using nftables
Date: Mon, 10 Oct 2022 20:00:14 +0200
Message-ID: <CACnYWRfUYjXkA13TtpZ1jirTM2k=MQE4nSMXh69WnmwYNdJFJA@mail.gmail.com>
References: <CACnYWRciwetA6t39bPHt7XOT0EJY4A5+TmzZUb_eKcTLzvrYpA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jR6IVwyMgi78g/3hVTLLNO+vcgNHY2Y2EHZiyZ2ytcA=;
        b=cwYC9mPWEG89h5spVBkUHs6yat+b9GVc1QD7du6ktgpRz+C0R9u3A2rfM3eSoe6cRM
         bw7RMhTtciS6JxoNsfozWuuh4SE5b+7nxe09Tulxp+4FNOXfRpJbASfZ/Z8S/vC8Th0C
         HxvQNT4IamWkK0CalZ+257HPqfNWUr40m746r9mr5FXCv+2hG639PFwqaTkbWYm1zYqt
         JJZb5YGeMBGr6TxuoFwQr1RSge086nTnIQ5m2USIFpZqFOxvL9WcqpCOXLdlGcB5YkVv
         Bg4xMUJD9VJrgTA8yvNZ+ttL9Gg9FZvaGDwXYcwF2g7g2WRZ9st3G/Y4mA5qf4FiuDKj
         D4+g==
In-Reply-To: <CACnYWRciwetA6t39bPHt7XOT0EJY4A5+TmzZUb_eKcTLzvrYpA@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I have a wireguard interface configured in a dedicated namespace vpn.
It is configured first creating the interface in the main namespace
(that has access to the physical interface routing to the Internet
`eno1`), then moving the Wireguard interface `wg0` to the vpn
namespace (Reference [1]). The ruleset I've configured on the main,
"physical", namespace disallow traffic going over the VPN. Can you
please help tweak my configuration to allow traffic going out / in
from the `wg0` interface in the vpn namespace?

Same question for StackExchange rep for those who might care:
https://superuser.com/questions/1746449/how-to-allow-traffic-over-vpn-across-namespaces-using-nftables

[1]: https://www.wireguard.com/netns/#the-new-namespace-solution


--- Ruleset ---

sudo nft -a list table inet filter
table inet filter { # handle 15
        set blackhole { # handle 4
                type ipv4_addr
                elements = { 224.0.0.1, 224.0.0.251,
                             255.255.255.255 }
        }

        set in_tcp_accept { # handle 5
                type inet_service
                flags interval
                elements = { 22 }
        }

        set ip6blackhole { # handle 6
                type ipv6_addr
                elements = { ff02::16 }
        }

        set out_tcp_accept { # handle 7
                type inet_service
                flags interval
                elements = { 80, 443, 11371 }
        }

        set out_udp_accept { # handle 8
                type inet_service
                flags interval
                elements = { 53, 67, 123 }
        }

        chain global { # handle 1
                ct state established,related accept # handle 12
                ct state invalid drop # handle 13
        }

        chain input { # handle 2
                type filter hook input priority filter; policy drop;
                jump global # handle 14
                ip daddr @blackhole counter packets 0 bytes 0 drop # handle 15
                ip6 daddr @ip6blackhole counter packets 0 bytes 0 drop
# handle 16
                iif "lo" accept # handle 17
                meta l4proto { icmp, ipv6-icmp } accept # handle 18
                tcp dport @in_tcp_accept ct state new accept # handle 19
                tcp dport { 80, 443 } ct state new accept # handle 20
                udp dport 51821 accept # handle 21
        }

        chain output { # handle 3
                type filter hook output priority filter; policy drop;
                jump global # handle 22
                oif "lo" accept # handle 23
                ip protocol icmp accept # handle 24
                ip6 nexthdr ipv6-icmp counter packets 3 bytes 192
accept # handle 25
                udp dport @out_udp_accept ct state new accept # handle 26
                tcp dport @out_tcp_accept ct state new accept # handle 27
                tcp sport 22 tcp flags { rst, psh | ack } counter
packets 44 bytes 6052 accept # handle 28
