From: =?ISO-8859-2?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: Re: Policy targets...
Date: Tue, 15 May 2007 11:03:19 +0200
Message-ID: <46497757.7090100@freemail.hu>
References: <464441F7.3050808@freemail.hu>
	<464443AE.5020904@gmail.com>	<464446C5.8090301@freemail.hu>
	<46444B26.6010206@gmail.com> <46444D78.7040809@freemail.hu>
	<46488357.90209@vlsmaps.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <46488357.90209@vlsmaps.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: jwlargent <jwlargent@vlsmaps.com>
Cc: Netfilter IPtableMailinglist <netfilter@lists.netfilter.org>

jwlargent =EDrta:

=2E..
>> fw1:~# iptables -t nat -P PREROUTING RETURN
>> iptables: Bad policy name
>>
>> So you won !
>> Maybe someone should fix the manual....
>>    =20
>
> Maybe you should just read the manual, RETURN is not a policy for the
> nat table.
>  =20
Believe me... I read many times... :D
> - From the man page:
>
>  nat:
>                   This table is consulted when a packet  that
> creates  a  new
>                   connection  is encountered.  It consists of three
> built-ins:
>                   PREROUTING (for altering packets as soon as they
> come  in),
>                   OUTPUT  (for altering locally-generated packets
> before rout-
>                   ing), and POSTROUTING (for  altering  packets  as
> they  are
>                   about to go out).
>
>  =20
Yeah... That is right.... But wait a minute... I am talking about=20
DEFAULT POLICY and you are talking about BUILT-IN CHAINS !!!

iptables -t nat -A PREROUTING -j RETURN !=3D iptables -t nat -P PREROUTIN=
G=20
RETURN

The first works, the second not...

I think that it is a bit confusing to use ACCEPT as a policy tartget and =

a rule target.
(In nat/mangle/raw ACCEPT means CONTINUE. In filter it means OK, LET IT=20
THORUGH.)
 That is why I tried to use RETURN in the policy.

 From the man page:

       -P, --policy chain target
              Set the policy for the chain to the given target.  See the =

section TARGETS for the legal targets.  Only built-in (non-user-defined) =

chains can
              have policies, and neither built-in nor user-defined=20
chains can be policy targets.


TARGETS
       A  firewall rule specifies criteria for a packet, and a target. =20
If the packet does not match, the next rule in the chain is the=20
examined; if it does
       match, then the next rule is specified by the value of the=20
target, which can be the name of a user-defined chain or one of the=20
special values ACCEPT,
       DROP, QUEUE, or RETURN.

       ACCEPT  means  to let the packet through.  DROP means to drop the =

packet on the floor.  QUEUE means to pass the packet to userspace.  (How =

the packet
       can be received by a userspace process differs by the particular=20
queue handler.  2.4.x and 2.6.x kernels up to 2.6.13 include the=20
ip_queue queue han-
       dler.   Kernels 2.6.14 and later additionally include the=20
nfnetlink_queue queue handler.  Packets with a target of QUEUE will be=20
sent to queue number
       '0' in this case. Please also see the NFQUEUE target as described =

later in this man page.)  RETURN means stop traversing this chain and=20
resume at the
       next  rule  in  the previous (calling) chain.  If the end of a=20
built-in chain is reached or a rule in a built-in chain with target=20
RETURN is matched,
       the target specified by the chain policy determines the fate of=20
the packet.

> - --
> Jeff Largent
> System Administrator
> Visual Lease Services Inc.
> http://www.vlsmaps.com
> (405) 379-5280
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.7 (GNU/Linux)
> Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org
>
> iD8DBQFGSINWd02kARNrtZkRAsmPAJ4uJRdRreTDnz4Dy1XWYhCyuwFwhQCcCR7N
> oAjjEJXXbHXfW3Xi0AvlFl4=3D
> =3DjVxY
> -----END PGP SIGNATURE-----
>
>  =20


