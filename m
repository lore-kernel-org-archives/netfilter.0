From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: portfw on iptables 2.4 kernel problem.
Date: Wed, 11 Dec 2002 03:05:48 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200212110305.48030.netfilter@newkirk.us>
References: <96C102324EF9D411A49500306E06C8D1021AE36D@eketsv02.cubis.de>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <96C102324EF9D411A49500306E06C8D1021AE36D@eketsv02.cubis.de>
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

On Wednesday 11 December 2002 02:32 am, Reckhard, Tobias wrote:=20
{heavily snipped by Joel}

> I expect you're trying to access the FTP server on 10.0.0.11 from the
> Internet by redirecting connections to the firewall's external IP
> address (203.100.100.1) to the FTP server.

> Take care of the FTP control connection:
> 2. Permit INPUT on the outside interface of the firewall to TCP port
> 21 with states NEW and ESTABLISHED
> 3. Permit OUTPUT on the outside interface of the firewall from TCP
> port 21 with state ESTABLISHED
> 4. In the PREROUTING chain use DNAT to redirect packets "-p tcp -d
> 203.100.100.1 --dport 21" (see point 2 above) to the internal server
> at 10.0.0.11.
> 5. Permit FORWARDing of those same packets with states NEW and
> ESTABLISHED. 6. Permit FORWARDing of response packets ("-s 10.0.0.11
> --sport 21") with state ESTABLISHED.

This wouldn't work at all.  INPUT shouldn't enter into it at all, unless=20
the DNAT fails, and OUTPUT only if a packet is required to leave the=20
firewall machine itself, IE if that is where the connection is attempted=20
from or to.  Also, for the FTP conntrack helper to work you HAVE to=20
allow state RELATED.  FTP will open a control connection to port 21,=20
then a request for data will (in passive) cause the server to attempt to=20
open a connection BACK to the client's port 20, IE.  This is RELATED, in=20
a nutshell.  The FTP helper is required because the control packets will=20
embed IP and port data inside the packet itself, rather than its header,=20
and without the helper netfilter will only handle the header.

j


