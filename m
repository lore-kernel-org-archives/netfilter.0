From: <bmcdowell@coxhealthplans.com>
Subject: RE: Anybody heard about UP&P ?
Date: Mon, 23 Feb 2004 09:48:56 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7A3B4AA360FDEF448F3390421FC8D73101668CA7@coxhpexg.coxhp.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Class: urn:content-classes:message
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


When I wanted to get this particular feature working to chat with my =
Dad, I wrote a quickie script to -j ACCEPT his IP.  Then I use another =
one to reset my rules when we're done chatting.  Worked fine after that, =
NAT and all.

IIRC, UPnP was the reason for that first 'big' XP patch right after it =
came out.  So, yes, it is probably a vulnerability.


Bob

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Chris Brenton
Sent: Sunday, February 22, 2004 6:33 AM
To: netfilter@lists.netfilter.org
Subject: RE: Anybody heard about UP&P ?


This sounds *really* fishy to me. Sounds to me like what they are
looking to do is setup a 1 to 1 NAT mapping (or possibly port
forwarding) to the host needing "remote assistance" and probably punch
open the filtering as well.=20

Do you know how how much access gets opened up? Any authentication or
encryption being used during the management session? Any guarantee that
the hole gets closed up when they are done? Any logging of the access as
well as what gets changed during the session?

You could always ask what level of access is required and just manually
create the rules yourself. At least that way you know what is going on.

I think I'm real glad Netfilter does not support this. Sounds like a
compromise waiting to happen.

C


On Fri, 2004-02-20 at 14:35, Carl Farrington wrote:
> UPNP means Universal Plug'n'Play. I guess WinXP looks to automagically =
reconfigure the NAT rules via upnp.
>=20
> No idea about the netfilter stuff myself I'm afraid.
>=20
> > -----Original Message-----
> > From: Marc Recht=E9 [mailto:mrechte@randodetente.org]
> > Sent: 20 February 2004 07:14
> > To: netfilter@lists.netfilter.org
> > Subject: Anybody heard about UP&P ?
> >=20
> > To enable remote assistance from Internet of a WinXP PC on a LAN =
using
> > NAT one must have a UP&P NAT compatible router.
> >=20
> > Can Netfilter act as such a router, and if so do you have an idea of =
the
> > chain to apply ?
> >=20
> > Thanks for your help
> >=20
> > Marc.
> >=20
>=20
>=20


