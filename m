From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: portfw on iptables 2.4 kernel problem. (oops!)
Date: Wed, 11 Dec 2002 03:18:46 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200212110318.46343.netfilter@newkirk.us>
References: <96C102324EF9D411A49500306E06C8D1021AE36D@eketsv02.cubis.de> <200212110305.48030.netfilter@newkirk.us>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200212110305.48030.netfilter@newkirk.us>
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
To: "Reckhard, Tobias" <tobias.reckhard@secunet.com>, netfilter@lists.netfilter.org

On Wednesday 11 December 2002 03:05 am, Joel Newkirk wrote:

> This wouldn't work at all.  INPUT shouldn't enter into it at all,
> unless the DNAT fails, and OUTPUT only if a packet is required to
> leave the firewall machine itself, IE if that is where the connection
> is attempted from or to.  Also, for the FTP conntrack helper to work
> you HAVE to allow state RELATED.  FTP will open a control connection
> to port 21, then a request for data will (in passive) cause the server
> to attempt to open a connection BACK to the client's port 20, IE.=20
> This is RELATED, in a nutshell.  The FTP helper is required because
> the control packets will embed IP and port data inside the packet
> itself, rather than its header, and without the helper netfilter will
> only handle the header.

Sorry, I got this slightly wrong.  The server will open a connection back=
=20
to the client FROM its own port 20, to a port specified in the request=20
from the client.

j




