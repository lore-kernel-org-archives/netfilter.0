From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: please advise on this rule
Date: Tue, 12 Aug 2003 11:51:42 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF5122E1F@alderaan.smgtec.com>
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
To: Payal Rathod <payal-iptables@staticky.com>, netfilter@lists.netfilter.org

Source field doesn't matter since traffic destined for the internal
(private) network will only pass through that chain if you define DNAT
rules for them.

The port 80 rule seems ok, but trusting something like that where a user
can change their IP's or use different port numbers, it is pretty light
security for anyone who knows what they are doing.

-----Original Message-----
From: Payal Rathod [mailto:payal-iptables@staticky.com]=20
Sent: Wednesday, August 13, 2003 11:25 AM
To: netfilter@lists.netfilter.org
Subject: please advise on this rule

Hi,
Does this FORWARD chain look ok in a simple NAT network where the Linux
box is connected to the net.

Chain FORWARD (policy DROP)
target     prot opt source               destination
ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0
ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0          state
RELATED,ESTABLISHED
REJECT     tcp  --  192.168.10.1         0.0.0.0/0          tcp dpt:80
reject-with icmp-port-unreachable


Is source 0/0 OK? Should be be 192.168.10.0/24 ?
Will the third rule block outgoing connection from 192.168.10.1 to any
server at port 80?

Thanks a lot and eagerly waiting for the reply.
With warm regards,
-Payal

--=20
"Visit GNU/Linux Success Stories"
http://payal.staticky.com
Guest-Book Section Updated.


