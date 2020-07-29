From: harald@a-little-linux-box.at
Subject: Re: usings sets as input to sets
Date: Wed, 29 Jul 2020 16:26:03 +0200 (CEST)
Message-ID: <20200729142603.47A69401E2@i-am.a-little-linux-box.at>
References: <20200728092724.677EC40A2A@i-am.a-little-linux-box.at> <20200729121712.GA5271@breakpoint.cc>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=a-little-linux-box.at;
        s=dkim; t=1596032763;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=nmIh+ndAO0IIbbY5D4W28wvSmrk0N9RXk9z7Wcw0LHg=;
        b=rJbkM2pTsI1U7zpicqSF5WVBZdpS8giR87d3D+CrL0+aO80Z/5CEX1hYg7NmFnIirfzkQ1
        jQm1P1rv4EXNVBGlddMk9ZYMVvRWdrNliJXx9F8K6RF53f12iwMjlgE3/LyPetS1KxEvSB
        D0+XsQGk9yGQAGp40yDsWvnO/yvW3CfERiTXsS3PrEIOHqctsOWcQx7jMcGw+FQmufHTCZ
        nE+bS/eoaGa9PyumGkATFdy8sIQP7C3BrWCJTZka+5F2h2PTtTRNaaA4XpkxwzZiBHA2vg
        1d2RMTUEY75LpaT7DHs6egeNewcjSDiDrtM2PpuD8tz9nuouaopqYJsmLPq+cShcQ2hhkF
        mTX1tVxVC0o8uv3pulB9OrnJqNLtDakVtcpVryLayqEELo7Fi9dtiCTo90y 
In-Reply-To: <20200729121712.GA5271@breakpoint.cc>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Florian Westphal <fw@strlen.de>
Cc: netfilter@vger.kernel.org

> [..]
>> table inet portknock {
>>         set port2 {
>>                 type inet_service
> [..]
>=20
>>         set candidates {
>>                 type ipv4_addr . inet_service
>>                 flags timeout
>>         }
>=20
> [..]
>>                 tcp dport 12345 add @candidates {ip saddr . @port2 timeo=
ut 10s}
>=20
> What is that supposed to do?

It's supposed to add the ip saddr and the dynamically added port from set p=
ort2 to set candidates.

>=20
> @candidate expects ip address + port.

Well port2 is defined as inet_service so that would match wouldn't it?

>=20
>> So my question is is this even supposed to work or not? If not then mayb=
e somebody could tell me why and if it is supposed to work why doesn't it?
>=20
> Its not possible to add a set to a set, if thats what you are asking.

So you can only add a number or a port description to an inet_service set b=
ut not a set which contains an inet_service, I understand.

>=20
> I suspect you already found
> https://wiki.nftables.org/wiki-nftables/index.php/Port_knocking_example ?

Yes my version is a modifified example of the first one.

>=20

