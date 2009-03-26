From: "bldrnorth@gmail.com" <bldrnorth@gmail.com>
Subject: Transparent bridge and proxy - with only lo?
Date: Thu, 26 Mar 2009 12:54:34 -0600
Message-ID: <127d8b5e0903261154g114c1ccdo8607ec57cc65f350@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type:content-transfer-encoding;
        bh=eGUMuwWzxT5cDMg5/CmrgJ64v7pvNMpEO3tvocbDOZs=;
        b=nk7U6xlBu00FDc7wkEIKupfXOteoLt3+MCq3LW2LTf79l81ROntMK8bFV26Zha3SYs
         XYL/6PlTop+qzY5gBtsEp8QkUGAcJpDuvGfitJBeHfDZ0WYPfarmcI9oeYq+SMo6tPri
         S8OMmyT59w9opdwVohAxjJlXNCZGhzqkZVpxY=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

While there is no shortage of documentation on setting up a
transparent bridge with Squid proxy, I have only seen examples that
assign an IP address to the bridge interface.=A0 In my circumstances,
the bridge is between the ISP's bridge and our own router, such as:
(ISP Bridge) <--->(Our Bridge)<--->(Our router).=A0 Typical I'm sure,
but Our router is assigned only 1 IP address so I really don't have an
IP address to assign the bridge interface.=A0 Here's how I'm setup:

brctl addbr br0
brctl addif br0 eth0
brctl addif br0 eth1
ip link set br0 up
# Normally, would assign an IP address to br0 and a default route

I was thinking I should be able to re-direct to the localhost
interface 127.0.0.1, or perhaps assign an address like 127.0.0.2 to
br0, but then could not figure out the appropriate iptables and route
command.=A0 I'm sure I could assign br0 a private ip address, but then
wouldn't be sure how to tell it to route.  Here's all I have so far...

ebtables -t broute -A BROUTING -p IPv4 --ip-protocol 6 \
        --ip-destination-port 80 -j redirect --redirect-target ACCEPT

If I've completely missed where this has been addressed somewhere else
I'd appreciate a link or some advice here.

Thanks!
