From: trentbuck@gmail.com (Trent W. Buck)
Subject: Re: Systemd, nftables, and iptables
Date: Thu, 21 May 2020 12:23:38 +1000
Message-ID: <87ftbu58lx.fsf@goll.lan>
References: <db383c6d-952e-1df3-4abb-a03d46d63959@satchell.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Stephen Satchell <list@satchell.net> writes:

> I'm building a CentOS 8.1 system on a Protectly four-port appliance,
> to be my new firewall.  To avoid problems, I'm trying to remove
> IPTABLES completely from the system so there is no chance of
> interference between the two firewalls.
>
> Problem:  systemd requires iptables-lib.
>
> 1.  Why?
> 2.  How to keep systemd from requiring iptables-lib?

I complained about this a while ago:

    https://bugs.debian.org/934584
    https://github.com/systemd/systemd/issues/13307

You CAN have both nftables and xtables rulesets active at the same time.
It works for me (for now), it's just EXTREMELY confusing because you
must know to check both "nft list ruleset" and "iptables-legacy-save".

systemd is built using meson, not autotools.
I don't speak meson, but meson_options.txt contains:

    option('libiptc',
           type : 'combo',
           choices : ['auto', 'true', 'false'],
           description : 'libiptc support')

So you can probably do something like "./configure --without-libiptc".

As at systemd v245-125-ga4f4a4e441,
the only thing using it seems to be systemd-nspawn --port.
So if you do not use systemd-based containers,
you will not miss this.

