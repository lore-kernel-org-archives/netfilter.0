From: "Hudson Delbert J Contr 61 CS/SCBN" <Delbert.Hudson@LOSANGELES.AF.MIL>
Subject: RE: ever block *outgoing* packets on your firewall?
Date: Tue, 8 Feb 2005 07:37:04 -0800
Message-ID: <186AC876521E0F46BDE77079A6567FD0F0DDA9@la-ncc-ms1nsabb.losangeles.afspc.ds.af.mil>
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
To: Netfilter Mailing List <netfilter@lists.netfilter.org>

drops are kool. this the way i want to treat an intruder.
i dont want a bunch of bells and whistles going off.
i want whatever queries be attempted to be logged, if interesting,
and therewith sent to /dev/null with a resounding thud then....

...silence....

frustration is the number one method of turning an intruder away.

he will simply get bored if the box getting pounded on doesnt =
over-react.

try it.

-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org]On Behalf Of Nick Drage
Sent: Monday, February 07, 2005 5:08 PM
To: Netfilter Mailing List
Subject: Re: ever block *outgoing* packets on your firewall?


On Mon, Feb 07, 2005 at 10:28:46AM -0800, seberino@spawar.navy.mil =
wrote:

> > > i run a default DROP policy on the OUTPUT chain of my firewalls
> > > and only allow out necessary traffic (DNS, HTTP/FTP to update
> > > servers, NTP, etc).  but i'm pretty odd when it comes to these
> > > things--i don't know how necessary it is.  the one nice
> > > side-effect is that is keeps me from doing something stupid when
> > > i'm ssh-ed into a firewall.
> >
> > Out of interest why "DROP" rather than "REJECT"?  With reject users,
> > hosts or programs on the inside tend to fail straight away rather
> > than taking a while to time out annoyingly.
>
> please remind me of difference between REJECT and DROP.
>=20
> Perhaps I should use REJECT then!

From the "man iptables" pages ;)

DROP means to drop the packet on the floor.

REJECT
This is used to send back an error packet in response to the matched
packet.

Really that's it, a DROP rule with just eat the packet and not do
anything else or tell anyone or anything, hence the remote end of the
connection will presume the packet or its reply got lost along the way
and try again.  A REJECT rule will send something back saying "I don't
talk that protocol".

--=20
Where are we going and what's with the hand basket?


