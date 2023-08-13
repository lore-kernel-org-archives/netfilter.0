From: <imnozi@gmail.com>
Subject: Re: Iptables and DDoS attacks
Date: Sun, 13 Aug 2023 17:41:48 -0400
Message-ID: <20230813174148.506d3e92@playground>
References: <37c5f1638836cb490a3369d01c5edec1.squirrel@_>
        <ec98fc0a-1f7c-bb0e-3e96-9092516a2038@thelounge.net>
        <c614ef650022a572493960711294723a.squirrel@_>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691962911; x=1692567711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8KQQpMHu4dK0YGihYBVhDIp2kzEhlcv3kgsQJQY3prw=;
        b=hU1ArYv93BqzIBO9zxs6JTk9DuH3uGw2hez5far5B60j7KdEBKAvfAFRGvUoW7C3ta
         Bffs4Nr5HgGCAPLc7y8KbJlOii6AYWZ+cuXGW88SDg+XqD8DJAHPTeeYkt3E6hpLhbjK
         qkPqIncLT4YCwTwwjj63hMOVgt5mwn43W/vvyV2iUDVtLVrMQEPPeTbtWG+aON0re9d+
         3TVa7KDAGgwzuughWuEd4yPdKa5gZEYtsKwyAPRANTELPBqwbxr7boQHXMME/Ks+M9x4
         LW1KCPI308+YyQFykfK92yIq5o3C9bnXyFrKOCcaNKeLPXkPMWeW3VimNUrwRNxWPNj/
         uzpQ==
In-Reply-To: <c614ef650022a572493960711294723a.squirrel@_>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

The first thing to do is:
  iptables -t mangle -I 1 PREROUTING -m state --state INVALID -j DROP

This will drop all TCP packets that have an INVALID state (to wit, netfilter is unable to correlate these packets to an existing connection). Since they are INVALID, do not spend even a nanosecond more time processing them; just dump them in the bit bucket.

After that, add rules that drop all packets to and from internet hosts and networks that you already know you want no contact with (pron, sleaze, warez, et alia); ipset is good for this.

In order to reduce said traffic on your downlink, you would have to ask your upstream (ISP?) to implement some sort of rate limiting on your link to let more legitimate traffic through.

The only way to possibly thwart DDoS is to require all ISPs and other leaf providers to implement reverse path filtering. Packets that claim to arrive on their downstream links that have IP addresses that do not reside on their DS links are to be dropped. E.g., if a Comcrash customer started sending packets purporting to be from 8.8.8.8, Comcrash should silently drop those packets (well, unless Google is a customer), and warn the security team when a customer persists in spoofing SRC IP addresses. (Of course, this likely doesn't address all forms of DDoS; your mileage will vary.)

N

On Sun, 13 Aug 2023 15:34:32 -0400
Hack3rcon@mail2tor.com wrote:

> >
> >
> > Am 10.08.23 um 09:16 schrieb Hack3rcon@mail2tor.com:  
> >> Hello iptables Team,
> >> Is it possible to protect a server against DDoS attacks using iptables?  
> >
> > depends on the attack - if it's bandwith *nothing* on your side can do
> > anything against it
> >
> > for request-based attacks xt_recent for ratelimits works well
> >  
> 
> Hello,
> Thank you so much for your reply.
> How do hardware firewalls that use Linux prevent these attacks?
> 
> Can you show me some iptables rules about limitation?
> 

