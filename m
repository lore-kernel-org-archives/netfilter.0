From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: Round Robin Load Balancing
Date: Tue, 15 Jul 2003 12:44:40 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF5122DF5@alderaan.smgtec.com>
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
Content-Type: text/plain; charset="us-ascii"
To: Javier Govea <jgovea@magma.ca>
Cc: netfilter@lists.netfilter.org

Because of the nature of your setup, you cannot have a perfect equal
load balance setup. This is because you cannot control the inbound flow
of data. If one user makes a request out of line X then the return
packet HAS to come back through line X. So, if one guy sends a huge
request taking minutes to fulfill, he / she will tie up the line until
the job is finished. The load balancer should be smart enough to not
send any more requests to that line, but you are still seeing the line
being monopolized by this single connection, hence it is not balanced
over all lines equally.

In order to have fair balancing of all lines, I think you need to set up
a deal with your ISP to load balance on their end as well.

You could also setup something like BGP to allow multiple routes to the
same return address, but I am not familiar enough with BGP to be much
help in this area. In all likelihood, you are better off with your
current solution or maybe the ISP solution if it is supported by them
(more money usually).



-----Original Message-----
From: Javier Govea [mailto:jgovea@magma.ca]=20
Sent: Tuesday, July 15, 2003 12:34 PM
To: netfilter@lists.netfilter.org
Subject: Round Robin Load Balancing=20

Hi,

I'm trying to do some load balancing with four ppp connections. Here is
what i have: a LAN
connected to a redhat box which has four ppp interfaces. All the boxes
in the LAN are
accesing internet through the ppp interfaces in the redhat box. I'm
using iproute2, in my
redhat box, to setup the the four ppp interfaces as my default out going
route (as
described in LART http://lartc.org/howto/index.html) and I'm using
iptables to masquerade
all the traffic comming from the LAN.=20

My setup is working fine, ie. my LAN can access the net throught the
four ppp interfaces.
My problem is that i don't know how is the load balancing working. Some
times one of the
ppp interfaces is used more than the others (and that is my problem).
According to LART
the routes are cached, can someone go a bit into more details in this
caching thing??? how
does it work?  which particular files in the kernel are doing this? =20

I would like to implement a simple round robing algorithm (with no
caching) for doing the
laod balancing. That is first connection established gose through ppp0,
the second
connection on ppp1 and so on.=20

I could hack iproute2 and/or iptables, but i'm not sure about which
particular files i
should hack in order to implement this round robin algorithm. I actually
don't know if
what i want makes any sense

Any ideas or pointers are all very well appreaciated.
Thanx to all
X


