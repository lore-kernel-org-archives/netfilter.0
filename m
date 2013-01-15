From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: iptables deactivate "getportbyname"
Date: Tue, 15 Jan 2013 15:35:36 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1301151534340.20597@nerf07.vanv.qr>
References: <50F5483C.9050807@kraftcom.de> <alpine.LNX.2.01.1301151350060.19279@nerf07.vanv.qr> <50F56710.30600@kraftcom.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <50F56710.30600@kraftcom.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="utf-8"
To: Manuel Scheub <manuel.scheub@kraftcom.de>
Cc: netfilter@vger.kernel.org


On Tuesday 2013-01-15 15:26, Manuel Scheub wrote:
> Am 15.01.2013 13:51, schrieb Jan Engelhardt:
>> On Tuesday 2013-01-15 13:14, Manuel Scheub wrote:
>>> after an upgrade of iptables from version 1.4.3.2 to 1.4.16.3, some=
 rules
>>> doesn't work anymore.
>>> e.g. all rules with protocol UDP an port information:
>>>
>>> #iptables -A INPUT -p udp -i eth0 --dport 67 --sport 68 -j ACCEPT
>>> iptables v1.4.16.3: Port "67" does not resolve to anything.
>> Hrm. I cannot reproduce this so far, but I have a suspicion:
>> Do you have some libc other than glibc, perhaps?
>
> Sorry to be such a noob - what exactly do you mean?

Do you run glibc, eglibc, =C2=B5Clibc, Bionic, or Something Completely =
Different=E2=84=A2?
Please tell us details about the system you have.

> #./configure --with-kernel=3D/opt/linux-2.6.23 --with-xtlibdir=3D/usr=
/lib/iptables
>
> Maybe I need to upgrade my kernel-sources?

The kernel is not required at all.
