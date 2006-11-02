From: Alan Ezust <alan.ezust@presinet.com>
Subject: Re: conntrack -E -i not allowed?
Date: Thu, 2 Nov 2006 11:11:15 -0800
Message-ID: <200611021111.19134.alan.ezust@presinet.com>
References: <200611011043.53370.alan.ezust@presinet.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1195756.3RfXBVVd7Y";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200611011043.53370.alan.ezust@presinet.com>
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
To: netfilter@lists.netfilter.org

--nextPart1195756.3RfXBVVd7Y
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline


Conntrack uses the following structures, but there is no documentation abou=
t=20
what these structures are for, or where they are used:

// nf_conntrack.h (kernel headers)
struct nf_conn - for the *data member, what kind of structures get stored=20
there?

nf_conntrack_tuple, nf_conntrack_expect

// nf_conntrack_tuple.h
nf_conntrack_tuple_hash - a linked list of tuples? Where is the code that=20
inserts/removes elements from this hash?

nf_conntrack_tuple - this contains the information to distingusih a=20
connection - is this the main structure? What is its relationship to the=20
nfct_tuple?

// libnetfilter_conntrack.h:31
nfct_handle - /* Harald says: "better for encapsulation" ;) */
This comment is not helpful, just annoying. I'd like to see a proper=20
description of this structure and a short line or two summarizing where/why=
=20
it is used. is this for a single connection, or the conntrack system?

nfct_conntrack - seems to be the main structure used by   =20
    libnfnetlink The array of tuples is used to store table=20
    data (?)

Other types i'd like to see proper API docs for:
    nfct_tuple
    nfct_callback=20

Anyway, the reason I am delving into this code now is that I am trying patc=
h=20
conntrack so that when you do conntrack -E -i, it gives you the ctid in the=
=20
output lines.

I ran conntrack in a debugger and it keeps bringing me into the=20
nfnl_parse_attr method via libnetfilter_conntrack.c line 526.

Debugging it, and inspecting the "nfa" structure,
It seems to be an array of struct nfattr objects.=20
These nfattr structs have 2 fields, a length and a type.
It describes, I assume, which fields need to be extracted from the tuplehas=
h.

This nfa structure is extracted from the struct nlmsghdr which was passed t=
o=20
nfct_conntrack_netlink_handler. So this struct doesn't contain the right=20
information in it to tell parse_attr to to put a ctid record into its tb.

All this is called indirectly from nfnl_listen, which gets the nlmsghdr fro=
m=20
callback_handler, which gets it from nfct_conntrack_netlink_handler. But my=
=20
debugger isn't showing me where that function was called from (perhaps=20
because it's coming from the kernel?)

So I think my question is, where is that struct nlmsghdr created that is be=
ing=20
passed to the nfct_conntrack_netlink_handler, and where would be the right=
=20
place to add an element to it so that there is a ctid. If that was done,=20
would that be sufficient to get the ctid into the logline, or is there more=
=20
to it than that?

Gads, tracing through this code gives me a headache.

On Wednesday 01 November 2006 10:43, Alan Ezust wrote:
> I'm trying to get conntrack -E to show me events, with conntrack IDs.
> At the moment, the ctid is not showing up in the output.
>
> $ conntrack -E -i
> conntrack v1.00beta2: Illegal option `-i' with this command
>
>
>    [NEW] udp      17 30 src=3D10.10.100.100 dst=3D204.174.64.1 sport=3D45=
36
> dport=3D53 packets=3D1 bytes=3D67 [UNREPLIED] src=3D204.174.64.1 dst=3D10=
=2E10.100.100
> sport=3D53 dport=3D4536 packets=3D0 bytes=3D0
>
> Is there a trick to getting the ctids to be sent to the output of this?
>
> conntrack -L -i seems to work, showing me the id. Personally, I think
> conntrack should always output the id.

=2D-=20
Alan Ezust            www.presinet.com
Presinet, inc         alan.ezust@presinet.com
           Victoria, BC,Canada

--nextPart1195756.3RfXBVVd7Y
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.3 (GNU/Linux)

iD8DBQBFSkLXsJbtw6GURksRAogdAJwNDJg4ReAPIYkpZRK9Dae242CNtgCeLrpS
R5qjteX7yl/LHXiOb1Nxbz4=
=nuT/
-----END PGP SIGNATURE-----

--nextPart1195756.3RfXBVVd7Y--

