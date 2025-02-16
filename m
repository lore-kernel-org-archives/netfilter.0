Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D32214F98
	for <netfilter@vger.kernel.org>; Sun, 16 Feb 2025 10:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739701269; cv=none; b=pjjLP5boPve0Ui0PlcAZL7Y4HqZjutNtTDsOCn/hjDVUSMeTQGGpplCbaYAjnum+UyrsFqyf1k4vI5tQ77zVh3v0eAWOgs5wNdZW42adg9IDal6s3Yc/rUpdMyPhbgK0lqDbD9ekUWjftTJiq4r5tdTmhklyME8qsee1OLpFJXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739701269; c=relaxed/simple;
	bh=vIssjM/f2y1Vsxyv7tLDP0uikdZj4WIpCjs7JxxTLtA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tj8skLV83hWSH00AJCSZRr50IDXwdYVOnMM914eUT1eTO6Ye/ggiIrWRR2fIXbChJaMpc/T1eg4MQUlBrmjVzsEaVHxNFgpoDJ4FBDds3zw9X7EbAL1lQ2Pclllb8n3nLasNBYF0Ofn1F4qqWtz5sjpHWrCVSW9DNHVQj1p+mFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X+qEqDRC; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X+qEqDRC"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3f3ecb58c95so540892b6e.2
        for <netfilter@vger.kernel.org>; Sun, 16 Feb 2025 02:21:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739701267; x=1740306067; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yo2GtvBkJNdhdUbIXu6hBI20VUB+BCQFXxUBYDNx1eE=;
        b=X+qEqDRCaR+hw+yOWUEIDq3n5LIGUXENLbgyRT5pmB4sgkAfPQN20S7GxMydLmtVrh
         ZJYxbId9lwZchZLp+IKAdRq2Vw/fs/QOex5RASJNcblFW7MBLdDDasN7Z8OOvDo69oq4
         8EtNCV09uNgvi0DAUMc48SBTErZbxfMnlHzAkFZn18BJPH1Zo6N2zGu7Os7GdNBN/GWr
         lXDKG97nmz8dpgwK0nLUM3TpcugQJ41XZRibSXnmKEvzsYtUJcgaxj7HE/PxKLqn+B6L
         ZpVTzfjvebSUiopcPoMqrr2csLMN37FPExAqhemHPK+ObYanFMlDbEPzqEX3sx/Gi1EP
         xLNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739701267; x=1740306067;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yo2GtvBkJNdhdUbIXu6hBI20VUB+BCQFXxUBYDNx1eE=;
        b=ptZjY2tZlvb7EQ2INnw9W26V5eNZzKqdRiOUrlx5H0cMwNyjmWic1Aec09ODBT6s33
         gbkpAPE0GAswlbEv1pQp4jbk8Muh8AqzmPdf6+GL27ct4U2lfZW1WY6ikd7foArFv7Ew
         7XBsA5LeXoN/oVdyWhwkUe5M7yAdoaBPVS7fewyciYNDkFSQX8MSPe3scirr4tXg/S6+
         0n4/tqbvht25/5CgkekEzq9ECrQ6/Tf+1BIr+m+CUcO5djFupInX6SKo0VKAOuKlHg/u
         EWUHU/YgkMs8BJU2z7uBD0G7M1vuqjE6YZnyNkEXVd5fwOYHi1d7VLLGDX2fFeAKHiCO
         J0jg==
X-Gm-Message-State: AOJu0Yy/whwKtdIgYaGgMda3/FuZBR2RjnRlxsSu2qdheUAjxLZ0kKjE
	16BEP52gBCZ+zi5n/fm4DlfbPV7RpjAmc+GqLhzsM/h7zqShASMPwnolXogCjAtXte6LoIjR7Ja
	jc9wBT4RgOUkqvfAMf8Mkbc7rs58=
X-Gm-Gg: ASbGncs3YlIkEeWRgqdZC73iMh1BnzNTlPHGnna8l1xwbaIkTlM0wN6h0U/idaRmYfS
	x/xuw2Z2ZcJjs0B+ZcSWfgkB5EunzF3BBdx3eR0njtUgmXuFyAV8Jj5TzehLyvMT+wfomJx0=
X-Google-Smtp-Source: AGHT+IH9scQlxGz9cwbsMi0SLIVtAvv6aO7tiWNuQy73UiSAr3+fyOny97GF8aYepdn5IWOXJYLYEtXhbjegYREZ31c=
X-Received: by 2002:a05:6808:1529:b0:3eb:7ec4:f3ba with SMTP id
 5614622812f47-3f3eb08a3b8mr4227615b6e.2.1739701266958; Sun, 16 Feb 2025
 02:21:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAOazyz1wYSHCYt+nk7hu2fmiW+GRRMMX0sejAa-31xH_VeWvXA@mail.gmail.com>
 <CAOazyz2H52h0unuTEadOFP3cWD7CfHUMG+HUGwVnnZQjtWRJ9g@mail.gmail.com>
 <CAOazyz3dGP+QJ_BOvXQ7gnQzTvOhGcxwA9y-RRJx=CjmMNmWhw@mail.gmail.com>
 <20250216124022.127f90f3@gnosticus> <CAOazyz0KRqij4oenpBKbgQHJMem18OAQmNkyytfPSG0y0L6X_w@mail.gmail.com>
 <20250216201217.6d99e00c@gnosticus>
In-Reply-To: <20250216201217.6d99e00c@gnosticus>
From: Alon Bar-Lev <alon.barlev@gmail.com>
Date: Sun, 16 Feb 2025 12:20:51 +0200
X-Gm-Features: AWEUYZmihws0zIbFOsSwsBJJApIYzgX8NENqB2UsX0WtYcCGXA80jr-tsmkiJnY
Message-ID: <CAOazyz0-dyiynzHLwa=a4iMXhUQ9jn7uGM3nYjwc8+QjxZaK+Q@mail.gmail.com>
Subject: Re: Static bidirectional static NAT for duplicate IP devices using iptables
To: Adam Nielsen <a.nielsen@shikadi.net>
Cc: netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 16, 2025 at 12:12=E2=80=AFPM Adam Nielsen <a.nielsen@shikadi.ne=
t> wrote:
>
> > > I am by no means an expert but I would've thought that all you're
> > > trying to do is to convert a 192.x address into the same target IP, a=
nd
> > > just control which interface the packet goes out on based on whatever
> > > the original IP address was.
> > >
> > > Is ARP mangling needed at all for this?
> >
> > Hello Adam,
> >
> > What I am looking for is a static NAT to have 1:1 replacement of
> > addresses from one subnet to another subnet.
> > For example having 192.168.0.X <-> 10.0.0.X in both directions, so
> > that 192.168.0.1 =3D=3D 10.0.0.1, 192.168.0.2 =3D=3D 10.0.0.2 and so on=
.
> > The NAT is in reverse so that it does not NAT incoming but outgoing
> > communications.
> > And to make it more difficult, two interfaces share the same
> > destination address, so that we need to assign them with different
> > virtual addresses.
> > In my example I proposed two conversions: 192.168.110.X <-> 10.0.0.X
> > and 192.168.168.111 <-> 10.0.0.X.
> > The 10.0.0.X is the device network which cannot be modified.
> >
> > Do you know of a NAT configuration that can digest this?
> > For now the only solution I could come up with is filter hooks + arptab=
les.
>
> ARP deals with mapping a MAC address to an IP address.  I don't think
> you need to operate at this low level, and I think messing with ARP is
> going to complicate what you're trying to do.

I used the ARP as in my setup I use hook modification of the IP
addresses and this does
not include the ARP. It is working reliably if I reply to the ARP
request of the device.
I am open to a NAT solution, however, I do not understand how to make
it work for this
use case.

> Think of a normal NAT gateway.  You connect to a remote host, but you
> send that packet to the gateway.  The gateway changes the source IP
> address and then forwards on the packet.  This way altering ARP is not
> necessary, because a real IP belonging to the machine is used for
> outgoing traffic.  The normal ARP process handles it all as usual.

I am unsure how you use NAT to perform the entire network
transformation of 192.168.0.X <-> 10.0.0.X.

> If you do the same in your situation, then your 10.0.0.10 device will
> need to see traffic coming from 10.0.0.X (whatever IPs you assign
> v10@eth0 and v11@eth0).  Because these IPs are in the same subnet, you
> don't need to deal with ARP issues or routing the reverse traffic as
> you would if you kept the 192.168.x source IP.

I cannot do this, the packets should be outgoing to the device in the
10.0.0.X address.
Hence I need a full transformation of addresses of both source and
destination addresses.

> Then all you have to do is configure your machine so that any traffic
> destined for 192.168.110.10 and .111.10 gets the target IP changed to
> 10.0.0.2 and gets sent out the right interface, and when packets come
> back from 10.0.0.2 the reverse IP translation happens as well.

I will be happy to test a specific configuration if you have, I do not
understand how to
perform the reverse NAT as my interface is NATing the use of the
network and not in
the usual direction.

> This might be tricky since both interfaces will be in the same subnet,
> but since the packet leaving the machine will already be in the same
> subnet as the destination IP, you won't need to deal with ARP at all as
> it will be handled automatically.
>
> I think you probably need both SNAT and DNAT rules to make this work.
> The SNAT rule would take care of ensuring outgoing packets have a
> source address of 10.0.0.X, while the DNAT rule would map the 192.x
> target address to 10.0.0.2.

This is not the configuration I look for... I look for a configuration
of full network
static NAT 192.168.0.X <-> 10.0.0.X [x=3D1->254].

> I would try to use two different IPs for the VLAN interfaces, e.g.
> 10.0.0.10 and 10.0.0.11, just to make things a bit simpler.  If you use
> the same IP you may then run into ARP issues, unless both VLAN
> interfaces have the same MAC address.

There is no issue of ARP in this case as each interface resides in a
different VLAN.

Thank you for your assistance!
Alon Bar-Lev.
