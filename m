From: Andrew Beverley <andy@andybev.com>
Subject: Re: Redirecting DNS Not Working
Date: Fri, 15 Feb 2013 17:05:11 +0000
Message-ID: <1360947911.2251.24.camel@andylaptop>
References: <CAFURDX-tc6+LgpcUhAeOE3i2=uh=bjjVaCHTGvZbO_Ty2+zV_A@mail.gmail.com>
	 <1360946103.2251.2.camel@andylaptop>
	 <CAFURDX-qor3-w4tVMt-aLfH2_tbNNz1KQwRHMA99MrzZL1UT9w@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAFURDX-qor3-w4tVMt-aLfH2_tbNNz1KQwRHMA99MrzZL1UT9w@mail.gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1360947928;
	bh=4hZ/RpnADQuGk7LTWhBcM3JHh/G5S2MHZLwvVDl6Ktk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:Mime-Version;
	b=vJRrL9iUY6i/PushhZnHY5jXIeJcDXM3T2nqD4gAhMaTY7WZcyTeShKgf6JBkakhj
	 Ib+6FMQICHQqUEPIvRbO0uGLl0lrpT/giNcSzlZW/TJyRKp9zgENyQNSVXyZTp9E5/
	 UPMlJQVjfGNuTs7xRzLH4DNMfcsXc75iPyqUh3JY=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: John Corps <envoys@gmail.com>
Cc: netfilter@vger.kernel.org

On Fri, 2013-02-15 at 11:46 -0500, John Corps wrote:
> >> What I want to do is if
> >> they set there own DNS, redirect them anyways back to the internal
> >> DNS. Here are the only 2 rules I have tried but they do not work at
> >> all, maybe i am missing something? Any help would be greatly
> >> appreciated!
> >>
> >> iptables -t nat -A PREROUTING -s 192.168.1.0/24 -p tcp -m tcp --dport
> >> 53 -j REDIRECT --to-ports 53
> >> iptables -t nat -A PREROUTING -s 192.168.1.0/24 -p udp -m udp --dport
> >> 53 -j REDIRECT --to-ports 53
> >
> > If you want to redirect the requests to the local server, then you'll
> > need to use the DNAT target instead. All you're doing in your rules is
> > changing to port 53 a packet that is destined to port 53 (so nothing at
> > all).
>
> Tried this... and same result, page not displayed. Keep in mind these
> are the only rules I have for iptables, do I need any other ones?

[ Please don't top-post ]
 
> iptables -t nat -A PREROUTING -p tcp --dport 53 -j DNAT
> --to-destination 192.168.1.2:53
> iptables -t nat -A PREROUTING -p udp --dport 53 -j DNAT
> --to-destination 192.168.1.2:53

It probably won't matter, but I would add the interface or source IP
addresses, in order to only match packets from your local network.

These 2 rules alone should work. To debug, I would change the target to
LOG and check that the packets are being matched successfully.

> iptables -t nat -A PREROUTING -p tcp --sport 53 -j DNAT
> --to-destination 192.168.1.2:53
> iptables -t nat -A PREROUTING -p tcp --sport 53 -j DNAT
> --to-destination 192.168.1.2:53

You don't need these. They may be messing up the packets being sent from
the external DNS server.

Andy


