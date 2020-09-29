From: VDRU VDRU <user.vdr@gmail.com>
Subject: Re: Redirect traffic to openvpn (client)
Date: Tue, 29 Sep 2020 15:24:10 -0700
Message-ID: <CAA7C2qj9rufEP7J--g0FG+0ORPebBQFRrG95HWH+09exAMqLXQ@mail.gmail.com>
References: <f74104f1-efa5-8f7d-0f72-cd14060ddb4f@bersol.info>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=P+Tj89VTS/X1mUJ97jMwQ/zMiZCYBT8G1z3aaJoI63M=;
        b=U+1+KyU0bm+YMpxVBftSGVI9fZSlOf1wmC+xOe/Q1CMl+ZQa6gCaJ/mvmjyfeHNkrs
         Hjhiwhc5S6dRg5+1bRDqNZ4GwUg7FgiRRqMht8LJIq4pMrCT7HFRNFgmoXbc1CBogWeN
         kgN2ycq0mm+Sw7m7Wpfi78CnbsJ9Nys3KC+WyDn8PiKg1GyMjCMxIiqDT3BlIvIYZQcN
         +UXv5DMkmkpzeKA/W/Eme8orPbfDauPriVvUhWSCZIuNyHav0Ti4X5fAMAXhlfE8LhOe
         mfgkIi3GHjW+DjYWnbNeKV7ttgO8Bnl2w8xPkAcfC/HybJaTBcSiKApGhRP+L/x/oS2+
         mTlg==
In-Reply-To: <f74104f1-efa5-8f7d-0f72-cd14060ddb4f@bersol.info>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alberto <alberto@bersol.info>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Just a note.. You create a network namespace for vpn with an arbitrary
network and run openvpn inside it. Then you can use a veth pair to
allow traffic from whatever other boxes on your lan you want to go
through the vpn. This also stops the traffic from going anywhere if
openvpn disconnects.

On Tue, Sep 29, 2020 at 10:52 AM Alberto <alberto@bersol.info> wrote:
>
> Hi everybody:
>
> I have a Linux debian with twice ifaces:
>
> - eth0: 192.168.1.1 (WAN)
>
> - eth1: 192.168.2.1 (LAN)
>
> as Home Router and GW of my Home LAN (192.168.2.0/24).
>
> From time to time, I up an tun0 iface as openvpn client in this Home Router.
>
> I up this openvpn connection with "--route-nopull" parameter, because I
> don't want redirect traffic of all my LAN devices through this VPN, but
> only a few.
>
> I set the following rules with IPTABLES to permit traffic from VPN:
>
> - iptables -A INPUT -i tun+ -j ACCEPT
> - iptables -A OUTPUT -o tun+ -j ACCEPT
> - iptables -A FORWARD -i eth0 -o tun+ -j ACCEPT
> - iptables -t nat -A POSTROUTING -o tun+ -j MASQUERADE
>
>
> Ok, how can I do to make this redirect to specific hosts?
>
>
> Thanks,
>
> Regards,
>
>
>
>
>
