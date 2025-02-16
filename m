Received: from sphereful.sorra.shikadi.net (sphereful.sorra.shikadi.net [52.63.116.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49F7E179A3
	for <netfilter@vger.kernel.org>; Sun, 16 Feb 2025 11:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.63.116.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739704633; cv=none; b=mTEZQDtHwbzzDUUEYmsJcJNIHaulcKcAGXTBA8G4FYL8lPow5WfSfYJCCBgDL0nCJ4cZl0+UNVBRcSPajf5LON0M6RQg7JwtG3eTWfzPBNeirueZJpWgtc0Z0j6m0dmfPBBd2gzYBysqwhtbWVUuILhN2XAuwWM7ByYQ9a+41l8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739704633; c=relaxed/simple;
	bh=ealR6N2UaU+RkQPLzAjaeBsReQXZF4MuJjRTDgs7Eog=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aKQbN37CBnFWL7LAei05vbRMJbilRf9neVeFdnZPsc7RdWE7mICVWXsE1E58R4M8hZTvIWPqtr5FLWRWi51ruEIAenX8EztoG+3Sov1i6Cyui6X2VcgaF0QX6XZ62VemyK5aAZrkrC4kBXXTHdydg3lvOqQHA1scnLwl/N6LGwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=shikadi.net; spf=pass smtp.mailfrom=shikadi.net; dkim=pass (2048-bit key) header.d=shikadi.net header.i=@shikadi.net header.b=WTmerPKO; arc=none smtp.client-ip=52.63.116.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=shikadi.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shikadi.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shikadi.net header.i=@shikadi.net header.b="WTmerPKO"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=shikadi.net
	; s=since20200425; h=MIME-Version:References:In-Reply-To:Message-ID:Subject:
	Cc:To:From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=c/nBz5Q2fydy5mI7c2ysYS6/HZ3diOdz/UxWvrIVoRc=; b=WTmerPKOTDt6Vb0ifLDk1Pt+uz
	JI1Gw0t6YjA6qvbE/0TI5HBmhCXBzgWXKBL6V+u7EusKxxAREmuTcpkNUOfx1KORE6xcaOPfwYPNr
	VhteEHqzRs5xHsDSZ3MOCtkzi5UEDQJ+/sdAXOTZ7O2IaYpsLtKtowxA5sbS29jpI2abPcHI3LJq+
	ExQfM6S43nojIIWxY79mwR2Y0H21OrmSRfbgy/YGnm4t2be/8Uu8mPYMKMBCM9rfl2GP35GAPEDsm
	5lycy4by5N9X+40ycJgBvJDJyPbH9x1NzR9suL2CwOXC/O7WqqSIOjotlRTkH2xdc/JpYT7v9ESc9
	o2rvTsIw==;
Received: by sphereful.sorra.shikadi.net with esmtpsa (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <a.nielsen@shikadi.net>)
	id 1tjce4-0007sa-36;
	Sun, 16 Feb 2025 21:17:09 +1000
Date: Sun, 16 Feb 2025 21:17:06 +1000
From: Adam Nielsen <a.nielsen@shikadi.net>
To: Alon Bar-Lev <alon.barlev@gmail.com>
Cc: netfilter@vger.kernel.org
Subject: Re: Static bidirectional static NAT for duplicate IP devices using
 iptables
Message-ID: <20250216211706.75db769a@gnosticus>
In-Reply-To: <CAOazyz0-dyiynzHLwa=a4iMXhUQ9jn7uGM3nYjwc8+QjxZaK+Q@mail.gmail.com>
References: <CAOazyz1wYSHCYt+nk7hu2fmiW+GRRMMX0sejAa-31xH_VeWvXA@mail.gmail.com>
	<CAOazyz2H52h0unuTEadOFP3cWD7CfHUMG+HUGwVnnZQjtWRJ9g@mail.gmail.com>
	<CAOazyz3dGP+QJ_BOvXQ7gnQzTvOhGcxwA9y-RRJx=CjmMNmWhw@mail.gmail.com>
	<20250216124022.127f90f3@gnosticus>
	<CAOazyz0KRqij4oenpBKbgQHJMem18OAQmNkyytfPSG0y0L6X_w@mail.gmail.com>
	<20250216201217.6d99e00c@gnosticus>
	<CAOazyz0-dyiynzHLwa=a4iMXhUQ9jn7uGM3nYjwc8+QjxZaK+Q@mail.gmail.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

> > Think of a normal NAT gateway.  You connect to a remote host, but you
> > send that packet to the gateway.  The gateway changes the source IP
> > address and then forwards on the packet.  This way altering ARP is not
> > necessary, because a real IP belonging to the machine is used for
> > outgoing traffic.  The normal ARP process handles it all as usual.  
> 
> I am unsure how you use NAT to perform the entire network
> transformation of 192.168.0.X <-> 10.0.0.X.

It is partly NAT and partly routing:

  Client                  Client
  ping 192.168.110.10     ping 192.168.111.10
   |                       |
   +--------------------+--+
                        |
                     Router:
   For 192.168.110.10:     For 192.168.111.10:
   v10@eth0                v11@eth0
   10.0.0.10               10.0.0.11
    |                       |
   Device 1                Device 2
   10.0.0.2                10.0.0.2
   (ping from 10.0.0.10)   (ping from 10.0.0.11)
    
> > If you do the same in your situation, then your 10.0.0.10 device will
> > need to see traffic coming from 10.0.0.X (whatever IPs you assign
> > v10@eth0 and v11@eth0).  Because these IPs are in the same subnet, you
> > don't need to deal with ARP issues or routing the reverse traffic as
> > you would if you kept the 192.168.x source IP.  
> 
> I cannot do this, the packets should be outgoing to the device in the
> 10.0.0.X address.
> Hence I need a full transformation of addresses of both source and
> destination addresses.

Yes, this is what I have explained.

> > Then all you have to do is configure your machine so that any traffic
> > destined for 192.168.110.10 and .111.10 gets the target IP changed to
> > 10.0.0.2 and gets sent out the right interface, and when packets come
> > back from 10.0.0.2 the reverse IP translation happens as well.  
> 
> I will be happy to test a specific configuration if you have, I do not
> understand how to
> perform the reverse NAT as my interface is NATing the use of the
> network and not in
> the usual direction.

My solution is to use NAT in both directions.  I am thinking these are
the steps:

 1. Outgoing packets to 192.168.110.10 must go to v10@eth0 and have the
    destination changed to 10.0.0.2.  The source IP must be 10.0.0.10.
 2. Incoming packets from 10.0.0.2 on v10@eth0 must have their source
    IP changed to 192.168.110.10.  The destination IP should be
    whatever the original IP was.
 3. Same again for v11@eth0 and 192.168.111.10.

I think you should be able to use DNAT rules to change the destination
IP, and SNAT rules to change the source IP.  The only trick would be
getting packets for 192.168.110.10 sent to v10@eth0 (which has the IP
10.0.0.10/24).  I am not sure whether adding a route would be enough,
or whether you would have to add an IP like 192.168.110.99/24 to that
interface to have the routing happen as intended.

> > I think you probably need both SNAT and DNAT rules to make this work.
> > The SNAT rule would take care of ensuring outgoing packets have a
> > source address of 10.0.0.X, while the DNAT rule would map the 192.x
> > target address to 10.0.0.2.  
> 
> This is not the configuration I look for... I look for a configuration
> of full network
> static NAT 192.168.0.X <-> 10.0.0.X [x=1->254].

So far you have only described a single device 10.0.0.2.  Your original
question did not mention that you have 254 devices on the subnet!

> > I would try to use two different IPs for the VLAN interfaces, e.g.
> > 10.0.0.10 and 10.0.0.11, just to make things a bit simpler.  If you use
> > the same IP you may then run into ARP issues, unless both VLAN
> > interfaces have the same MAC address.  
> 
> There is no issue of ARP in this case as each interface resides in a
> different VLAN.

The problem I describe is that if v10@eth0 and v11@eth0 have different
MAC addresses, but the same IP address, the Linux kernel may respond to
the ARP request with the MAC address of the wrong interface, since two
different interfaces with the same IP is not a normal situation.

Think of it like this:  You have MAC address A for 10.0.0.5 (v10@eth0)
and MAC address B also for 10.0.0.5 (v11@eth0).  An ARP request comes in
asking what the MAC address is for 10.0.0.5.  Do you reply A or B?

The answer is different depending on which interface the request came
in on, and I am not sure whether the kernel cares about this.  In the
past it did not, because you are supposed to have a different IP
address for every network interface.

Cheers,
Adam.
