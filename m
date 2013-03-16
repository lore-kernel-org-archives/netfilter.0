From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: iptables as a protocol demultiplexer
Date: Sat, 16 Mar 2013 19:18:44 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1303161917580.8551@nerf07.vanv.qr>
References: <E7857ABB-9A3D-4FB2-AFA9-B282454FC070@gmail.com> <3206069C-4429-4819-BF78-B0CC5D989EA7@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <3206069C-4429-4819-BF78-B0CC5D989EA7@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="utf-8"
To: AZ 9901 <az9901@gmail.com>
Cc: netfilter@vger.kernel.org


On Saturday 2013-03-16 18:25, AZ 9901 wrote:
>Le 12 mars 2013 =C3=A0 19:09, AZ 9901 a =C3=A9crit :
>>=20
>> sslh (http://www.rutschle.net/tech/sslh.shtml) works as a protocol d=
emultiplexer, it allows to separate SSH and HTTPS streams which arrive =
on the same port (443 for instance).
>> I would like to do the same thing but with iptables only.
>> Is it possible ?

No. As the name already says, it works at the IP/Network level,
not with upper protocols.

>> I think that using PREROUTING, string, conntrack... it could be.
>> I tried but I did not manage to make it work.
