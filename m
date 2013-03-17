From: AZ 9901 <az9901@gmail.com>
Subject: Re: iptables as a protocol demultiplexer
Date: Sun, 17 Mar 2013 07:52:34 +0100
Message-ID: <62BA4C8A-48F1-4A29-8D6E-80516C7353F7@gmail.com>
References: <E7857ABB-9A3D-4FB2-AFA9-B282454FC070@gmail.com> <3206069C-4429-4819-BF78-B0CC5D989EA7@gmail.com> <alpine.LNX.2.01.1303161917580.8551@nerf07.vanv.qr> <2E9226BB-D2AD-4161-94A9-8CB0722953CC@gmail.com> <alpine.LNX.2.01.1303162031530.23560@nerf07.vanv.qr>
Mime-Version: 1.0 (Apple Message framework v1283)
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:subject:mime-version:content-type:from:in-reply-to:date
         :cc:content-transfer-encoding:message-id:references:to:x-mailer;
        bh=PBrWfmvU36V0j+Mn5ifgY3ZmpB/zuXo/aq6cqK1YHYc=;
        b=Am4uF/SAlcjP+e1PTaiJ+mmi+BNOQDcSV2E5g5hTIUZgczJ3qP/TYmZhrfEgOhjiWZ
         EkFeHrKptAbPJkt3QAb8qLMY9gIp+tnpOIFbSUmu8lpKI+G7gfPkwYZEmwoAvrNcDsdB
         +1CivMaIekgl8kPS/AY3OlFB5zdDTWeAzUu75osJIKVGJUBqdHU/gDfQrvO2KgdOrtjc
         uYdiPCp2u/iFXkoTgLXV3K19l2UTNoZ5rX5eQeTxWYG8EF/a7/DWKN2aNz9uP0GS3nGC
         WOMHZWm7ohFE1bDESaqsuflS2pPzJGNQ/EZzJ3wlfece7C6gIG2WOO2VINoguulR1mFu
         QM4Q==
In-Reply-To: <alpine.LNX.2.01.1303162031530.23560@nerf07.vanv.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jan Engelhardt <jengelh@inai.de>
Cc: netfilter@vger.kernel.org

Le 16 mars 2013 =E0 20:32, Jan Engelhardt a =E9crit :
> On Saturday 2013-03-16 19:27, AZ 9901 wrote:
>> Le 16 mars 2013 =E0 19:18, Jan Engelhardt a =E9crit :
>>> On Saturday 2013-03-16 18:25, AZ 9901 wrote:
>>>> Le 12 mars 2013 =E0 19:09, AZ 9901 a =E9crit :
>>>>>=20
>>>>> sslh (http://www.rutschle.net/tech/sslh.shtml) works as a protoco=
l demultiplexer, it allows to separate SSH and HTTPS streams which arri=
ve on the same port (443 for instance).
>>>>> I would like to do the same thing but with iptables only.
>>>>> Is it possible ?
>>>=20
>>> No. As the name already says, it works at the IP/Network level,
>>> not with upper protocols.
>>=20
>> Yes but I was thinking of something like that :
>> - use "string" module to catch the first packet of a SSH connection =
(looking for SSH- pattern, as sslh does in its probe.c source file)
>=20
> The first packet is an empty TCP SYN.
>=20
>> - use conntrack to follow this detected SSH connection
>> - redirect this detected SSH connection from port 443 to port 22
>=20
> NAT mappings must be applied before any packet is forwarded,
> which is why the decision must happen with the first packet.
>=20
So as the first packet of the connection is an empty packet, no chance =
to do what I want.
OK, thank you very much for your help Jan !