From: =?UTF-8?B?Vmluw61jaXVzIE1hc3N1Y2hldHRv?= <viniciusandre@gmail.com>
Subject: Sharing ppp connection with wlan interface
Date: Sun, 20 Sep 2009 18:43:10 -0300
Message-ID: <4AB6A1EE.1040201@gmail.com>
Reply-To: viniciusandre@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:reply-to
         :user-agent:mime-version:to:subject:content-type
         :content-transfer-encoding;
        bh=hzL3BLMPxy4wQxPgCWVyaE4vQwf1TRASZIOh2i20bNc=;
        b=KsJ7BuRBg+jKRCwaTojq4m+GZvuRWYl1D5wXOd2Oalubc1Lo8ic1tQl1IF2/kjDMgR
         6sodFlXYn/sVY6KWr2WbdOUyhtJgWZdrkxw6o3F1DfdgV3h+ce15bCiFcNK+QhpE7KXE
         U8yzwuCUPHUefWtCix6sNkAOotCQxjEAKBvt8=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="macroman"; format="flowed"
To: netfilter@vger.kernel.org

Dear all.

I'm on Debian Sid, and I've been trying to serve a=20
ppp0 internet connection through a wireless=20
network. I made a small script to be ran when i=20
want to do that:

ifdown wlan0
iwconfig wlan0 essid "VinaNET" mode Ad-Hoc
ifconfig wlan0 192.168.0.254
echo 1 > /proc/sys/net/ipv4/ip_forward
/etc/init.d/dnsmasq stop
/etc/init.d/dnsmasq start
iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE

The script goes just fine and the client computer=20
can see the wireless network but can't connect, it=20
only keeps trying:

DHCPDISCOVER on ath0 to 255.255.255.255 port 67=20
interval x

Here's my dnsmasq.conf file:

domain-needed
bogus-priv
interface=3Dwlan0
dhcp-range=3D192.168.0.1,192.169.0.100,12h

I'm not quite sure if that's an iptables or a=20
dnsmasq problem.

Thanks!
--
Vin=C3=ADcius Massuchetto
http://vinicius.soylocoporti.org.br
