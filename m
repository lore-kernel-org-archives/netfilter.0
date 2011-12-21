From: Andrew Beverley <andy@andybev.com>
Subject: Re: NAT WAN IP to internal range?
Date: Wed, 21 Dec 2011 09:07:29 +0000
Message-ID: <1324458449.4269.49.camel@steve-pc>
References: <CANSq30tB6vk90gORs+bcLFvF3a8iwZcw8CbUpJFZJOH2YN-SXQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1324458447;
	bh=0/v5QTfFKif2Fpo+AQmRpPF7hhSJod+16k0Jg/Y6xOM=;
	h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-ID:Mime-Version:Content-Transfer-Encoding;
	b=mvd0vjaiaghpT1yP4hWRxt2IixUeQO9GhFqQpQCMjwDucr7SNkReh2PMncTOouNW1
	 xzNJiNoT57jnTW4hAkdanYq6wB8o+ph9WqqYFTXXBFZictoLh8ircwcNEiGALmJQqi
	 waMH+Q5fzLY+A0F02pwwwzffBAWbU8L4ooC9Lsjo=
In-Reply-To: <CANSq30tB6vk90gORs+bcLFvF3a8iwZcw8CbUpJFZJOH2YN-SXQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Andrew Stone <andrew@stonie.net>
Cc: netfilter@vger.kernel.org

On Mon, 2011-12-19 at 14:20 +1100, Andrew Stone wrote:
> Hello,
>=20
> I am having a bit of trouble following the documentation on assigning
> a range of NATed IPs.

Sorry, meant to reply to this earlier but forgot. The previous netfilte=
r
message just reminded me.

> My router has a several External IP=E2=80=99s assigned to the WAN int=
erface:
>=20
> WANIF=3D`get_wanface`
> ifconfig $WANIF:1 a.b.c.241 netmask 255.255.255.248 broadcast a.b.c.2=
47
> ifconfig $WANIF:2 a.b.c.242 netmask 255.255.255.248 broadcast a.b.c.2=
47
> ifconfig $WANIF:3 a.b.c.243 netmask 255.255.255.248 broadcast a.b.c.2=
47

Have you tried configuring the interface using iproute2 instead?

Something like:

ip address add a.b.c.241/29 dev $WANIF broadcast a.b.c.247

Andy


