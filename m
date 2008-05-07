From: Gary Renshaw <gary@trilunar.ca>
Subject: Re: SNAT spoofing problem
Date: Wed, 07 May 2008 13:55:25 -0600
Message-ID: <4822092D.6050803@trilunar.ca>
References: <4821ED37.3020201@trilunar.ca> <4821FCE3.1060400@freemail.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4821FCE3.1060400@freemail.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-2?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Cc: netfilter@vger.kernel.org

That's true but I thought that the SNAT would re-write the outgoing ICM=
P=20
packet so that its source address is 192.168.1.1 instead of 192.168.1.2=
=20
-- thus making it look to the receiver as if it had come from the=20
gateway instead of the stealth host.  The gateway itself is not involve=
d=20
except for being an existing host on the same subnet.

Do I need to do this some other way?

Gary

G=E1sp=E1r Lajos wrote:
> Gary Renshaw =EDrta:
>>
>> It looks like the SNAT is doing nothing at all.  What am I missing?
> You are in one subnet.... NO PACKET GOES THROUGH your gateway...
>>
>> Thanks,
>> Gary

--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Trilunar Consulting    http://www.trilunar.ca/
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
