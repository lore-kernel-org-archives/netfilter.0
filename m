From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: Strange paket loss on trivial NAT configuration...
Date: Wed, 28 May 2003 08:19:40 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A0D6D11@wardrive.citadelcomputer.com.au>
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
To: Matthias Hopf <Matthias.Hopf@informatik.uni-stuttgart.de>, netfilter@lists.netfilter.org

OK. iptables isn't the blame here but it can help.

I believe the problem you MAY be experiencing is an MTU problem.. you =
can lower it's value and it'll probably fix your problem.

A client of mine had this problem with getting mail from some servers =
and browsing some sites. It appears that the ISP has a low MTU (probbly =
below 1400) and some packets get badly fragmented or something and =
causes loss of packets.. something like that.

There is a rule which you can add to iptables which tells it that any =
packets leaving the OUTPUT table or POSTROUTING table to make the MTU =
fixed at 1400 or something.. can anybody provide it, I've seem millions =
of hits on google.com for this...

I can't connect to my client as they have changed the root password but =
I'm sure someone on the list knows the problem and the idea I have to =
give more info..

Then, I can be totally wrong but it may be something you might need to =
investigate incase you spend hours on something it's not..

Thanks,
____________________________________________
George Vieira
Systems Manager
georgev@citadelcomputer.com.au

Citadel Computer Systems Pty Ltd
http://www.citadelcomputer.com.au
=20

-----Original Message-----
From: Matthias Hopf [mailto:Matthias.Hopf@informatik.uni-stuttgart.de]
Sent: Wednesday, May 28, 2003 12:31 AM
To: netfilter@lists.netfilter.org
Subject: Strange paket loss on trivial NAT configuration...


Hi folks!

Finally, I'm lost.

I have a quite simple NAT configuration here, which shields a single =
host
behind a firewall, and masquerades all its connections to the internet.
Usually, this works remarkably well, but *sometimes* some connections =
seem
to lose a lot of pakets. However, at other times they work.
These connections seem to be related to specific hosts, the most =
prominent
one is www.google.de.


Ok, now from the very beginning:

I have a simple network layout:

'ivanova' 10.10.10.11  -(eth0)->  10.10.10.9 'garibaldi' 80.131.72.244  =
-(ppp0)->  217.5.98.33 internet

ppp0 is an internal ADSL adapter (Fritz DSL!, CAPI-driver Rev 1.1.4.1,
fcdsl V3.09-14, driver package 2002.04.16-1).
garibaldi is the firewall box, ivanova is the masqueraded PC.

On Ivanova, I tried both, Windows and Linux, no difference.
I have also tried different PCs, one running SuSE 7.3 (old!), one =
running
Debian/unstable (current). Both with vanilla kernel 2.4.20.

On the firewall there runs a current unstable Debian distribution, =
vanilla
2.4.21-rc3 (tried 2.4.20 before) kernel. iptables is v1.2.7a.

I have stripped down my firewall rules to (no filter or mangle table):


# iptables -t nat -v -L

Chain PREROUTING (policy ACCEPT 48 packets, 6247 bytes)
 pkts bytes target     prot opt in     out     source               =
destination        =20
    2   120 ACCEPT     tcp  --  ppp+   any     anywhere             =
anywhere           tcp dpt:ssh=20
   41  2970 DNAT       all  --  ppp+   any     anywhere             =
anywhere           to:10.10.10.11=20

Chain POSTROUTING (policy ACCEPT 1685 packets, 72712 bytes)
 pkts bytes target     prot opt in     out     source               =
destination        =20
   14   919 MASQUERADE  all  --  any    ppp+    anywhere             =
anywhere          =20

Chain OUTPUT (policy ACCEPT 1993 packets, 97370 bytes)
 pkts bytes target     prot opt in     out     source               =
destination        =20


That is, ssh goes to garibaldi, everything else goes straight to =
ivanova.
Everything from ivanova goes out masqueraded.
So the firewall box is (except for ssh) basically invisible.
I tried a setup with only masquerading and no DNAT, same effect.
I had much more complex rules with logging etc., same effect.

Wenn I do a 'lynx www.google.de' on garibaldi, everything works as =
expected.
Wenn I do a 'lynx www.google.de' on ivanova, sometimes it just hangs. =
Sometimes
during connecting to www.google.de, sometimes it waits for the answer =
(sent
http request, waiting for answer), sometimes it waits for some later =
part
of the anser (HTTP 200 OK). After some timeout (several minutes), the =
tcp socket
closes.
Sometimes the web server works like charme. The results are somehow =
reproducable,
if the connection works at some given point of time, it is most likely =
that it
will work in the near(!) future as well. After a couple of minutes of =
inactivity,
things can change, though.

Note that this only happens on some (few) servers. I have currently no =
idea,
what the prerequisites are. I have tested slow hosts, extremely fast =
hosts,
hosts in Germany, USA, Australia, no recognizable pattern. I have =
downloaded
several hundreds of MB masqueraded, no probs. The only host that is =
somehow
quite reproducable for me is www.google.de.

Now I did a 'tcpdump -vvelxX -s256 -i ppp0 \! host rock' while trying to =
contact
the web server (rock is the host that has been used for remote =
administration,
so simply ignore). I have uploaded a successfull request from garibaldi =
and
an insuccessful request from ivanova to my website (they are rather =
short).
So if anybody has an idea, please take a look at
http://www.mshopf.de/tmp/google.garibaldi.new
http://www.mshopf.de/tmp/google.ivanova.new

What I detected is that on ivanova after connection initialization the =
first
few pakets for the www connection do not get delivered, but only the =
final
one (FIN set):
14:32:33.181778 < ip 56: 216.239.37.99.www > 80.131.72.244.32797: . [tcp =
sum ok] 1:1(0) ack 1451 win 30660 (DF) [tos 0x10]  (ttl 54, id 35744, =
len 40)
[paket data...]
14:32:33.197608 < ip 843: 216.239.37.99.www > 80.131.72.244.32797: FP =
2921:3708(787) ack 2201 win 32120 (DF) [tos 0x10]  (ttl 54, id 36485, =
len 827)
[paket data...]

Then, tcp wants to recover, but appearantly there are no pakets =
received.


Has anybody any clue what's happening here?

Another point: where in the filter chain does tcpdump (promiscuous mode) =
fit
in? Does it get all packages (before prerouting)? Seems to me, as it =
does
not see the original (masqueraded) ip address of ivanova.
However, if this is so, the system appearantly does not receive all =
reply
pakets from the internet, and I really don't get it why it depends on =
the
source (masqueraded vs. local host) and daytime...


Thanks in advance

Matthias

--=20
Matthias Hopf - Visualization and Interactive Systems Group    \  |  |  =
/--
                  University of Stuttgart,                      \ |  |   =
\
       Universitaetsstr. 38, 70569 Stuttgart, Germany            \|  |  =
--/
Phone +49-711-7816-404    Fax -340          mat@mshopf.de     =
www.mshopf.de


