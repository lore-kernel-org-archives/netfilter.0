From: Mike McLean <libolt@libolt.net>
Subject: Tribes 2 server behind NAT
Date: Thu, 20 Nov 2003 17:12:55 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311201712.55636.libolt@libolt.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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

Hi,

I've got a tribes 2 linux server running behind a NAT gateway using iptables.  
I've forwarded both TCP and UDP on port 28000 to my server as follows:

iptables -t nat -A PREROUTING -i eth0 -p udp --dport 28000 -j DNAT --to 
192.168.4.7:28000
iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 28000 -j DNAT --to 
192.168.4.7:28000

When I launch the game on another box on my local network.  I see it in the 
server list with the private ip address 192.168.4.7.  However, I have someone 
outside the network trying to conenct, but my game doesn't show up in the 
server list for them.  So they are unable to connect.

I run tribes to with the following command:

tribesd2 -dedicated

Any help is appreciated,

Mike


