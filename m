From: "Piszcz, Justin Michael" <justin.piszcz@mitretek.org>
Subject: RE: to snat or to dnat .. that is the question
Date: Tue, 1 Jun 2004 10:42:59 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <5D3C2276FD64424297729EB733ED1F76062433BA@email1.mitretek.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-class: urn:content-classes:message
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
To: Peter Marshall <peter.marshall@caris.com>, netfilter <netfilter@lists.netfilter.org>

If the box 192.168.0.20 does not have the firewall's IP as its default
route, then it will not work correctly (DNAT), I am not sure about SNAT.


-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Peter Marshall
Sent: Tuesday, June 01, 2004 10:30 AM
To: netfilter
Subject: to snat or to dnat .. that is the question

Hi again.

I am at a bit of a quandary, and am not sure what to do.

Let the external interface on my firewall be 100.100.100.100
I have an internal box; 192.168.0.20 that needs to connect to an
external
box 200.200.200.200 on port 2000.

I want the internal box to connect to hit my firewall on a different
port ..
say 15000

so basically

start: .... -s 192.168.0.20 -d 200.200.200.200 --dport 15000
after firewall -s 100.100.100.100 -d 200.200.200.200 --dport 2000

How can I do this ?

I started out with:

$IPT -t nat -A POSTROUTING -d 200.200.200.200 --dport 15000 -p tcp -i
eth0 \
       -j SNAT --to-source 100.100.100.100

But this does not change the destination port (obviously). I thought
about
doing the following

$IPT -t nat -A PREROUTING -d 100.100.100.100 --dport 15000 -p tcp -i
eth0 \
         -j DNAT --to-destination 200.200.200.200 --dport 2000

However, I don't think that this will change my source address.  Also,
will
this even forwarded the packets ?  They would be coming on the input
chain
would they not ?


Thank you for the help.
Peter Marshall


Peter Marshall, BCS
Network Administrator, CARIS
115 Waggoners Lane, Fredericton NB, E3B 2L4 CANADA
Phone:  (506) 458-8533 (Reception)





