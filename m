From: Manuel Scheub <manuel.scheub@kraftcom.de>
Subject: Re: iptables deactivate "getportbyname"
Date: Tue, 15 Jan 2013 16:57:13 +0100
Message-ID: <50F57C59.9050607@kraftcom.de>
References: <50F5483C.9050807@kraftcom.de> <alpine.LNX.2.01.1301151350060.19279@nerf07.vanv.qr> <50F56710.30600@kraftcom.de> <alpine.LNX.2.01.1301151534340.20597@nerf07.vanv.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.01.1301151534340.20597@nerf07.vanv.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Jan Engelhardt <jengelh@inai.de>
Cc: netfilter@vger.kernel.org

Am 15.01.2013 15:35, schrieb Jan Engelhardt:
> On Tuesday 2013-01-15 15:26, Manuel Scheub wrote:
>> Am 15.01.2013 13:51, schrieb Jan Engelhardt:
>>> On Tuesday 2013-01-15 13:14, Manuel Scheub wrote:
>>>> after an upgrade of iptables from version 1.4.3.2 to 1.4.16.3, som=
e rules
>>>> doesn't work anymore.
>>>> e.g. all rules with protocol UDP an port information:
>>>>
>>>> #iptables -A INPUT -p udp -i eth0 --dport 67 --sport 68 -j ACCEPT
>>>> iptables v1.4.16.3: Port "67" does not resolve to anything.
>>> Hrm. I cannot reproduce this so far, but I have a suspicion:
>>> Do you have some libc other than glibc, perhaps?
>> Sorry to be such a noob - what exactly do you mean?
> Do you run glibc, eglibc, =C2=B5Clibc, Bionic, or Something Completel=
y Different=E2=84=A2?
> Please tell us details about the system you have.
>
>> #./configure --with-kernel=3D/opt/linux-2.6.23 --with-xtlibdir=3D/us=
r/lib/iptables
>>
>> Maybe I need to upgrade my kernel-sources?
> The kernel is not required at all.

I have a production system which is really, really old for generating=20
firmware for embedded devices, and I run glibc:

# /lib/libc.so.6
GNU C Library stable release version 2.3.2

so, anyway - I thought there is a simple solution, but now I think it's=
=20
time to upgrade my whole development system!
However, thank you very much!




