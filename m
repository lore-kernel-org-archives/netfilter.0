From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Destination NAT
Date: Thu, 29 Jan 2004 09:13:53 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401290913.54045.Antony@Soft-Solutions.co.uk>
References: <147E1D375819F44680C3E5BFB6424C52DFC450@bcexc01.bue299.comafi.com.ar>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <147E1D375819F44680C3E5BFB6424C52DFC450@bcexc01.bue299.comafi.com.ar>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

On Wednesday 28 January 2004 2:21 pm, Alejandro Zaidel wrote:

> Can I address a packet to more than one IP address at the same time ??
>
> I have   iptables -t nat -A PREROUTING -i eth1 -j DNAT --to
> 5.6.7.8-5.6.7.10  as an example, but I want to send the packets to both=
 7.8
> and also 7.10
>
> Is it possible to do ???

No.   You cannot use netfilter to create duplicates of packets.   Netfilt=
er=20
will perform various operations on the packets which exit, but it won't m=
ake=20
multiple versions of what was originally one packet.

Regards,

Antony.

--=20
There are two possible outcomes:

 If the result confirms the hypothesis, then you've made a measurement.
 If the result is contrary to the hypothesis, then you've made a discover=
y.

 - Enrico Fermi

                                                     Please reply to the =
list;
                                                           please don't C=
C me.


