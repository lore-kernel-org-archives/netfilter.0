From: Joker Joker <jokesareonyou@gmail.com>
Subject: redirect all traffic help
Date: Sat, 15 May 2010 11:20:35 -0400
Message-ID: <AANLkTikudntJRQimzYujJk_CZUM-r8RHbeaXedg9ndPZ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:content-type;
        bh=2Qa2OmviY2OfFbNMn4T9dMarmaBglCrBobRL/OdYXK4=;
        b=acNgTofkhaTqk2+VZkRRZWVJqaSPKAoeTFnIUEDADBJz4gfNf6I6JnDq4B48jXRIcC
         1eSfSb97O30rfpo+z/engUQMMdGzL6tXGOpCFLwThlv9c2igjUfdcTzGmk8IPoJw9DM6
         KsROdcysP46wDyhSzwkDBnGZS+/xgODstBODU=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I have got a virual AP setup with dhcpd apache and airbase-ng
and im trying to get it into Non Transparent mode,

i have tried this but it does not work:

ifconfig at0 up
ifconfig at0 10.0.0.1 netmask 255.255.255.0
ifconfig at0 mtu 1400
route add -net 10.0.0.0 netmask 255.255.255.0 gw 10.0.0.1
iptables --flush
iptables --table nat --flush
iptables --delete-chain
iptables --table nat --delete-chain
iptables -t nat -A PREROUTING -p udp -j DNAT --to 10.0.0.1
iptables -P FORWARD ACCEPT
iptables -t nat -A PREROUTING -p tcp --dport 80 -j DNAT --to 10.0.0.1
