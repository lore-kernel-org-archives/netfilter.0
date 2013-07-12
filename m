From: Emilio Lazo Zaia <emiliolazozaia@gmail.com>
Subject: Re: Clarification on the use of the statistic module
Date: Fri, 12 Jul 2013 02:07:44 -0430
Message-ID: <51DFA438.6000504@gmail.com>
References: <51DD79C7.3080707@tiendalinux.com> <51DE7697.3020204@plouf.fr.eu.org> <51DEFE24.8030601@tiendalinux.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=9ysH4l0tiftW3oen8A7veI62UJLDG+X9rv2m1q6wcjs=;
        b=1EG13rg757BE3800ItxdFfqdeVGA+lf9IfU/JCf36nCJW2YkS6NJGcfk0YiTwv+R2U
         t1I9ugOCgYxk2xMSE0B3GLIxNOvxammOQ3CdgJlTvkXWx0MvAGx3AnvdXkpKOsD6hct5
         54O+hEVxSgg60j/RvMOwkp5pL2/RLbLr10EiDGrYDcirUqoI8cZIhvFwADYidi+MKNwg
         M/cT4IGrNqY7YatcaIaTKKPfIVwpIvOi26eURgU70+/JpcdusFRC0j0szI3mhap1dqum
         eBYsFoCCtBWgr9mPpbchyh89/gGXFIt86ogAkeiHKom4ODA+r+KRpZOIXyvGwIENymT0
         413Q==
In-Reply-To: <51DEFE24.8030601@tiendalinux.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: "Nestor A. Diaz" <nestor@tiendalinux.com>
Cc: netfilter@vger.kernel.org

N=C3=A9stor,

=46irst pair or rules (LOG+ACCEPT) matchs on 50% of all packets, all th=
e=20
remaining rules matchs on the other 50%, so if you use again statistic,=
=20
it will create a new statistic starting with 50% of the total.

E.g. first packet match first pair or rules, second packet match second=
=20
rule, third packet match again _first_ rule, fourth packet match third=20
rule (50% + 25% + 25% -> 500 + 250 + 250 packets).

As Pascal said, you will need to remove the statistic match on the=20
second pair.

On 11.07.2013 14:19, Nestor A. Diaz wrote:
> Hi, thanks for your answer, as i understand the statistic module use =
a
> static counter that change everytime the packet traverse the chains, =
i
> though the counter got altered just one time while the packet travers=
e
> the chains.
>
> According to your suggestion if i remove the line with the "-j ACCEPT=
"
> then the statistic log as I want and in fact it does.
>
> However if i jump to a 'DNAT' directly, the problem persist as (50/25=
)
> it doesn't work as i have read from some websites
>
> # This doesn't work:
>
> /sbin/iptables -t nat -A prerouting_rule -m statistic --mode nth --ev=
ery
> 2 --packet 0 -i eth0 -s 0.0.0.0/0 -d 192.168.1.1 -p tcp --dport 7100 =
-j
> DNAT --to-destination 192.168.2.20:7101
> /sbin/iptables -t nat -A prerouting_rule -m statistic --mode nth --ev=
ery
> 2 --packet 1 -i eth0 -s 0.0.0.0/0 -d 192.168.1.1 -p tcp --dport 7100 =
-j
> DNAT --to-destination 192.168.2.20:7102
>
> As solution if I want to jump to DNAT directly then i have to decreas=
e
> the 'every' option as follows which do what i want:
>
> # This works:
> /sbin/iptables -t nat -A prerouting_rule -m statistic --mode nth --ev=
ery
> 2 --packet 0 -i eth0 -s 0.0.0.0/0 -d 192.168.1.1 -p tcp --dport 7100 =
-j
> DNAT --to-destination 192.168.2.20:7101
> /sbin/iptables -t nat -A prerouting_rule -m statistic --mode nth --ev=
ery
> 1 --packet 0 -i eth0 -s 0.0.0.0/0 -d 192.168.1.1 -p tcp --dport 7100 =
-j
> DNAT --to-destination 192.168.2.20:7102
>
> I am experimenting with the behavior and if I jump to custom chain wh=
ich
> performs other operations like 'log' statistics keep working as
> expected. (50/50) however if i put a 'DNAT' rule things become (50/25=
),
> it seems DNAT affects the behavior but i don't know why,  Any
> explanation for this will be appreciated.
>
> # Still don't work:
>
> /sbin/iptables -t nat -N custom_chain_1
> /sbin/iptables -t nat -F custom_chain_1
> /sbin/iptables -t nat -A custom_chain_1 -j LOG --log-prefix
> 20130711120831_packet_0
> /sbin/iptables -t nat -A custom_chain_1 -i eth0 -s 0.0.0.0/0 -d
> 192.168.1.1 -p tcp --dport 7100 -j DNAT --to-destination 192.168.2.20=
:7101
>
> /sbin/iptables -t nat -N custom_chain_2
> /sbin/iptables -t nat -F custom_chain_2
> /sbin/iptables -t nat -A custom_chain_2 -j LOG --log-prefix
> 20130711120831_packet_1
> /sbin/iptables -t nat -A custom_chain_2 -i eth0 -s 0.0.0.0/0 -d
> 192.168.1.1 -p tcp --dport 7100 -j DNAT --to-destination 192.168.2.20=
:7102
>
> /sbin/iptables -t nat -A prerouting_rule -m statistic --mode nth --ev=
ery
> 2 --packet 0 -i eth0 -s 0.0.0.0/0 -d 192.168.1.1 -p tcp --dport 7100 =
-j
> custom_chain_1
> /sbin/iptables -t nat -A prerouting_rule -m statistic --mode nth --ev=
ery
> 2 --packet 1 -i eth0 -s 0.0.0.0/0 -d 192.168.1.1 -p tcp --dport 7100 =
-j
> custom_chain_2
>
> Slds.
>

