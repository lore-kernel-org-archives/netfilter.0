From: Andrew Beverley <andy@andybev.com>
Subject: Re: Help with Load Balancing
Date: Tue, 16 Jul 2013 20:47:35 +0100
Message-ID: <1374004055.1851.146.camel@andrew-desktop>
References: <CADuigkViSbrbHoO_8-htS-6yRvEqi5MoRdB32N=MSexyjxS1Hg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CADuigkViSbrbHoO_8-htS-6yRvEqi5MoRdB32N=MSexyjxS1Hg@mail.gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1374004063;
	bh=qvqG4YX8xANXtPAVmKDWmsV3pXOyxxsMMpF1MGNveWg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:Mime-Version;
	b=Yn/+j3K+kPp93Oon2l0WYy6vVBWapGJTSMjNDWDX09r0ztrWnR9kWwq4H2hi80fpB
	 CFuBtFEJZWvw/2qIjTptMqcAfZMyqcm9bWTvwHm85M2tP205kc0JVSduseuU1RmT8G
	 ReC7vIgGeIW1UcauCchgTUB7GgrT4/Th0y0xX7x4=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ricardo Klein <klein.rfk@gmail.com>
Cc: netfilter <netfilter@vger.kernel.org>

On Tue, 2013-07-16 at 00:23 -0300, Ricardo Klein wrote:
> I think IPRoute is the one who should make the magic, but, if anyone
> can help me here, even pointing me in the right way....
> 
> I know I can split my 2 connections in a static way, making lan subnet
> A go trough uplink 1 and lan subnet B trough uplink2, but, there is
> any way to make this "automatic" like "Hey iproute2, use the least
> used uplink to let users fly"
> 
> I know, if user A is using uplink1 it should go trough that link until
> the end of the navigation, but, later in new requests he should be
> able to start the connection using uplink 2 if uplink 1 is starving.
> 
> Is there any way to reach that with Linux?

AFAIK, there is no "automagic" way of doing exactly what you want.
However, I have had good experience with just randomly splitting new
connections between 2 uplinks (or more accurately splitting every other
new connection between each link). Depending on your number of users, as
a general rule this will share equally between links (certainly a lot
better than doing it between subnets).

This is a tutorial I have used:

http://www.sysresccd.org/Sysresccd-Networking-EN-Iptables-and-netfilter-load-balancing-using-connmark

And this is my project:

http://andybev.com/index.php/PortalShaper

Andy


