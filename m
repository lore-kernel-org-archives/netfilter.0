From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Kernel Module Chaning destination mac address
Date: Tue, 3 Apr 2012 14:23:54 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1204031423330.15235@frira.zrqbmnf.qr>
References: <CA+EzgVRmRwZPy5qBU6OMBW9gTsuAJYE0oU6KTAsLqExu9pCiVw@mail.gmail.com> <CA+EzgVSYf5frmum4o-M1PLqQ480uez3OUGgeis=omPoEujUViQ@mail.gmail.com> <20120402170117.10d359c8@s6510.linuxnetplumber.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20120402170117.10d359c8@s6510.linuxnetplumber.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="utf-8"
To: Stephen Hemminger <shemminger@vyatta.com>
Cc: DIGVIJAY SINGH <digvijay09020@iiitd.ac.in>, netfilter@vger.kernel.org

On Tuesday 2012-04-03 02:01, Stephen Hemminger wrote:

>> I am working on a project to create a kernel module which directs al=
l
>> outgoing traffic from my machine to different computer in my LAN. So=
 I
>> am starting with just trying to send the traffic to just one compute=
r.
>> I am using the=C2=A0NF_BR_LOCAL_OUT hook. Along with the=C2=A0NFPROT=
O_IPV4
>> family. But every time i run the module, my machine hangs. And I nee=
d
>> to reboot. =C2=A0Please see what is the problem.
>
>tc action redirect already does this

As does xt_TEE which, at the same time, is likely to be easier to=20
handle.
