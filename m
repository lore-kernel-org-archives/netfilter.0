From: Evan Harper <elh1@sympatico.ca>
Subject: Can't get port forwarding DNAT to work
Date: Sun, 07 Dec 2003 20:14:44 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3FD3D084.7060206@sympatico.ca>
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

I have a few machines on a LAN connected to the internet via a gateway 
server with a DSL connection. I have packet filtering and IP masq up and 
running with no problems -- the internal machines can connect out to the 
Internet and everything is good. However I've been trying for a while 
now to forward port 25 to a mail server inside the LAN with absolutely 
no luck. The relevant rc.firewall line is:

iptables -t nat -A PREROUTING -i ppp0 -p tcp --dport 25 -j DNAT --to 
192.168.0.4:25
# forward smtp traffic to mail server

Everything looks normal except that packets sent from outside the 
network to port 25 just fall into a black hole. I've fiddled with the 
options for a while, changing nothing. Help would be much appreciated.

Evan Harper


