From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: DNAT
Date: Tue, 9 Sep 2003 08:48:50 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A15C275@wardrive.citadelcomputer.com.au>
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
To: Nejc Skoberne <nejc.skoberne@guest.arnes.si>, netfilter@lists.netfilter.org

This is a typical problem which gets asked over and over again. If you =
think about it carefully, you'll understand why this doesn't work.

Explained:

1. Your internal tries to access the server on it's external address.
2. The firewall DNATs it changing it's external address to the internal =
server address.
3. The packet arrives at the destination of 192.168.1.1
4. The Server responses to the SYN and "sends it back to 192.168.1.X =
DIRECTLY"
5. The client machine receives a packet from 192.168.1.1 and drops the =
packet because it has no reference to that machine, only to the w.x.y.z =
IP address. So the connection is never made.

6. Use SNAT between the local machines and the internal 192.168.1.1:4444 =
machine as you would when the internal users browse the internet and you =
masquerade them. You have to masquerade them for the internal server =
too.

iptables -A POSTROUTING -p tcp --dport 4444 -s 192.168.1.0/24 -d =
192.168.1.1 -j SNAT $FIREWALLINTERNALIP

The above rule should fix that..

-----Original Message-----
From: Nejc Skoberne [mailto:nejc.skoberne@guest.arnes.si]
Sent: Tuesday, September 09, 2003 12:40 AM
To: netfilter@lists.netfilter.org
Subject: DNAT


Hi.

I have a problem with DNAT. I want to set up portforwarding. In local
network I have two servers and workstations. One (main) server is =
listening
at some port, let's say 4444. The other one also acts like a gateway
to internet and I set up a portforwarding like this:

iptables -A PREROUTING -p tcp --dport 4444 -j DNAT --to 192.168.1.1:4444

where 192.168.1.1 is the IP of the main server which runs the service.
If I try to connect from outside, everything works fine. If I try to
connect from one of workstations to the gateway machine to port 4444,
nothing happens. tcpdumps shows just requests but no answers. Why
doesnt DNAT work also for local IP addresses?

Thanks.

--=20
Nejc Skoberne
Grajska 5
SI-5220 Tolmin
E-mail: nejc.skoberne@guest.arnes.si



