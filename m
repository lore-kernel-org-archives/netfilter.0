From: Stephen Hemminger <shemminger@vyatta.com>
Subject: Re: Kernel Module Chaning destination mac address
Date: Mon, 2 Apr 2012 17:01:17 -0700
Message-ID: <20120402170117.10d359c8@s6510.linuxnetplumber.net>
References: <CA+EzgVRmRwZPy5qBU6OMBW9gTsuAJYE0oU6KTAsLqExu9pCiVw@mail.gmail.com>
	<CA+EzgVSYf5frmum4o-M1PLqQ480uez3OUGgeis=omPoEujUViQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CA+EzgVSYf5frmum4o-M1PLqQ480uez3OUGgeis=omPoEujUViQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: DIGVIJAY SINGH <digvijay09020@iiitd.ac.in>
Cc: netfilter@vger.kernel.org

On Sat, 31 Mar 2012 17:52:02 +0530
DIGVIJAY SINGH <digvijay09020@iiitd.ac.in> wrote:

> Hello there!
> I am working on a project to create a kernel module which directs all
> outgoing traffic from my machine to different computer in my LAN. So =
I
> am starting with just trying to send the traffic to just one computer=
=2E
> I am using the=C2=A0NF_BR_LOCAL_OUT hook. Along with the=C2=A0NFPROTO=
_IPV4
> family. But every time i run the module, my machine hangs. And I need
> to reboot. =C2=A0Please see what is the problem.
>=20


tc action redirect already does this
