From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: Help Netfilter+Bridge+Tokenring
Date: Tue, 30 Sep 2003 14:49:10 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A15C3D6@wardrive.citadelcomputer.com.au>
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
To: kilho Kim <kilho8667@yahoo.com>, netfilter@lists.netfilter.org

Simple, those machines (A,B) should drop all packets in their INPUT =
tables as only passing through packets will traverse the FORWARD =
chain...
Unless I misunderstood you but I think that's all you need..

Thanks,
____________________________________________
George Vieira
Systems Manager
georgev@citadelcomputer.com.au

Citadel Computer Systems Pty Ltd
http://www.citadelcomputer.com.au

Phone   : +61 2 9955 2644
HelpDesk: +61 2 9955 2698
=20

-----Original Message-----
From: kilho Kim [mailto:kilho8667@yahoo.com]
Sent: Tuesday, 30 September 2003 2:35 PM
To: netfilter@lists.netfilter.org
Subject: Help Netfilter+Bridge+Tokenring


I have somewhat wiered setup and need some advices.

One machine(A) has 3 Ethernet adapters and 1 token
ring adapter installed. Three clients will be attached
to 3 Ethernet adapter, and the tokenring adapter is
connected to the another linux box (B) acting as a
router. The box (B) will be connected to the internet.

I setup the bridge on box (A). (basically I followed
Ethernet-Bridge-Howto).
The bridge (br0) includes eth0, eth1, and eth3. Then
there is a tokenring interface to box (B).

I'm trying to see if I can use iptables to forward any
packets incoming from the client machines attached to
br0 to tokenring adapter and eventually end up at box
(B).

Well the other requirement I have is those clients
attached to Box (A) shouldn't be able to access the
Box (A) and Box (B) other then sending packets through
them.

I'm a very novice iptables user so if you're kind
enough to show me some of the iptables command and
configuration strings, it would help me a lot.

Thanks much.


__________________________________
Do you Yahoo!?
The New Yahoo! Shopping - with improved product search
http://shopping.yahoo.com


