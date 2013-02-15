From: Andrew Beverley <andy@andybev.com>
Subject: Re: Redirecting DNS Not Working
Date: Fri, 15 Feb 2013 18:13:42 +0000
Message-ID: <1360952022.2174.1.camel@andylaptop>
References: <CAFURDX-tc6+LgpcUhAeOE3i2=uh=bjjVaCHTGvZbO_Ty2+zV_A@mail.gmail.com>
	 <1360946103.2251.2.camel@andylaptop>
	 <CAFURDX-qor3-w4tVMt-aLfH2_tbNNz1KQwRHMA99MrzZL1UT9w@mail.gmail.com>
	 <1360947911.2251.24.camel@andylaptop>
	 <CAFURDX9==GRygRJNADXJa3zS1qxm1p0xomXGdtFGOOJz-eD2FA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAFURDX9==GRygRJNADXJa3zS1qxm1p0xomXGdtFGOOJz-eD2FA@mail.gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1360952051;
	bh=ukG74ttiegjAQHKMTjXiGdP35W+Hfgbw2vQd8tAK4wU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:Mime-Version;
	b=oJzhQK2XZw32rjJZ4Qv6jizlo8ZABfOHNdSlUXKhyeLE2jTB9tfr6dXXULA0YC+LP
	 m+1Klp2X3yTUkaPb6Sv7b/+MimFCoF/vf7try/8Ru7ws5+Hzlrmq53LXTu7w4c+xJL
	 h0eKgnmcb96flF5skG0ZQEV5tgEGX+sEcOcVLkMk=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: John Corps <envoys@gmail.com>
Cc: netfilter@vger.kernel.org

On Fri, 2013-02-15 at 12:28 -0500, John Corps wrote:
> Very odd...put on a simple logging of
> iptables -A INPUT -i eth1 -j LOG --log-prefix "DNS TEST INPUT drop: "
> 
> getting nothing in the logs...this is mind baffling. Even with TCPDUMP
> not seeing any packets unless i set client DNS to local ip of server,
> the 192.168.1.2 dns, set it to google for a test of 8.8.8.8 and get
> nothing in logs or with tcpdump.

What's your network topology? Any chance that the packets are not being
routed through your server?



