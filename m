From: Dave Barnum <dave@leaplab.com>
Subject: Making a Bridging firewall
Date: Mon, 12 Apr 2004 10:30:34 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <407AD23A.3030905@leaplab.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hello.. I've been wanting to rewrite my firewall for a little bit but 
i'm not that familiar with iptables..  Up until now i've had a shorewall 
based firewall that also did bridging between my gateway and a VPN 
gateway over the internet (to link our houses.)  I used the bridge-nf 
patch on the 2.4 kernel to be able to manage the bridge traffic and 
block certain broadcast packets (like DHCP)  I've now upgraded to the 
2.6 kernel because i heard it may fix some other issues i was having but 
now my bridge (DHCP blocking) rules no longer work... I'd like to get 
rid of shorewall and write my own IPTables in the hopes that i could get 
my ability to control the bridge back.  Can anyone make any suggestions, 
or point to a guide that does this with the 2.6 kernel?

Thanks


