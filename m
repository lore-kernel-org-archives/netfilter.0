From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Port forwarding.
Date: Mon, 28 Jun 2004 13:52:20 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406281352.20521.Antony@Soft-Solutions.co.uk>
References: <001301c45cf0$9f7cf710$6600a8c0@simba> <200406281134.37964.Antony@Soft-Solutions.co.uk> <001b01c45d0a$5529b7b0$6600a8c0@simba>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001b01c45d0a$5529b7b0$6600a8c0@simba>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

On Monday 28 June 2004 1:20 pm, Gunnar Fr=F6din wrote:

> Chain FORWARD (policy DROP 0 packets, 0 bytes)
>     pkts      bytes target     prot opt in     out     source
> destination
>        6      360 ACCEPT     tcp  --  eth0   eth1    0.0.0.0/0
> 192.168.0.100      tcp dpt:25 state NEW,RELATED,ESTABLISHED

Okay, so we *are* seeing packets to the mail server being forwarded throu=
gh=20
the firewall.

>        0        0 ACCEPT     tcp  --  eth1   eth0    192.168.0.100
> 0.0.0.0/0          tcp spt:25 state NEW,RELATED,ESTABLISHED

But we are not seeing any replies coming back.

> Chain PREROUTING (policy ACCEPT 20 packets, 2796 bytes)
>     pkts      bytes target     prot opt in     out     source
> destination
>        1       60 DNAT       tcp  --  *      *       0.0.0.0/0
> 10.20.30.40        tcp dpt:25 to:192.168.0.100:25

And, indeed, the DNAT is working (not surprising, since we saw forwarded=20
packets).

> I tryed to telnet in, witch times-out after 6 attempts

The 6 packets we can see in the FORWARD rule above :)

Okay, three more questions:

1. Is a mail server running on 192.168.0.100 (!) ?   Can you telnet to it=
 on=20
the real 192.168.0.100 address from a local client?

2. Are there any access controls on the mail server, restricting the IPs =
from=20
which it will accept connections?

3. Does the default route of the mail server point back to the firewall?

Regards,

Antony

--=20
Software development can be quick, high quality, or low cost.

The customer gets to pick any two out of three.

                                                     Please reply to the =
list;
                                                           please don't C=
C me.


