From: Andrew Beverley <andy@andybev.com>
Subject: Re: PREROUTING
Date: Wed, 05 Oct 2011 23:05:31 +0100
Message-ID: <1317852331.26402.2250.camel@andybev-desktop>
References: <CAGwLQT0SRyga4go7uk2ujyPiBaD_K4jvd_XHCXG7YGi1hUxVbw@mail.gmail.com>
	 <CAGwLQT0UUvmuzuY1WkJ30KzMJhMGQggwJw6Rcqc=-O6Hcuam1g@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1317852331;
	bh=YdkGRStywcSLcZewDeW5KQQa8c4rF13CDyEI0YyqsH0=;
	h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-ID:Mime-Version:Content-Transfer-Encoding;
	b=Ci9kAVOvrD/v7MVlCHBrorMx1AGVWLIBZt8GMDhtjlDfhx4B3qfB+JY3apjgATKgo
	 NtH8HzPgSlW7ut/LZbPwyXEu5tPS48aaOB45unE4vEBHbjwRJRATKOkg21LwbkNEno
	 0TTDSMcDYMNWeePGcAAvbYjdnlU84rLSWQg3cB5w=
In-Reply-To: <CAGwLQT0UUvmuzuY1WkJ30KzMJhMGQggwJw6Rcqc=-O6Hcuam1g@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Chris Percol <chris.percol@gmail.com>
Cc: netfilter@vger.kernel.org

On Wed, 2011-10-05 at 12:49 +0100, Chris Percol wrote:
> Hi,
> I am currently using the following rules on centos iptables to direct
> users from a --to-destination to different samba servers.
> What is the best approach to take to allow the users of 10.91.0.0 to
> also access Samba Server A?

I don't understand what you are trying to achieve. There are no
filtering rules below, so anybody trying to access Samba Server A will
be able to do so anyway?

> # Samba Server A
> /sbin/iptables -t nat -A PREROUTING -p udp --dport 137 -j DNAT
> --to-destination 192.168.1.10 --source 10.90.0.0/16
> /sbin/iptables -t nat -A PREROUTING -p udp --dport 138 -j DNAT
> --to-destination 192.168.1.10 --source 10.90.0.0/16
> /sbin/iptables -t nat -A PREROUTING -p tcp --dport 139 -j DNAT
> --to-destination 192.168.1.10 --source 10.90.0.0/16
> /sbin/iptables -t nat -A PREROUTING -p tcp --dport 445 -j DNAT
> --to-destination 192.168.1.10 --source 10.90.0.0/16
> 
> # Samba Server B
> /sbin/iptables -t nat -A PREROUTING -p udp --dport 137 -j DNAT
> --to-destination 192.168.2.10 --source 10.91.0.0/16
> /sbin/iptables -t nat -A PREROUTING -p udp --dport 138 -j DNAT
> --to-destination 192.168.2.10 --source 10.91.0.0/16
> /sbin/iptables -t nat -A PREROUTING -p tcp --dport 139 -j DNAT
> --to-destination 192.168.2.10 --source 10.91.0.0/16
> /sbin/iptables -t nat -A PREROUTING -p tcp --dport 445 -j DNAT
> --to-destination 192.168.2.10 --source 10.91.0.0/16
> 
> Thanks,
> Chris
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


