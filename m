From: "Maxime Ducharme" <mducharme@cybergeneration.com>
Subject: Re: Protecting multiple webservers
Date: Wed, 12 Jan 2005 10:14:40 -0500
Message-ID: <399701c4f8b9$7031da10$b000a8c0@cybergeneration.com>
References: <15069645.1105491740310.JavaMail.rct@kale>
	<200501120401.01332.bob@zooid.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Hello

Protecting your Apache servers with iptables is a good
idea.

In order to use the FORWARD rule you must coordinate
with your ISP (or IT department) so they route packets
to your Apache web servers trought a precise IP
(which will be the IP of the firewall).

The idea of DNAT here isnt bad since you do not need
the ISP intervention. The IP will be mapped
to the firewall, so users wont see the difference since
they are accessing this IP already (no need to change
DNS information).

DNAT makes the firewall invisible and allows packet
filtering like FORWARDing.

You may then map each external IPs on the firewall and
DNAT each external IP to an internal IP.

Obvisouly you will adjust Apache servers IP to internal
IPs.

To limit iptables modification, add each external IPs
to the rules and map them to internal IPs.

If you want to add other servers, place them in the
good internal IP space.

If you have new IPs, you will have to modify iptables.

I do not think you can automagically forward packets,
DNAT module allows multiple hosts in to --to-destination
parameter, but hosts will be used at random
( see
http://iptables-tutorial.frozentux.net/iptables-tutorial.html#DNATTARGET )

Someone correct me if I'm wrong

Hope that helps

Have a nice day

Maxime Ducharme
Programmeur / Sp=E9cialiste en s=E9curit=E9 r=E9seau

----- Original Message -----=20
From: "Bob Tellefson" <bob@zooid.com>
To: <netfilter@lists.netfilter.org>
Sent: Tuesday, January 11, 2005 11:01 PM
Subject: Re: Protecting multiple webservers


> On Wednesday 12 January 2005 01:01, gui wrote:
> > Hello,
> >
> > I work as a computer programmer for a small university and I was asked
> > to set up a firewall to protect three Apache web servers.  Each server
> > runs on its own machine, each server has its own name, public IP
> > address and they all listen on port 80.
> >
> > After reading a few howto's, I came up with the following iptables
> > rules (I won't list all of them):
> >
> > #www.server1.edu
> > -A PREROUTING -i eth0 -p tcp -d X.X.X.103 --dport 80 -j DNAT --to
> > 192.168.0.2:80
> >
> > #www.server2.edu
> > -A PREROUTING -i eth0 -p tcp -d X.X.X.103 --dport 8080 -j DNAT --to
> > 192.168.0.3:80
> >
> > Those rules work fine in the little network I created in my office.
>
> Since your web servers have valid public IP addresses DNAT will not be
needed.
>
> Just be sure that your FORWARD rules allow the required traffic through.
If
> your default FORWARD policy is DROP, add a line such as:
>
> iptables -A FORWARD -p TCP -m multiport --dport 80,8080 -j ACCEPT
>
> or you may wish to filter for each host like:
>
> iptables -A FORWARD -p TCP -d x.x.x.103 --dport 80 -j ACCEPT
> iptables -A FORWARD -p TCP -d x.x.x.104 --dport 8080 -J ACCEPT
>
> Using the first example, you can have any number of hosts listening on
ports
> 80 and/or 8080 without firewall changes.  The second approach would, of
> course, require individual lines for each server you wish to open up.
>
>
>
> --=20
>
> Bob Tellefson
> Java network application development & hosting
>


