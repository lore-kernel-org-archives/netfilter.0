From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Removing DROP from nat table
Date: Thu, 10 Nov 2011 10:29:15 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1111101022060.3903@frira.zrqbmnf.qr>
References: <1320885710.82187.YahooMailNeo@web36903.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1320885710.82187.YahooMailNeo@web36903.mail.mud.yahoo.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="utf-8"
To: "gregry ." <gregry_7@yahoo.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Thursday 2011-11-10 01:41, gregry . wrote:

>"Hold on, that's your problem right there, you should use filter
>instead," someone will say.=C2=A0 Maybe, but I'll describe why I didn'=
t.
>[...]
>iptables -t nat -A natclnt_10_0_0_1 -p tcp --dport 8001 -j nat_fwd_srv=
c
>iptables -t nat -A natclnt_10_0_0_1 -j LOG --log-prefix NatClnt_1=3D
>iptables -t nat -A natclnt_10_0_0_1 -j DROP
>[...]
>iptables -t nat -A PREROUTING -p tcp -m state --state NEW -s 10.0.0.0/=
24 -d 10.0.0.1 -j nat_clnt_new
>
>These chains above would be called when new TCP connections come in
>from VPN clients trying to reach 10.0.0.1.=C2=A0 The filter table only
>needs a single "blind" ACCEPT for all new TCP connections from
>10.0.0.0/8.

NB: NAT only ever gets NEWs, so it's pointless to check for it again
using matches.

>However, if this setup gets rebuilt using the filter table in the 'int=
ended' way, the rules would have to be like:iptables -t filter -A fwdcl=
nt_10_0_0_1 -p tcp -d  192.168.10.23 --dport 80 -j ACCEPT
>iptables -t filter -A fwdclnt_10_0_0_1 -j LOG --log-prefix FwdClnt_1=3D
>iptables -t filter -A fwdclnt_10_0_0_1 -j DROP
>
>iptables -t filter -A fwdclnt_10_0_0_2 -p tcp -d  192.168.10.23 --dpor=
t 80 -j ACCEPT
>iptables -t filter -A fwdclnt_10_0_0_2 -p tcp -d 192.168.190.5 --dport=
 80 -j ACCEPT
>iptables -t filter -A fwdclnt_10_0_0_2 -p tcp -d 192.168.190.5 --dport=
 443 -j ACCEPTiptables  -t filter -A fwdclnt_10_0_0_2 -j LOG --log-pref=
ix FwdClnt_2=3D
>iptables -t filter -A fwdclnt_10_0_0_2 -j DROP
>...etc
>
>Notice that in this setup, if a service gets moved to another host
>or port, potentially hundreds of filter rules also have to be
>changed to reflect that.=C2=A0 Much more laborious and error prone.

Indeed one wonders why you would do such a convoluted thing in filter=20
when you can simply do:

-A FORWARD -s 10.0.0.0/8 -m conntrack --ctstate DNAT -j ACCEPT
-A FORWARD -s 10.0.0.0/8 -j DROP
