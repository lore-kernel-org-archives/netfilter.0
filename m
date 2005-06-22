From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: IBM Dispatcher X iptables AND linux advanced routing
Date: Wed, 22 Jun 2005 13:14:19 -0500
Message-ID: <42B9AA7B.9010204@riverviewtech.net>
References: <002601c5774e$499f2c90$5100a8c0@14bis>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <002601c5774e$499f2c90$5100a8c0@14bis>
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

Hmm, interesting question.  The short answer is yes, the long answer is y=
es you can do something similar in multiple ways.  The first thing that c=
omes to mind that would satisfy the 2nd half of your question "...route a=
ll <your favorite service here> traffic to only one server if the other s=
erver is down." is VRRP (Virtual Router Redundancy Protocol).  VRRP is no=
t a load balancer but it will allow you to send your traffic to multiple =
servers and have one answer for you no matter which one is down.  VRRP wo=
rks by taking two or more systems (routers for what it was designed for b=
ut it should be able to be used for other things too) and have them colle=
ctively act like an additional virtual server in such that they collectiv=
ely (in turn *) answer for the virtual IP that they pretend to be.  The b=
oxen running vrrpd will periodically probe each other (ping / look for he=
art beat from other (master) system(s)) and take over the active role of =
the virtual IP if the ""acting master is=20
not or has not responded with in a specified amount of time.  VRRP will m=
ake a virtual IP and MAC that is common among all the systems running in =
the VRRP system so as to not confuse any client systems that are connecti=
ng to it.  You can get more information on VRRP at http://sourceforge.net=
/projects/vrrpd/.

The other method that comes to mind is a Linux Virtual Server.  LVS is re=
ally a load balancer that route jobs to two or more multiple servers behi=
nd the LVS router to handle the job.  I have not read much about LVS so I=
 can not talk about it as much as I can VRRP.  But from what I have read =
the LVS router will monitor each ""real server behind it and remove a dea=
d / non responding server from the list of available servers to route job=
s to thus ensuring that all jobs are handled and that no down or over loa=
ded server gets traffic when it is unable to handle it.  From my reading =
(what little of it I have done) LVS has 3 different ways to route traffic=
 to the real server that handles it, each with it's pros and cons.  You c=
an get more information on LVS at http://www.linuxvirtualserver.org/.

From a removed point of view VRRP will vary easily provide your fail over=
 and redundancy for any system to fail, however there will only be one ""=
system doing the work and thus not load balance.  Where as LVS will be ab=
le to load balance across multiple ""systems that are actually doing the =
work and redirect to different systems if a worker is down.  However it l=
ooks like if the LVS router goes down your entire logical system goes dow=
n.

Thus I would be tempted to use a combination of VRRP and LVS to ensure th=
e maximum uptime and availability.  To do so you would want to have a two=
 or more systems configured identically as LVS routers that were respondi=
ng on a VRRP IP address.  Thus if either of the LVS routers went down and=
 took the virtual IP that LVS was functioning on VRRP would automatically=
 activate the virtual IP on one of the other VRRP systems that was config=
ured as an identical LVS router.  During this transition you might have s=
ome state of an ongoing connection lost and thus redirected (unless you f=
ound a way to share the state information between multiple LVS servers).

I don't know if this answer is overkill or not, but this is just my take =
on what you asked.  I would not mind playing with VRRP and would be willi=
ng to help get something up and running if you would like some additional=
 help.  I suppose I could be persuaded to do some work with LVS too...



Grant. . . .

Bruno Negr=E3o wrote:
> Hi guys,
>=20
> I'm reading a documentation regarding high availability of LDAP server,
> and this document says it is possible use an IBM network device called
> IBM Dispatcher that can automatically divide the bandwidth between two
> LDAP servers (a master and a slave server (that is a replica of the
> master)). But further on, it can route all the LDAP traffic to only one
> server, if the other server is down.
>=20
> I know it's possible to implement bandwidth control with linux, but wha=
t
> about the second feature? Does someone know if it's possible to
> implement the second feature using linux?
>=20
> Thank you,


