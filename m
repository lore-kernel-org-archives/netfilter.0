From: Arnt Karlsen <arnt@c2i.net>
Subject: ..multiple vpn/ipsec/pptp tunnels, bottlenecks?
Date: Fri, 6 Dec 2002 06:55:18 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021206065518.3c752d40.arnt@c2i.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: netfilter@lists.netfilter.org
Cc: Tom Eastep <teastep@shorewall.net>


..in http://shorewall.net/VPN.htm below the figure, Tom says:  "If PPTP
is being used, there are no firewall requirements beyond the default
loc->net ACCEPT policy. There is one restriction however: Only one local
system at a time can be connected to a single remote gateway unless you
patch your kernel from the 'Patch-o-matic' patches available at
http://www.netfilter.org. "

..my scenario is use "the left half" of
http://www.shorewall.net/images/TwoNets1.png "to bypass _dumb_ and
cheap 802.11b and router boxes limited to 256 simultaneous tcp/ip 
connections, by making my isp client's 802.11x clients connect thru 
vpn or pptp etc tunnels to the box I set up, "a vpn gateway where 
each tunnel receives a random public IP from the public IP pool and 
use that to access internet thru the vpn gateway". 

..the modification to "the left half of 
http://www.shorewall.net/images/TwoNets1.png ", 
"is essentially 192.168.0.0/16", and "strip off all fat".  
(I'll possibly also do bandwidth trottling in this box, not 
essential, we can carry on doing that in our throttle box.)

..traffic, initially "they haul in tons of CD and games" etc, later,
this settles to an average about 50kbps for each 802.11 client, the
weak spot is shooting yourself down on exceeding our radio nodes 256
connections, timing those out and autoresetting the gear, which is 
why we will pack all traffic into vpn-like tunnels. 

..pptp is suggested as some of clients still runs wintendo95 and becomes
the low end securitywise, as pptp is free (zero cost) for all os'es and
because my isp client sez "it's their ass, not mine, until they start
paying me to look after their butts".  ;-)

..bottlenecks to look out for?  I can tunnel traffic to and from 
say 600 people at 400kbps each thru one single Duron 1GHz box with 
2 ea 100Mbps wires?    

-- 
..med vennlig hilsen = with Kind Regards from Arnt... ;-)
...with a number of polar bear hunters in his ancestry...
  Scenarios always come in sets of three: 
  best case, worst case, and just in case.


