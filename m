From: "Derick Anderson" <danderson@vikus.com>
Subject: RE: Weird HTTP connection issue
Date: Tue, 15 Nov 2005 14:35:56 -0500
Message-ID: <FAC4E024BF776842876169173CE2F01309A663@mailbox.vikus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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
Content-Type: text/plain; charset="us-ascii"
To: Linux at Michael Kollmitzer <linux.kollmitzer@inode.at>, netfilter@lists.netfilter.org

=20

> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org=20
> [mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of=20
> Linux at Michael Kollmitzer
> Sent: Tuesday, November 15, 2005 2:39 PM
> To: netfilter@lists.netfilter.org
> Subject: Re: Weird HTTP connection issue
>=20
> On Mon, 2005-11-14 at 13:21 -0500, Derick Anderson wrote:
> > I've got a weird HTTP connection issue with a particular=20
> site and I'm=20
> > wondering if anyone here can lend some help. It appears to be a=20
> > fragmentation issue, and I suspected our firewall (which I did not=20
> > write, and am in the process of completely re-doing), since=20
> the site=20
> > loads much faster from my home connection (Charter cable). However,=20
> > our test machine at work (completely outside the firewall, stock=20
> > Linksys WRT54G for a router) has the same issue.
> > =20
> > A summary of what happens is this:
> > =20
> > 1. Client (me) requests the index page from Server 1.
> > 2. Server 1 (not related to Servers 2 and 3) acknowledges=20
> the request=20
> > and sends a frameset containing a single HTML frame, the source of=20
> > which is Server 2.
> > 3. Client acknowledges the transfer.
> > 4. Server 1 closes the connection.
> > 5. Client requests frame source from Server 2 (one of the problem=20
> > servers).
> > 6. Server 2 acknowledges the request but sends no data. All of this=20
> > happens within half a second.
> > 7. 75 seconds later, Server 2 and Server 3 (the other=20
> problem server)=20
> > start sending data for 4 more seconds - Client acknowledges=20
> all data.
> > 8. Data transfer is interrupted again for about 16 seconds, after=20
> > which one of data connections is closed.
> > 9. 31 seconds later Server 2 resets the connection that was=20
> closed in=20
> > #8.
> > 10. 24 seconds later Client resets a connection from Server=20
> 3, which=20
> > was never closed properly. Client waited 75 seconds before=20
> resetting=20
> > the hung connection.
> > 11. 20 seconds later Client resets a connection from Server=20
> 2. Client=20
> > waited 75 seconds for data which it finally received from Server 2,=20
> > and another 15 seconds before Server 2 closed the connection.
> >=20
> > I've Googled the 75 second delay and it seems that TCP times out 75=20
> > seconds after a SYN if no response is received.
> >=20
> > I've attached a summary of an Ethereal capture of the whole bit. If=20
> > needed I'll post the iptables-save of the firewall script=20
> (which the=20
> > list told me was too big to include with the rest of this).
> >=20
> > Thanks in advance for any help,
> >=20
> > Derick Anderson
>=20
>=20
> i had a similar problem like you described once. it didn't=20
> have anything to do with the firewall at all. i've just set=20
> mtu/mru to 1492 on one of our routers and everything seemed=20
> to work fine. we just were not able to connect to one server=20
> anymore (we had changed so many things in the network then=20
> that we couldn't figure out where the problem came from.
> the firewall logs showed nothing at all). it turned out to be=20
> something like this:
>=20
> client sends syn to server
> server sends ack syn back
> client sends ack
> and then, no data packets come in and just because these=20
> packets had 1500 bytes size and the router in between refused=20
> these packets.
>=20
> i hope that helps. good luck :)
>=20
> Michael

Thanks Michael, this is very helpful! I'll have a chat with our ISP -
they maintain the gateway box.

Derick Anderson

