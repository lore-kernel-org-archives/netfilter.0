From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: [Fwd: Re: [netfilter-core] iptables/conntrack in enterpriseenvironment.]
Date: Wed, 11 Jun 2003 08:33:25 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A019273@wardrive.citadelcomputer.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: "Preston A. Elder" <prez@srealm.net.au>, netfilter@lists.netfilter.org

"the system seems to stop functioning".. he he I wonder why! ;)

Wasn't there a P-o-M for REJECT for IPv6 or something?

Also, without the rule in place... does it still hang? I'd put the code =
back to original...

Thanks,
____________________________________________
George Vieira
Systems Manager
georgev@citadelcomputer.com.au

Citadel Computer Systems Pty Ltd
http://www.citadelcomputer.com.au

Phone   : +61 2 9955 2644
HelpDesk: +61 2 9955 2698
=20

-----Original Message-----
From: Preston A. Elder [mailto:prez@srealm.net.au]
Sent: Thursday, June 05, 2003 6:19 AM
To: netfilter@lists.netfilter.org; netfilter-devel@lists.netfilter.org;
coreteam@netfilter.org
Subject: [Fwd: Re: [netfilter-core] iptables/conntrack in
enterpriseenvironment.]


Hi,

While waiting for a response to the email I sent below, I went ahead and
investigated the 3rd 'question' I raised in that email.

I essentially removed the checking of ip_nat_used_tuple for DNAT (which
appplies to REDIRECT entries too) entries.

I changed this code in get_unique_tuple (ip_nat_core.c) from this:
                if ((!(rptr->flags & IP_NAT_RANGE_PROTO_SPECIFIED)
                     || proto->in_range(tuple, HOOK2MANIP(hooknum),
                                        &rptr->min, &rptr->max))
                    && !ip_nat_used_tuple(tuple, conntrack)) {
                        ret =3D 1;
                        goto clear_fulls;
                } else {

to this:
                if ((!(rptr->flags & IP_NAT_RANGE_PROTO_SPECIFIED)
                     || proto->in_range(tuple, HOOK2MANIP(hooknum),
                                        &rptr->min, &rptr->max))
                    && (HOOK2MANIP(hooknum) =3D=3D IP_NAT_MANIP_DST ? 1 =
:
!ip_nat_used_tuple(tuple, conntrack))) {
                        ret =3D 1;
                        goto clear_fulls;
                } else {

I commented out the ASSERT's just after the proto->unique_tuple calls in
get_unique_tuple (ip_nat_core.c) aswell, the lines that look like this:
                                        IP_NF_ASSERT(!ip_nat_used_tuple
                                                     (tuple,
conntrack));


And changed this code in tcp_unique_tuple (ip_nat_proto_tcp.c) from
this:
        for (i =3D 0; i < range_size; i++, port++) {
                *portptr =3D htons(min + port % range_size);
                if (!ip_nat_used_tuple(tuple, conntrack)) {
                        return 1;
                }
        }

to this:
        if (maniptype =3D=3D IP_NAT_MANIP_DST)
        {
                *portptr =3D htons(min + net_random() % range_size);
                return 1;
        }
        else
        {
                start =3D net_random() % range_size;
                port +=3D start;
                                                                         =
          =20
                for (i =3D start; i < range_size; i++, port++) {
                        *portptr =3D htons(min + port % range_size);
                        if (!ip_nat_used_tuple(tuple, conntrack)) {
                                return 1;
                        }
                }
                if (i =3D=3D range_size)
                {
                        port -=3D range_size;
                        for (i =3D 0; i < start; i++, port++) {
                                *portptr =3D htons(min + port %
range_size);
                                if (!ip_nat_used_tuple(tuple,
conntrack)) {
                                        return 1;
                                }
                        }
                }
        }

I only have one rule in the entire NAT table, the one that forwards all
new connections to ports for machines behind it to a specific port range
on the local machine (which is in the PREROUTING 'chain').

This change DOES seem to have the desired effect, of making connections
fully establish pretty much immediately, and as suspected, since the
socket on the local machine is just a listening socket, it really does
not care about multiple connections, and thus does not need the 'in use'
checking above.  However, after putting this in place, the system seems
to stop functioning (I'm not sure if its just the network, or the system
itself, since I'm not at the console, however I suspect its the system
itself, as its a very sudden freeze).

Could someone shed some light into why the system would freeze after a
short period of time (less than 5 minutes) with this code running (note:
it only freezes when our application is running, ie. there is something
there to accept connections).  And also possibly shed some light on
possible side-effects the above modifications could have (apart from
freezing the system)?  I don't usually screw around with the kernel
(though I have before), so this is relatively new territory for me.

Any and all help, comments, etc. appreciated.

Thanks,

PreZ :)

