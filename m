From: Miles Stevenson <miles@mstevenson.org>
Subject: Re: Figuring out odd web traffic from clients
Date: Sat, 17 Mar 2012 17:18:59 +0000
Message-ID: <15F55D7D8D0B48F8B8B495E62D858E8C@gmail.com>
References: <CABqG1H8VJuXgPuNWa=8it1TCeDOXYL3LtOVKix3Xv7Un-=yRaw@mail.gmail.com>
 <4F63C987.4000100@mandragor.org>
 <7F9E8AF0E40846F28C9EA7BCA54D93C2@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :x-mailer:mime-version:content-type:content-transfer-encoding
         :content-disposition;
        bh=wdt9X+e7QHDQ8Ra41OxDym3ir8bHn/NYkDA92zHM2Dk=;
        b=uotlBJN2OotclasJVGBz8F6mMfCIT2dJ/ZMBBZD7LV9B9EHYSicniMFJOMOnQ/K5Ub
         VwG/WH/Uc7pixUmYF/+Ju/QYGQom5lp9yw1hDihcnckbnUt97EPnOE08UgAt3W3Azg45
         XiXD7QSO+A6rc71qmJrOQCn+fRAMCnWazEHUMIhpBs1VZe79nF9LO0SY4sf6oRRMyp5A
         xSG6Ol5WYsif2tTDmieulD170u0N35Mddh++BrNnpcbcsONOukqCpfEnhqTwKEZXi9NG
         6z6pecb6vh/VD5jO1oVZbtIaErmMciyPPXG8rK/MJXUPuDCEyIHr2CP2Kf/mpAkNyrZI
         BKVA==
In-Reply-To: <7F9E8AF0E40846F28C9EA7BCA54D93C2@gmail.com>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Yann,

I've done a little more digging and I've learned some new things along the way, but I don't have a solution yet. One thing that was illuminating, was learning that you can enable logging in the conntrack kernel module for any packets that conntrack discards because it considers the packet to be invalid. You can do this with:

echo 255 > /proc/sys/net/netfilter/nf_conntrack_log_inavlid

Looking in the /proc/sys/netfilter/ directory, it is obvious that we are able to tune the kinds of things that conntrack will consider to be invalid. But I'm not going to mess with other settings until I understand more about how conntrack is evaluating what is considered "invalid". 

After running the above, I start to get interesting logs such as these:
nf_ct_tcp: invalid packet ignored IN= OUT= SRC=<dmz server> DST=<web client> LEN=52 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=TCP SPT=80 DPT=49673 SEQ=3022090550 ACK=328069967 WINDOW=5840 RES=0x00 ACK SYN URGP=0 OPT (020405B40
101040201030308) 

Notice that this is an outgiong packet from my web server, indicating that there is something wrong on my web server. I don't have a tcpdump to see the context of this packet, but I don't see anything about this that seems invalid (no invalid flag combinations, TTL is fine, can't tell if ACK or SEQ numbers are correct without seeing the rest of the data stream though). Analysis of the kernel source code for conntrack might be helpful in understanding what criteria needs to be met for packets to get "ignored": http://tomoyo.sourceforge.jp/cgi-bin/lxr/source/net/netfilter/nf_conntrack_proto_tcp.c

But I haven't spent much time going down that road yet.

One interesting thing about this, is that there is no accompanying log from the iptables filter logging this as a rejected packet. Which means that conntrack will drop packets silently without you knowing unless you enable the conntrack logging through /proc like I mentioned above. This was somewhat annoying, since I always had assumed that my filter ruleset ensured that I would be logging (and be able to see) any packets that were being dropped by my firewall. But now I realize that I've been "in the dark" for a while. It also means that conntrack is making these decisions before your filter rules are and unless you enable this setting, you simply won't know about it.

I think I might need to do another tcpdump capture and see if I can figure out what is invalid about these packets that are getting dropped by conntrack. But the thing that is confusing me, is that some of these packets are getting dropped by conntrack before the packet gets processed by a filter rule, so the only log that is generated is as an nf_ct_tcp: log, but other packets are being rejected by the iptables ruleset itself, and being caught by my filter rules.

So, there is some criteria in which some of the packets are getting dropped by conntrack before they reach the filter stage, and other criteria where they are getting dropped, also by conntrack, but they are getting logged by iptables. This is making troubleshooting that much more confusing.

Now, you mentioned a rule, which is an interesting approach because I tried to put in a filter rule last night to catch these and silently drop them so they didn't get logged. My rule was added to both my FORWARD and my IN/OUT chains and they looked like this:

-A FORWARD -m state --state INVALID -j DROP

iptables accepts this rule, (and has its own way of "pretending" to track the "state" of stateless protocols like UDP, so I don't think a I need to specify -p tcp for this rule) but it doesn't work. Those same packets get logged by hitting the next rule in the list:

-A FORWARD -j LOGBLOCK

I don't understand. If the problem with the packet is that it simply doesn't match an existing entry in the state table, then it should be getting silently dropped before it reaches the next rule, which logs and blocks all packets that have made it to the end of the ruleset. But if that isn't the problem, and this is part of a valid session in the state table, then this packet should not be getting dropped at all, since it appears to be valid HTTP traffic that I am explicitly allowing further up in my ruleset. 

It's really strange. The more I play with this, the more confused I start to get and realize that I don't really understand the inner-workings of netfilter as well as I thought I did. So I guess I'm at a point where I could use help with the following questions:

1. What has to be wrong with a packet for conntrack to drop it before it gets evaluated by the filter rules?
2. If I grab a tcpdump to try and look at one of these dropped packets in more detail, what kinds of things should I be looking for? Invalid ACK or SEQ numbers? One side sending more data than the tcp window calls for? Anything else?
3. How common is this kind of thing? Is this just garbage noise that is hitting everyones' firewall and you just don't notice it until you enable conntrack logging?
4. If this indicates some kind of network configuration error on my web server, what kinds of things should I be looking for? Network buffers tunable via /proc? ulimits? routing table errors? ethernet media type mismatches? I'm not sure where to start, and a cursory look at my web server config seems fine.

Thanks.
-Miles




