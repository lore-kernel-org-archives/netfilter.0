From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Connections with SYN aren't NEW
Date: Sun, 14 Dec 2003 16:34:54 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200312141634.54552.Antony@Soft-Solutions.co.uk>
References: <20031214162315.GA897@via.ecp.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031214162315.GA897@via.ecp.fr>
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
To: Netfilter <netfilter@lists.netfilter.org>

On Sunday 14 December 2003 4:23 pm, Lo=EFc Minier wrote:

>  I face a problem with some TCP connections: I want to accept new
>  TCP connections only if they match both --syn and -m state --state
>  NEW. This turns out to be a bad practice in some case where I see
>  legitimate new TCP connections with correct flags matching --syn but
>  which do not match -m state --state NEW.
>
>    This happens a lot with HTTP clients and with DNS requests, and I
>  think this is because of port reuse:
>    - the HTTP client opens a connection from port xyz to port 80
>    - it finishes the session and closes the connection
>    - it reopens another connection with the same port xyz to the same
>      host on port 80
>
>  Am I wrong in thinking the connections should match -m state --state
>  NEW, even if a connection happened with the same ports/ips a few
>  seconds ago? What can I change to fulfill my wishes?

It depends what happens at the second stage in your description above "it=20
finishes the session and closes the connection".

Basically, netfilter will match NEW if there isn't an entry in the=20
conntracking table for the packet (ie: it's not ESTABLISHED, nor RELATED).

An entry will only get removed from the conntrack table after being=20
ESTABLISHED if netfilter:

 - sees the FIN packet/s, or
 - sees a RST packet, or
 - times out (after 5 days....)

So, if your HTTP client is just dropping a connection without closing it=20
nicely (using FIN, or even RST) then netfilter will think it is still=20
ESTABLISHED.

I don't know if this explains the problem you are seeing, but it's a reason=
=20
why netfilter may think the connection is in a different state than the=20
client does.

Antony.

--=20
In science, one tries to tell people
in such a way as to be understood by everyone
something that no-one ever knew before.

In poetry, it is the exact opposite.

 - Paul Dirac

                                                     Please reply to the li=
st;
                                                           please don't CC =
me.


