From: Martin Gignac <martin.gignac@gmail.com>
Subject: Re: How to troubleshoot (suspected) flowtable lockups/packet drops?
Date: Tue, 16 Mar 2021 21:37:44 -0400
Message-ID: <CANf9dFMxabVweO2ipnPL8Ncemc9wQaxeJQs0dazrgf=VeXVjbA@mail.gmail.com>
References: <CANf9dFO+CAuiugQjwKDZ+tOVYuB+HMKeJzDVqekY=vVFE-rxFw@mail.gmail.com>
 <20210316230521.GB981@salvia>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qh4RMQwiQIIgeQupsBcB1+6fUyJ4Lv83cUFgmYYi8oE=;
        b=qgGmXW2YzAhaGNM9x55Zc0YE+plQH94Zb1dnWX14Tz2/nGAnhWtWhV43k3HwDNTKMJ
         859AB7X7dKY3Gzuy6bebjRyRjXTDU+ycQnK/tdGX+ROiQRpODyorq9uRIibN/m3azPPQ
         Yd58f93dqLHeO06po8BbBdqHhwoYONH9oEhGMYj7JexbPr155uh9qBITwC2QLXlQSqvS
         iyAv5YUQIhBpG0mR/H3wqrWIf58NcWXnxLuhXypCWOc/eSZV79OXN5aXHYogixw9eCwZ
         iXC1nOiONrpaNf4OT4z5paeXKo38yOcCy4Ev1hjqUOjugTLvhkvLRi9OujwpsKqM1L4S
         0GVw==
In-Reply-To: <20210316230521.GB981@salvia>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

Hi Pablo,

How can I add the 'counter' option to the existing flowtable? Is this
possible? I tried the following:

    [magi@s116r2l1fw01a ~]$ sudo nft add flowtable inet filter f {
hook ingress priority filter \; counter \;}

It didn't complain, but I couldn't see the 'counter' option when I
listed the flowtable:

    [magi@s116r2l1fw01a ~]$ sudo nft list flowtables
    Did not kill
    table inet filter {
            flowtable f {
                    hook ingress priority filter
                    devices = { tun0, bond0, dummy0, bond1.999, bond1,
vrf-conntrackd, vrf-mgmt, enp66s0f1, enp66s0f0, enp5s0f1, enp5s0f0,
eno4, eno3, eno2, eno1 }
            }
    }
    table ip nat {
    }

And looking at the output of conntrack -L, the counters didn't
increase past the initial flow creation packet:

    tcp      6 src=192.168.125.3 dst=192.168.40.254 sport=53420
dport=22 packets=1 bytes=60 src=192.168.40.254 dst=192.168.125.3
sport=22 dport=53420 packets=1 bytes=60 [OFFLOAD] mark=0 use=2

How do I enable the 'counter' option exactly (since I'm clearly doing
something wrong)?

Thanks,
-Martin
