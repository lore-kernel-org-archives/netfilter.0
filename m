From: trentbuck@gmail.com (Trent W. Buck)
Subject: Re: How is nftables + IFB
Date: Tue, 24 Sep 2019 11:44:58 +1000
Message-ID: <87wodycvs5.fsf@goll.lan>
References: <CALYzA8GZY1cJYsibQDOmA3DuUsV3d=KUdc6z04WgUxu-4Ya0jg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

John Mok <a9121431@gmail.com> writes:

> I have been using iptales + IFB (Intermediate Functional Block) for
> traffic shaping, How is the status of nftables + IFB (or its
> successor) ?

For egress shaping I suggest you start with a CoDel variant.

    https://manpages.debian.org/tc-codel
    https://en.wikipedia.org/wiki/CoDel

I guess you are talking about ingress shaping.
I have not done this myself.
Here are some initial guesses.

This looks like a typical example;
you can see most of it happens in tc (not xtables/nftables).
The tc part should still Just Work.

    https://wiki.archlinux.org/index.php/Advanced_Traffic_Control#Example_of_ingress_traffic_shaping_with_SNAT

The iptables part is (paraphrasing)

    #!/usr/bin/iptables-apply
    *mangle
    :PREROUTING  ACCEPT
    :INPUT       ACCEPT
    :FORWARD     ACCEPT
    :OUTPUT      ACCEPT
    :POSTROUTING ACCEPT
    :QOS         -
    -A FORWARD -o ppp+ -j QOS
    -A OUTPUT  -o ppp+ -j QOS
    -A QOS -j CONNMARK --restore-mark
    -A QOS -s 192.168.1.50 -m mark --mark 0 -j MARK --set-mark 3 -m comment --comment "Traffic from Alice's laptop gets more bandwidth"
    -A QOS -j CONNMARK --save-mark

You can see all that's really doing is changing the connmark flag for
traffic going from 192.168.1.50 to the internet.

    https://wiki.nftables.org/wiki-nftables/index.php/Supported_features_compared_to_xtables#connmark

Piping the previous code block into iptables-restore-translate, we see

    # Translated by iptables-restore-translate v1.8.3 on Tue Sep 24 11:41:35 2019
    add table ip mangle
    add chain ip mangle PREROUTING { type filter hook prerouting priority -150; policy accept; }
    add chain ip mangle INPUT { type filter hook input priority -150; policy accept; }
    add chain ip mangle FORWARD { type filter hook forward priority -150; policy accept; }
    add chain ip mangle OUTPUT { type route hook output priority -150; policy accept; }
    add chain ip mangle POSTROUTING { type filter hook postrouting priority -150; policy accept; }
    add chain ip mangle QOS
    add rule ip mangle FORWARD oifname "ppp*" counter jump QOS
    add rule ip mangle OUTPUT oifname "ppp*" counter jump QOS
    add rule ip mangle QOS counter meta mark set ct mark
    add rule ip mangle QOS ip saddr 192.168.1.50 mark 0x0 counter meta mark set 0x3  comment "Traffic from Alice's laptop gets more bandwidth"
    add rule ip mangle QOS counter ct mark set mark
    # Completed on Tue Sep 24 11:41:35 2019

The translations for "--restore-mark" and "--set-mark" hurt my brain,
but it looks to me like everything should Just Work.

