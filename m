From: Khanh Tran <khanh@slc.edu>
Subject: RE: Forwarding Problems
Date: Thu, 6 Mar 2003 13:10:33 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <01CEA3A5B8B2D511890F0002A5870AEC64EC56@EXCHANGE>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
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
Content-Transfer-Encoding: 7bit
To: 'Patrick Ahler' <patrick@vikus.com>, netfilter EMAIL <netfilter@lists.netfilter.org>

You need to make sure you set your default (-P) policies first, THEN append
your FORWARD chain ACCEPTs.  Iptables rules are built sequentially, so you
have to do the more generic stuff first, then do more specific 
exceptions afterwards.

Khanh Tran
Network Operations
Sarah Lawrence College
1 Mead Way
Bronxville, NY 10708



-----Original Message-----
From: Patrick Ahler [mailto:patrick@vikus.com]
Sent: Thursday, March 06, 2003 11:56 AM
To: netfilter EMAIL
Subject: Forwarding Problems


I have iptables FORWARD chain working except for one minor detail... after I
set all the ACCEPT rules, I want to set a drop rule/policy to the FORWARD
CHAIN as well, thus dropping all the packets I haven't accepted. The problem
is, if I use

iptables -A FORWARD -j DROP
or
iptables -P FORWARD DROP

they will drop all packets including the ones I already ACCEPTed.

example (want to allow all incoming and outgoing www traffic):
iptables -A FORWARD -p tcp -d 192.168.1.0/24 --dport 80 -j ACCEPT
iptables -A FORWARD -p tcp -d 192.168.1.0/24 --sport 80 -j ACCEPT
iptables -A FORWARD -p tcp -s 192.168.1.0/24 --dport 80 -j ACCEPT
iptables -A FORWARD -p tcp -s 192.168.1.0/24 --sport 80 -j ACCEPT
iptables -A FORWARD -j DROP

Any help is greatly appreciated




