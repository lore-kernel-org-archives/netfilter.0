From: Born Without <blackhole@airpost.net>
Subject: Re: FW: Packets missing the NAT table
Date: Sun, 06 Jan 2013 18:08:23 +0100
Message-ID: <50E9AF87.7070403@airpost.net>
References: <00a901cdec28$006d1c10$01475430$@telsatbb.vu>
Reply-To: blackhole@airpost.net
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=airpost.net; h=
	message-id:date:from:reply-to:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	 s=mesmtp; bh=WrbHmtkUheSCgDwFRgVr8OpjjmI=; b=fOp2HDZyXEVaY8WsBH
	5eC+hX8Vjm+bYIRSOkAetJ/3kpDChwztYbrMtMEDFX91EosqxvM1WEbuO8k0cymZ
	10uT5/qyQmxnvjTXfBj60cWlnWtLx9eXo2F3GVYGBHGViZn5mRowjBzKJ7h7Wptb
	fRcSHI2ctQcLmICA49t1BhFM4=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=message-id:date:from:reply-to
	:mime-version:to:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding; s=smtpout; bh=WrbHmtkUheSCgDwFRgVr8O
	pjjmI=; b=VIGwF3t/4kahIXs2X6Qok2pW2+ZbWKtqb/QsgyZTU5XRy3r9dofJHn
	NaWiKkOAadBOYwfV0gEcQ/Kzg6/X3ssFkh/5PTYMkMOJPCaU6ai0C0RdGgj19Ggx
	ib62/r4gOxGQnhkXP9JykuI/JIoRi+PUKdfJR+zXlasm/+z4Nwids=
In-Reply-To: <00a901cdec28$006d1c10$01475430$@telsatbb.vu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: "Steve (Telsat Broadband)" <steve@telsatbb.vu>
Cc: netfilter@vger.kernel.org

On 06.01.2013 17:08, Steve (Telsat Broadband) wrote:
> Hi All,
>
> I=92m just trying to debug an issue on our network and I=92ve noticed=
 that some
> packets are being missed from some rules in the NAT table.
>
> Do all packets go through the NAT table or is there some exclusion?  =
I=92m
> seeing the packet hitting the mangle table as well as the filter tabl=
e, but
> not the NAT?

What I've read in the past, the nat table is only consulted at=20
connection initiation for conntrack state NEW packets.
If conntrack qualifies a packet as INVALID this won't get natted and=20
sent out as is (if not dropped from another rule).
Try to catch the invalid packets with:
-m conntrack --ctstate INVALID
and see if these are the suspected ones.

