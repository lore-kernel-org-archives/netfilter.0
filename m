From: "Gary W. Smith" <gary@primeexalia.com>
Subject: RE: [pptp-devel] iptables and pptp [slight OT]
Date: Sat, 27 Nov 2004 10:09:58 -0800
Message-ID: <27594E8BA9D5CA458F5EF87D88B6B48F0197FF@pxtvjoexd01.pxt.primeexalia.com>
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
To: "Gary W. Smith" <gary@primeexalia.com>
Cc: pptpclient-devel@lists.sourceforge.net, poptop-server@lists.sourceforge.net, netfilter@lists.netfilter.org

Please note this is a cross post...  It seems to have impact to all
three lists.

=20

I have found the source of my problem and hope that others will not have
it.  Here is the scenario:

=20

At two locations I have two firewall boxes running POPTOP and
PPTP-CLIENT.  They work great when any XP box connects to them.  When
server "A" tries to connect to server "B" it will do so fine for the
first connection.  Subsequent connections fail until I restart POPTOP on
the server.

=20

I have found that it is related to the ip_nat_pptp module being loaded.
In our case we do not NAT the PPTP server but for some reason we loaded
the module anyways on the client.  I assume the module works fine for
NAT's PPTP servers but we don't use the functionality.  If you do load
the module on the firewall you can accept PPTP connections just fine but
you cannot make reliable outgoing FTP connections from the firewall.
Client behind the firewall have no problem. =20

=20

I'm not sure if this is designed functionality, limitation or a bug.

=20

Anyways, unloading this module from the server initiating the PPTP
connection has fixed my dreaded problem.

=20

=20

Gary Smith

