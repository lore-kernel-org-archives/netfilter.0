From: "Paul Albert" <palbert@rovingplanet.com>
Subject: RE: libipq -- 90 mbps
Date: Wed, 12 May 2004 12:40:56 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <6A94CF724B046C4FB3434D14A49A58BF1CB78E@pluto.rovingplanet.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: netfilter@lists.netfilter.org

Amit -=20

I've gotten upwards of 250 Mbps using libipq and the QUEUE target with
gig interfaces. =20

We tweeked both ip_queue_maxlen and rmem_default and nice'ed the
userland process that was reading from the netlink to get those values.

Good luck!

Paul


-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of
aksingh@hss.hns.com
Sent: Wednesday, May 12, 2004 4:01 AM
To: netfilter@lists.netfilter.org
Subject: libipq -- 90 mbps





Hi

  can libipq support traffic at the rate of say 90 mbps/sec ?

    we can increase the ipq_queue_maxlen using sysctl system call, but
is
   there any upper limit on this queue size ? or can we give it any
value
   till sizeof(int)
   has anybody here ever tried this much traffic while using ip_queue
and
   libipq ?


TIA
Amit





"Daniel Chemko" <dchemko@smgtec.com>@lists.netfilter.org on 05/12/2004
03:48:57 AM

Sent by:    netfilter-admin@lists.netfilter.org


To:    <alucard@kanux.com>, <netfilter@lists.netfilter.org>
cc:

Subject:    RE: forwarding on the same NIC


> To make matters worse, the second webserver is IIS and I have no idea
> how to use IP Multiplexing on Win2k, I could do it in linux but
> Windows systems are not my expertise. What I'm going to do -if I get
> the permission- is this: Install a 2nd nic on the 2nd webserver so
> the IP address that is being used doesn't get affected and I will
> configure it's router to the linux box so it can redirect packets
> where they should go...

You are either not grasping how difficult what your trying to do, or you
haven't used proper the wording. Source Routing from windows =3D=3D =
blah! If
you're relying on windows to do routing, I pity thou.


To the best of my knowledge, you have:
x.x.x.254 ROUTER
   |--x.x.x.1 Linux Server 1  (default route x.x.x.254)
   |--x.x.x.2 Windows IIS (default route x.x.x.254)

You have the router forwarding a public IP address and PATing it to
x.x.x.1. You want x.x.x.1:8080 to go to x.x.x.2:80

To get this to work, use:

# Allow any established traffic to traverse the machine
iptables -A FORWARD -m state ESTABLISHED,RELATED -j ACCEPT
# Forward the packet destined for 8080 to the windows machine on port 80
iptables -t nat -A PREROUTING --destination x.x.x.1 -p tcp --dport 8080
-j DNAT --to x.x.x.2:80
# Allow new web traffic into the network
iptables -A FORWARD --destination x.x.x.2 -p tcp --dport 80 -j ACCEPT
# Forces the windows box to route back to you before leaving the network
iptables -t nat -A POSTROUTING --destination x.x.x.2 -p tcp --dport 80
-j SNAT --to x.x.x.1

The order of traversal becomes:

Router->Firewall->Windows->Firewall->Router
Instead of
Router->Firewall->Windows->Router
The later breaks as I've described earlier.






