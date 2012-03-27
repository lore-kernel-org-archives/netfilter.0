From: Nils Rennebarth <nils.rennebarth@funkwerk-ec.com>
Subject: Re: REJECT target faster for remote than for local packets?
Date: Tue, 27 Mar 2012 19:45:15 +0200
Message-ID: <4F71FCAB.9090208@funkwerk-ec.com>
References: <4F71C5E6.8040001@funkwerk-ec.com> <CACuyg24vONpi0OSGMsc7MyiZJ_R+fr28KhkYrpBF1fmNKz=XoQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CACuyg24vONpi0OSGMsc7MyiZJ_R+fr28KhkYrpBF1fmNKz=XoQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?windows-1252?Q?Humberto_Juc=E1?= <betolj@gmail.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On 27.03.2012 19:21, Humberto Juc=E1 wrote:
> Hi,
>=20
>>  iptables -I OUTPUT --protocol tcp --dport 80 -j REJECT
> For TCP connections, try to do with "-j REJECT --reject-with tcp-rese=
t".
> Its faster then port unreachable!
Makes no difference here. Takes 3 seconds, exactly the time to the next
SYN packet.

Oh well, that is true for the 2.6.32 kernel. But for the 3.2.0 kernel,
it really does make a difference:

with --reject-with icmp-port-unreachable it takes only 1 second
and with --reject-with tcp-reset the reaction is instantaneous
(i.e. 32ms)

What exactly did change in the kernel and when?

--=20

Mit freundlichen Gr=FC=DFen / with kind regards

Nils Rennebarth, Software Developer

