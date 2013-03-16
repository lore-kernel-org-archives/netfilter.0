From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: iptables as a protocol demultiplexer
Date: Sat, 16 Mar 2013 20:32:36 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1303162031530.23560@nerf07.vanv.qr>
References: <E7857ABB-9A3D-4FB2-AFA9-B282454FC070@gmail.com> <3206069C-4429-4819-BF78-B0CC5D989EA7@gmail.com> <alpine.LNX.2.01.1303161917580.8551@nerf07.vanv.qr> <2E9226BB-D2AD-4161-94A9-8CB0722953CC@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <2E9226BB-D2AD-4161-94A9-8CB0722953CC@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="utf-8"
To: AZ 9901 <az9901@gmail.com>
Cc: netfilter@vger.kernel.org


On Saturday 2013-03-16 19:27, AZ 9901 wrote:
>Le 16 mars 2013 =C3=A0 19:18, Jan Engelhardt a =C3=A9crit :
>> On Saturday 2013-03-16 18:25, AZ 9901 wrote:
>>> Le 12 mars 2013 =C3=A0 19:09, AZ 9901 a =C3=A9crit :
>>>>=20
>>>> sslh (http://www.rutschle.net/tech/sslh.shtml) works as a protocol=
 demultiplexer, it allows to separate SSH and HTTPS streams which arriv=
e on the same port (443 for instance).
>>>> I would like to do the same thing but with iptables only.
>>>> Is it possible ?
>>=20
>> No. As the name already says, it works at the IP/Network level,
>> not with upper protocols.
>
>Yes but I was thinking of something like that :
>- use "string" module to catch the first packet of a SSH connection (l=
ooking for SSH- pattern, as sslh does in its probe.c source file)

The first packet is an empty TCP SYN.

>- use conntrack to follow this detected SSH connection
>- redirect this detected SSH connection from port 443 to port 22

NAT mappings must be applied before any packet is forwarded,
which is why the decision must happen with the first packet.

