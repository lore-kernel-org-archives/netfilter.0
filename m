From: Serg Buslovsky <serg.buslovsky@gmail.com>
Subject: --uid-owner question
Date: Wed, 20 Jan 2010 13:04:25 +0200
Message-ID: <91f85b781001200304y52c0fc3eo8383977258242ccb@mail.gmail.com>
References: <91f85b781001200302m3725e187p5975a64c01604013@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:content-type;
        bh=cxTLIW4mwFnQ0oAWK1spCmAwXUMb0mn09efVUlrFZPk=;
        b=OEqUgqSFP0Oa3NLa2VkQPeVOdIY+YH6D93GLwXEh+eHnUiGjwd6rEmQkCaWFtJbFHI
         At1bSIh8Me3KK3egcU9yMBHTy+NR3WX+CmxBOBCscccFceGl1/nbZBg1jN4V4z/ULogE
         u1qq1joG6goXdi2rGJq08jeBSFbEg8YtHeXC8=
In-Reply-To: <91f85b781001200302m3725e187p5975a64c01604013@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi, All.

Here's my routing script:
#!/bin/bash

ip route flush table 300

iptables -t mangle -A OUTPUT -m owner --uid-owner vpnroute -d
127.0.0.1 -j RETURN
iptables -t mangle -A OUTPUT -m owner --uid-owner vpnroute -d
192.168.0.0/24 -j RETURN
iptables -t mangle -A OUTPUT -m owner --uid-owner vpnroute -j MARK
--set-mark 100
iptables -t nat -A POSTROUTING -m owner --uid-owner vpnroute -o tun0
-j MASQUERADE

ip rule add fwmark 100 table 300
ip route add default dev tun0 table 300
ip route flush cache

It routes traffic based on --uid-owner filter.
However i've done some tcpdump-ing and seen that some packets are
going not thru the tun0 device as it is expected(it could be probably
because OpenVPN restarts some times).
I need to ensure that each packet besides DNS requests goes thru tun0
device. Thinking about adding a rule that will drop all traffic lost
by OpenVPN.
Any ideas how that should look like?

Thank you,
Serg
