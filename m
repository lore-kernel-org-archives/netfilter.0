From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Allow active and passive FTP connections
Date: Thu, 17 Jun 2004 16:27:02 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406171627.02092.Antony@Soft-Solutions.co.uk>
References: <20040617151309.68677.qmail@web14710.mail.yahoo.com>
Reply-To: netfilter <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040617151309.68677.qmail@web14710.mail.yahoo.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="windows-1252"
To: netfilter <netfilter@lists.netfilter.org>

On Thursday 17 June 2004 4:13 pm, Sagara Wijetunga wrote:

> Thanks very much for everybody's comments on this.
>
> In my Linux kernel, the =93FTP protocol support=94 under
> =93IP: Netfilter Configuration=94 is build into the
> kernel. Therefore, there is no ip_conntrack_ftp module
> to load.
>
> I use Linux kernel 2.6.5, I don't use NAT and I use
> iptables v1.2.10.
>
>
> Is it necessary to build ip_conntrack_ftp as a module?

Certainly not.   I always build firewall kernels as monolithic (everythin=
g I=20
need compiled-in, no module support, so nothing can be loaded or unloaded=
=20
afterwards).

There must be some reason why the conntrack table isn't recognising the=20
reverse connection (I assume you *do* have connection tracking support=20
compiled in as well?   I can't recall if you have to have this before you=
=20
even see the FTP question when building the kernel...)

What do you see in /proc/net/ip_conntrack when the connection is half-ope=
n=20
(ie: about the same time as the log entry you posted appears)?

This seems strange.

Regards,

Antony.

--=20
There are only 10 types of people in the world:
those who understand binary notation,
and those who don't.

                                                     Please reply to the =
list;
                                                           please don't C=
C me.


