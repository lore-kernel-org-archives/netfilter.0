From: Neal Murphy <neal.p.murphy@alum.wpi.edu>
Subject: conn association query
Date: Thu, 13 Dec 2012 01:02:02 -0500
Message-ID: <201212130102.02617.neal.p.murphy@alum.wpi.edu>
Reply-To: neal.p.murphy@alum.wpi.edu
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Brief summary
-------------
  I want to be certain that my firewall stops all communication on a conn and
  its related conns when that 'master' conn becomes prohibited or is
  disconnected.
  (1) Does netfilter (via conntracking and/or helpers) already ensure this?
  (2) If not, is there a given method in netfilter/iptables to do this?
  (3) Do I misunderstand some aspect of netfilter operations?
I can do it myself (I've pondered it sufficiently), but only if there's no 
other way.

Copious details
---------------
One premise of a firewall is to prevent unwanted conns. Duh; netfilter does 
this very well. Another premise (of abolute firewall control) is to disconnect 
unwanted existing conns. The problem I perceive is that there is no given way 
to associate a related conn to the rule that allowed it in the first place (1) 
once that related CONN becomes ESTABLISHED and (2)when neither port matches 
the rule. The problem becomes clear in the case of FTP when neither port of 
the data conn is port 20 (and the allowing rule specifies ports 20-21) and one 
uses the '-m time' facility to control when conns are allowed and prohibited.

Let me (try to) extract relevant rules from my F/W to illustrate. The rules 
should allow FTP from 2AM to 5AM on Mondays, and both reject new conns and 
shut down existing conns at all other times. The FTP helper module is loaded. 
The shutdown happens independently on each half (internal and external) of the 
conn only when the firewall receives the next packet on that half. In 
abbreviated iptables-save format:

-------------
*filter
# connmark 0x80/0x3c0 matches conns initiated from internal zones
#   to internet hosts; these marks are set in mangle. Conns from internet
#   to internal zones and conns between internal zones have different marks.
-A FORWARD -m connmark --mark 0x80/0x3c0 -j tofcScreen
-A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT 

# eth0 is the internal NIC
# eth3 is the internet NIC

# Handle incoming packets for outbound conns
-A tofcScreen -i eth3 -j tofcfwd2Int 
# Handle outgoing packets for outbound conns
-A tofcScreen -j tofcfwd2Ext

# Match outgoing packets for outbound conns
-A tofcfwd2Ext -i eth0 -p tcp -m multiport --dports 21 \
   -m time --timestart 02:00:00 --timestop 05:00:00 --weekdays Mon \
   -m state --state NEW,RELATED,ESTABLISHED -j ACCEPT
-A tofcfwd2Ext -j tofcblock 

# Match incoming packets for outbound conns
-A tofcfwd2Int -o eth0 -p tcp -m multiport --sports 21 \
   -m time --timestart 02:00:00 --timestop 05:00:00 --weekdays Mon \
   -m state --state RELATED,ESTABLISHED -j ACCEPT
-A tofcfwd2Int -j tofcblock 

# Log and reject undesired packets
-A tofcblock -j LOG --log-prefix "Denied-by-filter:tofcblock " 
# Shut down existing TCP conns.
# This works on each side of the conn independently.
-A tofcblock -p tcp -m state --state ESTABLISHED \
   -j REJECT --reject-with tcp-reset 
# Reject all other packets
-A tofcblock -j REJECT --reject-with icmp-admin-prohibited 
-------------

As I understand, RELATED refers only to the first packet of a conn related to 
an existing conn; and once a RELATED conn becomes ESTABLISHED, there is no way 
to match its packets to the original allowing rule. Have I overlooked anything 
in netfilter that would allow me to perform such matches? Does, perhaps, 
netfilter reset and/or prohibit existing conns when the 'master' conn closes 
(thus invalidating RELATED conns)?

A random neuron just fired. Are related conns transitioned to INVALID when 
their 'master' conns are disconnected or become invalidated?

Thanks,
Neal
