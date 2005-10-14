From: "Derick Anderson" <danderson@vikus.com>
Subject: RE: Advice on setting up a firewall for a Windows Domain Controller
Date: Fri, 14 Oct 2005 09:05:56 -0400
Message-ID: <FAC4E024BF776842876169173CE2F013286E@mailbox.vikus.com>
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
To: Zacky <nospam2day@gmail.com>, netfilter@lists.netfilter.org

=20

> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org=20
> [mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Zacky
> Sent: Wednesday, October 12, 2005 1:04 PM
> To: netfilter@lists.netfilter.org
> Subject: Advice on setting up a firewall for a Windows Domain=20
> Controller
>=20
> Hello everyone,
>=20
> I was asked to set up a firewall for a Win2K domain=20
> controller, which also acts as a print server, web server and=20
> SQL server... Last year, I was assigned a similar project but=20
> never got around to work on it.
> However, I did some research on the topic and I was directed=20
> to this KB article that lists the ports I have to open for=20
> the DC to work behind the firewall:
>=20
> http://support.microsoft.com/kb/179442/
>=20
> While I have set up firewalls in the past, I'm not very=20
> familiar with Windows networks and I would like to hear your=20
> opinions on how to go about setting up the firewall.
>=20
>   Here's some info about the network. The DC and all the 25=20
> Windows XP desktops that connect to the DC have public IP=20
> addresses, but only the DC has a FQDN. The requirement is to=20
> keep the desktops' public IP addresses and just move the DC=20
> behind the firewall.
>=20
> Again, any tips will be greatly appreciated.
> Thanks,
> -G

I'm with rob0 on this one - this really sounsd like a school assignment.
However, having been the lab assistant for a network security class my
last two years of college, I am more sympathetic if that is the case. =
=3D)

Let's pretend that your requirements are in stone and you will fail if
you don't meet them. First I must add to the existing comments that this
is the second dumbest network setup ever. (The dumbest setup ever,
period, would be removing the firewall and letting the DC have direct
access to the internet.) Your machines will get owned in minutes if they
aren't fully patched (8 new MS patches came out two days ago).

OK, rant over. You have a two-legged firewall setup which I will not
even attempt to do in pretty ASCII since I'm forced to use Outlook 2003
where I work. Ugly ASCII will have to do:

Internet
   |
Gateway
   |
Switch -- FW -- DC
   |
Future Zombie Machines

You've got a few options: (1) Turn the firewall into a bridge (2) Put
the DC on its own subnet and use routing (3) Put the DC on its own
subnet and use NAT (4) Something complicated

My vote is for #2, and make the firewall the DHCP server since DHCP and
routing gets annoying fast. You'll need to open all the appropriate
ports in FORWARD inbound to your DC, as well as outbound to the Internet
from your DC. Your firewall's Internet-facing NIC should be in the same
subnet as the gateway, and the DC-facing NIC should be in the DC's
subnet, etc...

That's my two cents. Good luck with it.

Derick Anderson

