From: "Sietse van Zanen" <sietse@wizdom.nu>
Subject: RE: Dynamic DNS
Date: Wed, 9 Mar 2005 09:53:07 +0100
Message-ID: <C530C43619DA8F459D7A1A4DADE00EB1DD16@knowledge.wizdom.nu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
To: netfilter@lists.netfilter.org

Hi,

You are indeed right. Though I have definitely enabled FXP in my ftp
server, I see iptables dropping the active connections the server makes
to the remote server.=20

The FXP client displays:
PORT command ok
Time-out opening connection.

When I do some tcpdumping, I can see the PORT command being sent. The
ftp server tries to open a connection, but packets get dropped because
they're UNRELATED to the ftp connection (probably due to PORT command
containing different IP then client).
Now I have only a couple of people on the ftp server in my DMZ. So I
could very easily configure the server to use a range of say 100 ports
for active ftp connections and open them up to the outside world. It
would however be much neater to have iptables connection tracking allow
the fxp connections.
That's why I just need a yes / no answer on the question. Any
developpers here, that can tell, or should I rather contact RedHat, to
ask how they compiled iptables?

Thanks for the answer so far.

-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Kenneth
Kalmer
Sent: Wednesday, March 09, 2005 9:04 AM
To: Brent Clark
Cc: netfilter@lists.netfilter.org
Subject: Re: Dynamic DNS

On Wed, 09 Mar 2005 08:29:23 +0200, Brent Clark
<bclark@eccotours.dyndns.org> wrote:
> Sebastian Docktor wrote:
> > Hi,
> >
> > I want to allow a Dynamic DNS Client to Access the SSH-Server
> > on my Firewall. But I don't want to open SSH for all IPs,
> > Is it possible that iptables always looks up the ip address from the
> > hostname, so that only the ip has access which is registrated under
> > the dyndns?
> >
> >
>=20
> Hi
>=20
> This may be a ridiculous suggestion.
>=20
> How about basing it on MAC address.
>=20
> Stupid I know.
>=20
> Buts all I could think off.
>=20
> Brent Clark
>=20
>=20

I'm not too sure either, but I do know that iptables resolve the names
the moment the rule is added, not again. Unless you run the rule every
minute to make sure it's updated constantly.

Can't you setup SSHD to only allow connections from certain hosts?
Then again sshd might use the reverse lookup of the ip, which isn't
always the dyndns name...

Will you let us know how you achieve this?


--=20

Kenneth Kalmer
kenneth.kalmer@gmail.com
http://opensourcery.blogspot.com


