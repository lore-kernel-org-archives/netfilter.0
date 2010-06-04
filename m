From: Victor Carceler <vcarceler@gmail.com>
Subject: It's possible mark or classify packets per gateway in a multihop 
	route ?
Date: Fri, 4 Jun 2010 10:49:10 +0200
Message-ID: <AANLkTinfTnSYngEUs3B7TTSTXt3cq9OHmIXEZEZNEDJB@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:content-type;
        bh=R4gz8phP+2oaF+4rRWhxUYr+lO1Uyt+DdlluWvYuj6k=;
        b=hH6V9eg4fR9rkKsiRi9WvPQIw76QH5ScMRkUNU4psQ6LUT+go+iuVGzVg52MsHY2zK
         qRmszSknpqeoka8U/0EE5N81drhB1eEnUgj609Ncb7Oc7QVsKrwNIAfeZwdq03gDVHWO
         c9JpIpsBECkEy65N4DVmj95aHhNx6VlxQ7mmI=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I have multiple DSL routers, all of them in the same subnet
(192.168.100.0/24) and reacheable by eth0. I use a multihop default
route and I want to shape traffic with limits per gateway. So, it's
possible to mark or classify packets once it's known with router will
be routed through ? wich extension/selector should I use ?

-------
ip route show

192.168.100.0/24 dev eth0  proto kernel  scope link  src 192.168.100.5
192.168.10.0/24 dev eth1  proto kernel  scope link  src 192.168.10.30
169.254.0.0/16 dev eth0  scope link
127.0.0.0/8 dev lo  scope link
default
	nexthop via 192.168.100.2  dev eth0 weight 1
	nexthop via 192.168.100.3  dev eth0 weight 1
------------

192.168.10.0/24 it's my LAN

eth0 has address 192.168.100.5 (to balance traffic), and alias
(eth0:0, eth0:1) exists with addresses (192.168.100.102,
192.168.100.103) to rule traffic to specific router.

It's even possible to apply HTB qdisc to eth0 and shape traffic with
limits per gateway ?

Best regards,
Victor
