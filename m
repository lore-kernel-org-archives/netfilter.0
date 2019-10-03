From: zrm <zrm@trustiosity.com>
Subject: Re: How can I block all traffic from an IP range, irrespective of
 origin, going to, or coming from, using nftables in Debian 10
Date: Thu, 3 Oct 2019 15:00:57 -0400
Message-ID: <f9f3c860-5b3f-a09a-ff25-375378c3715b@trustiosity.com>
References: <NQw8Zn-Cr6DOqlayaUmuautcCgywjg96aFaMt1t0b-YRpyo0_DvByE3-RTNVC5S80qFIYbSNVGesY3XCvGxrLlYG__BFEBaDJ_XvIa0hREI=@protonmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=trustiosity.com;
        s=mx; t=1570129260; bh=Mgjhm22BoTAInl1JgSPhSFi7q9aPsbF817Wdt9ukd5s=;
        h=Subject:To:References:From:Date:In-Reply-To:From;
        b=rfH39upgU67cDn1ELjN0sNFlF9y2fYOWiFNpv4VrRIlRY96lDI7lB6pEyynmfHTZ0
         QDOGIj9/puNS8GGJWtXC+hLNWIllCro43SRT+Pow/xlsDzrD2TkOMTbe8RjOMRHLQj
         wLvS5VfFHDOOFa/6n4r+didgO6fMdw3q7QI1qRs4=
In-Reply-To: <NQw8Zn-Cr6DOqlayaUmuautcCgywjg96aFaMt1t0b-YRpyo0_DvByE3-RTNVC5S80qFIYbSNVGesY3XCvGxrLlYG__BFEBaDJ_XvIa0hREI=@protonmail.com>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jags <TheJags@protonmail.com>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On 10/1/19 19:22, Jags wrote:
> hello everyone,
> 
> I would like to block all traffic from an IP range (e.g.: 123.0.0.0/8), irrespective of its origin, going to, or coming from, using nftables firewall in Debian 10.
> 
> If I understand correctly, the following will block traffic originating from that IP range.
> 
> nft insert rule ip filter INPUT ip saddr 123.0.0.0/8 counter drop
> 
> 
> But it will still allow traffic if it's in response to (or associated with) an application on my Debian machine.
> 
> The problem: When I run a torrent client and add any torrent, be it Debian/Ubuntu ISO or any other torrent, I can see a bunch of IPs from my ISP connects to the torrent.
> 
> Even if I add a torrent that have only 1 seed and no peer at all, I can see a lot of IPs from my ISP (with zero percent of torrent availability) in qBittorrent client. In fact, I have blocked like 100+ in qBittorrent but the new IPs still keep popping up under "peers".
> 
> So I'd like to block an IP range, irrespective of traffic origin, going to, or coming from, using nftables.
> 
> 
> Thanks a lot in advance.

A torrent client could try to connect to a peer in either direction, so 
if you don't want communication with that IP range at all then you would 
also want a rule to drop packets in the OUTPUT chain with that address 
range as the daddr. You may also want to use reject rather than drop in 
that case because the then the client will figure out that the peer is 
not available faster.
