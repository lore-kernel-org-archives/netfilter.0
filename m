From: "John Jones" <jjones@merlintechnologies.com>
Subject: Help needed understanding what I am doing wrong.
Date: Mon, 3 Jun 2002 11:59:04 -0700
Sender: netfilter-admin@lists.samba.org
Message-ID: <002101c20b30$bb406310$6301a8c0@JJONES1>
References: <200206031839.g53IdFA13473@Networker.rockstone.co.uk>
Reply-To: <jjones@merlintechnologies.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <200206031839.g53IdFA13473@Networker.rockstone.co.uk>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Iptables <netfilter@lists.samba.org>

I have banged my head for too long, and now it is no longer an exercise
in learning IPTABLES, but an exercise in frustration.

Can someone please help me here? 

  What I need to do is set up a DMZ firewall that forwards all DNS
requests to an internal server (10.0.0.10).

Once I am shown what I -should- be doing, I can translate all of the
other rules that I need to implement, such as the forwarding of HTTP
requests on the various external IPs into that same server (10.0.0.10),
on different ports.  

It's that simple.  I am not sure what I am doing wrong, I have used
example rules from both the Netfilter HOWTOs, a few of the tutorials I
have found, etc.  I am just not able to understand this, it seems.  I am
dense.  I apologize if this is a stupid request, but I need to get this
firewall replacement finished so that I can move on to more critical
issues.  Below is a sample of what I have been trying.


iptables -t nat -I PREROUTING 1 -p udp -d 66.38.133.113 --dport 53 -j
DNAT --to 10.0.0.10:53
iptables -I FORWARD 1 -p udp -s 0.0.0.0 -d 10.0.0.10 -j ACCEPT
iptables -t nat -I PREROUTING 1 -p udp -d 66.38.133.114 --dport 53 -j
DNAT --to 10.0.0.10:53 
iptables -t nat -I POSTROUTING 1 -p udp -s 10.0.0.10 -j SNAT --to
66.38.133.113:53
(( The above is my first attempt ruleset.  This list reminded me to NAT
the outgoing packets again, hence the last line entry. ))

(( That didn't work, so I wiped the rules clean and went in search of
more learning and advice.  I found this: ))

iptables -t nat -A PREROUTING -d 66.38.133.120 -p tcp --dport 53 -j DNAT
--to-destination 10.0.0.10:53
iptables -t nat -A POSTROUTING -o eth1 -s 10.0.0.0/24 -j SNAT
--to-source 66.38.133.120

(( The above is copied and pasted from a Tutorial, all I have done is
replace IPs. ))

None of this works, and while it is obvious to you guys why, it is not
obvious to me. :(  I don't want to appear like an idiot, but I -have-
read the HOWTOs and such.  I -know- that the nat table is called first
for PREROUTING, then the filter table for FORWARD (INPUT is only used
for localhost destinations, right?), then the POSTROUTING.  I also know
that POSTROUTING does the SNAT, while PREROUTING does DNAT.  So, I
-have- been reading, I just cannot get this to work and need help.

While I have been reading the list, other list archives, etc.  I have
stumbled across a few references to IP Aliasing on NICs being a bad
thing.  This concerns me, since our firewall has 5 external IPs, all
aliased to the same NIC.  The firewall rules then forward the various
requests, depending on the destination address, to the correct port on
the DMZ server, which has multiple 10.0.0.x addresses aliased as well.

I would appreciate any help or input.  I am at my wit's end, and it is
really starting to affect my work.


