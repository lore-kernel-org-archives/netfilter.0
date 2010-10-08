From: Payam Chychi <pchychi@gmail.com>
Subject: Re: empty filter on FORWARD chain with rp_filter means safe right?
Date: Thu, 07 Oct 2010 21:40:51 -0700
Message-ID: <4CAEA0D3.1020207@gmail.com>
References: <20101008043129.GA2017@omnius.omnisys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=kvc3LoSup9vFvWn8YzYNTGLcmfFlnYamW0VuOVzlbtk=;
        b=W0u7HiQMWMhhYFKq9sA1csz+bUQCpBgGoUIGvd7VZpRjiv5d83E429kq513KGck8gA
         94+yJZmttEvG85VP6JhO5YKYkBVOPenAjFargzwKXL6XbTYrhkh84EdTGmZTZ8Ctqp4F
         fUHKF6I2uXLjaaMDYAyNMFTqSBYZvwOakAkEI=
In-Reply-To: <20101008043129.GA2017@omnius.omnisys.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Scott Mcdermott <scott@omnisys.com>
Cc: netfilter@vger.kernel.org

Thats correct Scott,
in order for any systems to abuse your setup they will need to be 
directly connected to a segment that has knowledge of valid route to the 
end system... meaning if a computer is 2 hops away and the router in 
between has no knowledge of how to get to your private rfc1918 then pkts 
get dropped.

Keep in mind that as ipv4 exhaustion gets extreme, some isps will use 
rcf1918 blocks and route them either in their IGP or even EGP (aka 
internet routes)...

-Payam
Network Engineer / Security Specialist



Scott Mcdermott wrote:
> Hello,
>
> I encountered a system today with two attached
> networks, one public and the other RFC1918.  The box
> had ip_foward=1, FORWARD chain empty, policy ACCEPT.
> rp_filter was set on both the interfaces.
>
> Now if I were somewhere off the public interface, but
> many hops away, there is no possible way to get packets
> to the RFC1918 side of the box is there?  Because I
> have no way to actually route the packets to the
> gateway with destination addresses on the far side.  So
> actually this box is safe from malicious activity, even
> though there is an ACCEPT policy on FORWARD and it's
> set with routing enabled.  Is this correct?
>
> Now if instead I have control of a station on the same
> segment as the gateway's public interface, or if I
> control routers in-between and can set up routes to get
> packets to the box with the internal IPs as
> destinations, then it's a different story.  But in the
> common case of having ISPs in between (which will drop
> my packets with RFC1918 destinations), it's not
> possible to get packets to the gateway's internal
> network except if they NAT some of them for me.
>
> Please help me to see if my understanding is correct.
>
> Thanks.
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>   

