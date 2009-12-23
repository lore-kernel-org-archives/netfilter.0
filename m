From: Felipe W Damasio <felipewd@gmail.com>
Subject: ebtables broute DROP problem in production environment
Date: Wed, 23 Dec 2009 16:22:50 -0200
Message-ID: <8a87046f0912231022g438141afpfaa647ac0d01cdda@mail.gmail.com>
References: <8a87046f0912231019l76e69a9eg52a529023d02237b@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=OZCIkkjqHT6ejx7/F0JKa/kTe2T91N8pOMihe4Cdqfs=;
        b=XpBJiWjzAIF/FJW1YUS2WN7WnkDtP59uVHbu6m2MeLFZwfLb2Krv0fOj/LQjLK8e5b
         nKRTavr3gyBhg3C9kLxT604sM8QFZOpVELZWbXWNDs2OORPsb9toeZM/+ivaYNXjnL42
         zuq0R/y4b5582MGzp30NXGhilUX2BLI33isXs=
In-Reply-To: <8a87046f0912231019l76e69a9eg52a529023d02237b@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org
Cc: Bruno Gustavo Wallauer <brunogw@gmail.com>

=A0=A0Hi all,

=A0=A0I'm trying to use ebtables/iptables to implement a tproxy-squid o=
n my network.

=A0=A0I have a bridge-setup, with eth0 facing the user and eth1 facing =
the internet.

=A0=A0Everything works great when I have an user connected with a
cross-over cable on eth0.

=A0=A0But when I plug eth0 on the production environment network (which
uses multiple VLANs, one for the users and another for the internet),
http traffic stop working (ie. doesn't get routed to squid).

=A0=A0We use a Cisco switch 2690 (layer 2).

=A0=A0I'm trying to figure out what's wrong with my setup:

uname -r : 2.6.29.6
ebtables --version :=A0ebtables v2.0.9-1 (June 2009)
iptables --version :=A0iptables v1.4.3.2

Rules applied:

iptables -t mangle -N DIVERT
iptables -t mangle -A PREROUTING -p tcp -m socket -j DIVERT
iptables -t mangle -A DIVERT -j MARK --set-mark 1
iptables -t mangle -A DIVERT -j ACCEPT
iptables -t mangle -A PREROUTING=A0 -i eth0 -p tcp --dport 80=A0 -j TPR=
OXY
--tproxy-mark 0x1/0x1 --on-port 3128
ebtables -t broute -A BROUTING -i eth0 -p ipv4 --ip-proto tcp
--ip-dport 80 -j redirect --redirect-target DROP
ebtables -t broute -A BROUTING -i eth1 -p ipv4 --ip-proto tcp
--ip-sport 80 -j redirect --redirect-target DROP

=A0cd /proc/sys/net/bridge/
=A0for i in *
=A0do
=A0=A0 echo 0 > $i
=A0done
=A0unset i

brctl stp br0 off
brctl setfd br0 1
brctl sethello br0 1
ip rule add fwmark 1 lookup 100
ip route add local 0.0.0.0/0 dev lo table 100
echo 1 >=A0 /proc/sys/net/ipv4/ip_forward
echo 0 > /proc/sys/net/ipv4/conf/lo/rp_filter
echo 1 > /proc/sys/net/ipv4/ip_nonlocal_bind
echo 1 >=A0 /proc/sys/net/ipv4/tcp_low_latency
echo 0 > /proc/sys/net/ipv4/conf/eth1/rp_filter
echo 0 > /proc/sys/net/ipv4/conf/eth0/rp_filter
echo 0 > /proc/sys/net/ipv4/conf/br0/rp_filter

=A0=A0What am I missing?

=A0=A0FYI, I tried using 2.6.32.2 and didn't work the ebtables even wit=
h
cross-over dummy client. Same with 2.6.33-rc1 and -rc1-git3. =A0The
kernel 2.6.29.6 was the only one I tried that worked correctly.

=A0=A0If you need any other info, please let me know.

=A0=A0Thanks in advance!

=46elipe Damasio
