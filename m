From: "Jonathan Villa" <jonathan@innovativesource.net>
Subject: Re: Forward to DMZ addresses
Date: Thu, 18 Aug 2005 16:00:05 -0500 (CDT)
Message-ID: <60615.206.166.83.50.1124398805.squirrel@mail.innovativesource.net>
References: <57933.67.53.150.63.1123957195.squirrel@mail.innovativesource.net>	<430028A8.3090508@riverviewtech.net>	<22055.206.166.83.50.1124208942.squirrel@mail.innovativesource.net>	<4302D0F1.8030005@riverviewtech.net>	<19817.206.166.83.50.1124294643.squirrel@mail.innovativesource.net>	<43042660.7090405@riverviewtech.net>
	<39173.206.166.83.50.1124389983.squirrel@mail.innovativesource.net>
	<4304E651.1050807@riverviewtech.net>
Reply-To: jonathan@innovativesource.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4304E651.1050807@riverviewtech.net>
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

> Disclaimer:  I'm at the office and I can not give a proper reply now so
> more will follow later.

Understand completely and appreciate the time taken.

> Is $ExternalIP the external IP of the firewall or the dmz machine?
>
> Umm...  I have, possibly incorrectly, been operating under the assumpti=
on
> that they were one in the same.  I was believing that you were wanting
> your firewall, with the ExternalIP, to forward any traffic that was not
> related to your LAN's internet traffic over to your DMZ server.  Thus I
> was going that route for a solution.  Let me go reread what you have se=
nt.
> ... (reading) ... Ok, see if you agree with how I'm restating what you
> said earlier.
>
>      Router WAN interface =3D xx.yy.yy.241
>      Router LAN connected to DMZ switch =3D xx.xx.xx.183 (IP Network =3D
> xx.xx.xx.182)

This may have been a type on my end, LAN is connected to a LAN Switch

>
>   Firewall eth1 connected to ?????????? =3D xx.xx.xx.184 (IP Network =3D
> xx.xx.xx.182)

connected to router

>   Firewall eth2 connected to DMZ switch =3D xx.xx.xx.185 (IP Network =3D
> xx.xx.xx.182)
> DMZ server eth0 connected to DMZ switch =3D xx.xx.xx.186 (IP Network =3D
> xx.xx.xx.182)
>
>   Firewall eth0 connected to LAN switch =3D 10.123.x.x
>
> As I'm looking (closer) at what you said earlier I have a question.  Yo=
u
> say that eth1 on your firewall is connected to your router.  Is that
> connection via a cross over cable or via a cable plugged in to the the =
DMZ
> switch?


  router
    |
  VLAN Switch
    |
 firewall
  |    |
  |    |
 LAN  DMZ


So, it's a cable plugged into the VLAN switch.


>If eth1 is connected to the DMZ switch what is the difference
> between eth1 and eth2 on your firewall?

eth1 is connected to the router and eth2 is connected to the DMZ switch.

>I'm sort of believing that eth1
> is connected to the router via a cross over cable and yet the router an=
d
> the DMZ systems are on the same IP subnet, or at least it appears that =
way
> from the IPs that each piece of equipment has.

Yes, they are on the same subnect.  Not sure if it's a cross over cable.

> Do you have a subnet of IPs or just a handful of IPs allocated to you b=
y
> your provider that are accessible via the xx.yy.yy.241 IP?  I have a
> feeling that part of your problem is that you are trying to break routi=
ng
> by using routing.  If you are wanting to break routing you will need to
> bridge some things together.  However I don't think you do have a block=
 of
> IP addresses unless you have a block of 16 that ends with 191 being the
> broadcast IP (xx.xx.xx.176-191).

I changed my IP's a little :) ...I do have a block of 16.  The actual
broadcast is 207 and the network is 192. or at least that I have for
ifcfg-eth0 - (NETWORK=3Dxx.xx.xx.192)

>Depending on what you have and what you
> want to achieve decides the way that this problem can be solved.  The m=
ore
> that I look at it the more it looks like you have a circuit from a
> provider who has provided you with a small group of IPs.  Is this the
> case?  Are the IPs in question in a subnet or just a scattering of them=
?
>
subnet...

my firewall has 3 NIC's.  one connected to the router (well the VLAN
switch) which has an IP of 194.  the router is 193.  the dmz nic (eth2) i=
s
195, the LAN is, well the LAN.  On my DMZ, I plan to provide static
address which are globally routable and from my subnet.

Sorry if I'm not making any sense... haven't had much sleep...

I've been trying a few rules here and there trying to get something to
work... but to no avail.



