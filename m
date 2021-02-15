From: =?UTF-8?Q?Lars_Nood=c3=a9n?= <lars.nooden@gmx.com>
Subject: traffic shaping with tc on Linux 5.4.x
Date: Mon, 15 Feb 2021 21:22:17 +0200
Message-ID: <672177ad-c6b3-ccd7-d9d5-f5c2291e1628@gmx.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1613416938;
        bh=JtiDZd27iGEYR2cwmnmD2dV+cJyWX6tZBOAATJ6pHYE=;
        h=X-UI-Sender-Class:To:From:Subject:Date;
        b=T95DRfd78W1w+rCfUEWOCF/4aU0iKkLhtoCdMfCYZ8HAfTAJk4QvBqkv6xerbhbl5
         6j3hqeOJQ2MqfytWnyD1MPlx5wthiBsmsjhgO/vZpGeBoJI31Hjg7hZdlwckxs6cRY
         hnJXKwHUoVu5kr8F5+c0jqYGfwOgJVfLg3Kkic5w=
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

If this is the right list to ask about tc, then I have a beginner
question about traffic shaping.  If not please point me to the correct
venue.

My questions is, given the rules below, how would I further subdivide
the SSH queue so that interactive sessions are prioritized over bulk
transfers?

The goal of the rules below are to give top priority to SSH, next
priority to HTTP/HTTPS, third priority to everything else, and, then,
with what's left over give something to IPFS.  General tips and
corrections also welcome, especially about nft instead of iptables.

Regards,
Lars

=2D--

#!/bin/sh

PATH=3D/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin

if=3Dwlp1s0

# remove existing qdiscs, classes, and filters from interface
tc qdisc del dev $if ingress
tc qdisc del dev $if root

# default class for unclassified traffic
tc qdisc replace dev $if root handle 1: htb default 30

# top level class with handle 1:1
tc class add dev $if parent 1: classid 1:1 htb rate 800kbit

# Class 1:10 is highest priority, SSH/SFTP
# Class 1:20 is next highest priority, HTTP/HTTPS
# Class 1:30 is next lowest priority, default traffic
# Class 1:40 is lowest priority but highest bandwidth, IPFS

tc class add dev $if parent 1:1 classid 1:10 htb rate 1mbit \
	ceil 200kbit prio 1
tc class add dev $if parent 1:1 classid 1:20 htb rate 1mbit \
	ceil 100kbit prio 2
tc class add dev $if parent 1:1 classid 1:30 htb rate 1mbit \
	ceil 100kbit prio 3
tc class add dev $if parent 1:1 classid 1:40 htb rate 1mbit \
	ceil 400kbit prio 4

# leaf qdisc to each child class
tc qdisc add dev $if parent 1:10 fq_codel
tc qdisc add dev $if parent 1:20 fq_codel
tc qdisc add dev $if parent 1:30 fq_codel
tc qdisc add dev $if parent 1:40 fq_codel

# add filters to prioritize traffic
tc filter add dev $if parent 1: handle 100 fw classid 1:10
tc filter add dev $if parent 1: handle 200 fw classid 1:20
tc filter add dev $if parent 1: handle 400 fw classid 1:40

# label outgoing traffic
iptables -Z; # zero counters
iptables -F; # flush (delete) rules
iptables -X; # delete all extra chains

iptables -t mangle -A OUTPUT -p tcp --match multiport \
	--sports 22 -j MARK --set-mark 100
iptables -t mangle -A OUTPUT -p tcp --match multiport \
	--sports 80,443 -j MARK --set-mark 200
iptables -t mangle -A OUTPUT -p tcp --match multiport \
	--sports 4001 -j MARK --set-mark 400
