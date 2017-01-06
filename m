From: "Neal P. Murphy" <neal.p.murphy@alum.wpi.edu>
Subject: Re: Iptables Reject with TCP Reset
Date: Fri, 6 Jan 2017 18:26:23 -0500
Message-ID: <20170106182623.75d3451d@playground>
References: <HK2PR0201MB21296E195C755C65E4110DDCE8630@HK2PR0201MB2129.apcprd02.prod.outlook.com>
        <d991fbe7-ca57-6045-8bfe-88e590ed2f65@familie-kuntze.de>
        <HK2PR0201MB2129ABDBC46F8805B3757387E8630@HK2PR0201MB2129.apcprd02.prod.outlook.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Filter: OpenDKIM Filter v2.10.3 MAIL1.WPI.EDU v06NQPj7024896
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=wpi.edu; s=_dkim;
        t=1483745185; i=@wpi.edu;
        bh=+/SxiB0XZ2dxInSy2k64G+eQcSSx5JAS83Pf6ZSbW/8=;
        h=Date:From:Cc:Subject:In-Reply-To:References;
        b=ukpVFvr8zqKLzLYXnvfmWGobWMNPWzHT9ShT6j+y1qrKbLGy9OIevymRO4l85VrUK
         KF5dZf9H84PTbAgZdpbFdGH5OVJRYFJLMmD30mL+MZ8/aZFqSrj+kiZJy73m3FLXNn
         OTzsceCGZvB3kN0CyGiB27PUZgxENRjd24DXCdHA=
In-Reply-To: <HK2PR0201MB2129ABDBC46F8805B3757387E8630@HK2PR0201MB2129.apcprd02.prod.outlook.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Fri, 6 Jan 2017 16:28:31 +0000
Matt Killock <matt.killock@praemium.com> wrote:

> > Depends on your rule set. Check and fix it. The target usually works.
> 
> As a test, I made the very first FORWARD rule this:
> 
> iptables -A FORWARD -i eth1 -p tcp -s 192.168.20.0/24 -d 212.58.244.71 --dport 80 -j REJECT --reject-with tcp-reset

Dumb question: can you reset a TCP conn that isn't ESTABLISHED? I don't think a TCP reset applies to the first SYN packet.

Here are the rules I use when a conn passes outside its allowed time frame:
  -A timedaction -p tcp -m state --state ESTABLISHED -j REJECT --reject-with tcp-reset
  -A timedaction -j REJECT --reject-with icmp-admin-prohibited

When a packet is received for an established TCP conn, a reset is returned to the sender. Each direction is handled separately. Once a particular direction has been reset, it is no longer ESTABLISHED, and further packets in that direction are rejected with ICMP 'admin prohibited' packets.

In short, each direction of established TCP conns is reset individually. All other conns, including each reset direction of TCP conns, are rejected via ICMP.

N
