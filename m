From: "Timur Alperovich" <timur.alperovich@gmail.com>
Subject: Re: ROUTE target
Date: Fri, 8 Feb 2008 16:32:03 -0500
Message-ID: <52950c3f0802081332l2472c8bbm46cd376fc9e7145e@mail.gmail.com>
References: <52950c3f0802071618yb755744l6936484d08482b93@mail.gmail.com>
	 <002e01c86a20$801533b0$803f9b10$@info>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=OegJr7dnscnwr/lP8z025OAYm2KuWh9UcJ/e8aVXroY=;
        b=xRYEF5pJ/9eMQ+exB+ufzf5QII+QSXOuzNMCgtgt5iw2Wx3lIxRLJivn2umPRzNqWcR0N8gidyetKSWQqsT+DtYqcozMewGEbVGQQcumn39snyM0wImi3qCqQv/KQQBvUB1zZsvxP03TI67pr0rkMclJFg9mGiIYNpnmd0tD4Ec=
In-Reply-To: <002e01c86a20$801533b0$803f9b10$@info>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Thanks for the link! I got the ROUTE target working, but now I'm a bit
confused. I have 3 connections on a router. 2 to the ISP, ISP1 & ISP2,
and one for the LAN. I'd like all the LAN traffic bound for the
internet to be routed to ISP1 and all the traffic the router generates
locally to go through ISP2. I tried adding something like iptables -A
OUTPUT -j ROUTE --oif ISP2, which broke the LAN setup, as that traffic
was then forwarded through ISP2 too. I'm not sure why that happened.
The entry in the nat table for Masquerading is -t nat -o ISP1 -s
172.27.169.0/24 -j MASQUERADE. Anyone setup something similar?

Thank you,
Timur

>
> > Hi,
> >
> > I noticed there was a patch to add the ROUTE target and mangle the
> > interface used by the packets. I was looking through patch-o-matic-
> > ng and couldn't find it. I presume because it's not supported
> > anymore.
> > What is a way to accomplish similar results with netfilter? For
> > instance, if someone could give me an example of how to force all
> > ICMP packets through eth0, that would be great.
>
> http://marc.info/?t=120048157400002&r=1&w=2
>
>
> Grts,
> Rob
>
>
> -
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
