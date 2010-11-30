From: "Secure-SIP-Server" <info@secure-sip-server.net>
Subject: Re: Using iptables for throttling SMTP traffic
Date: Tue, 30 Nov 2010 14:14:24 +0100
Message-ID: <543C3E74493F496B8E7D13CA062D1FEC@gericomfx5600>
References: <C426DC428D95484BB7DF53F6DA1B34DB@gericomfx5600> <4CF2A686.4000309@plouf.fr.eu.org> <72283C9ECA07450499E7F3DDA655791F@gericomfx5600>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="macroman"; format="flowed	reply-type=response"
To: netfilter@vger.kernel.org

Hi Alex!

> I've set up a few basic rules to throttle SMTP traffic from an
> individual host should they make more than 10 connections in ten
> seconds:
>
> iptables -I INPUT -p tcp --dport 25 -i eth0 -m state --state NEW -m=20
> recent --set
> iptables -I INPUT -p tcp --dport 25 -i eth0 -m state --state NEW -m
> recent --update --seconds 10 --hitcount 10 -j LOG
> iptables -I INPUT -p tcp --dport 25 -i eth0 -m state --state NEW -m
> recent --update --seconds 10 --hitcount 10 -j DROP
>
> Is this the correct way to do this? I notice the seconds value can't
> be any greater than 20. What is the reason for this? I'd like to do
> something like permit up to 100 messages/connections over any
> 60-second period. Is this possible?

It is possible, but if your kernel supports it I don't know.

You can do:
# rmmod ipt_recent
# modprobe ipt_recent ip_pkt_list_tot=3D100

If you get the info that ipt_recent can't be removed because it's in us=
e you=20
must remove all 'recent' rules in your firewall table first. Then try i=
t=20
again.

But be careful !!!!!!!
I had set the values to hight. First everything worked fine. No error=20
message when I did
# iptables -A INPUT -p udp --dport 5060 -m recent --name=20
DENIAL_OF_SERVICE --update --rttl --seconds     1 --hitcount   10 -j DR=
OP
# iptables -A INPUT -p udp --dport 5060 -m recent --name=20
DENIAL_OF_SERVICE --update --rttl --seconds 100 --hitcount 200 -j DROP
# iptables -A INPUT -p udp --dport 5060 -m recent --name=20
DENIAL_OF_SERVICE --set -j ACCEPT
and
# /sbin/iptables -L --line-numbers -v -n
also showed that this was installed.
Then I rebooted the server and ... nothing. I wasn't able to get in con=
tact=20
with my server again!!!!!!!!!
I had to access the Hard-disk booting from other system to fix it back =
to=20
the default values. Then it worked again, but only with the default max=
=20
of --hitcount 20   :-(

Regards

Detlef Pilzecker
Weitlahnerstra=DFe 8
D - 83209 Prien am Chiemsee=20

