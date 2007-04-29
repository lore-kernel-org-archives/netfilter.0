From: "Neil Aggarwal" <neil@JAMMConsulting.com>
Subject: Port forwarding not working
Date: Sat, 28 Apr 2007 22:15:33 -0500
Message-ID: <000001c78a0c$a7b02cd0$dededede@neilhp>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello:

I have a Linux box acting as a firewall and gateway
for my local internet.  The private IP is 192.168.1.1

Behind that, I have a Linksys VPN box.  Its IP
is 192.168.1.101.

If I go to my Linux box and issue this command:

telnet 192.168.1.101 1723

I get this output:

Trying 192.168.1.101...
Connected to 192.168.1.101 (192.168.1.101).
Escape character is '^]'.

Everything is fine.  I can connect to the Linksys box
without a problem.

Now, I want to set up routing from the external world
to be able to access the Linksys box.

I added this rule to my firewall to do the forwarding:

/sbin/iptables -t nat -A PREROUTING -p tcp -i eth0 -d $ETH0_IP 
	--sport 1024: --dport 1723 
	-j DNAT --to $LINKSYS_VPN_IP:1723

It is all one one line, I added link breaks for readability.

When I tried to telnet to port 1723 on my public IP, I saw logs
from my firewall for inbound packets so I added these rules:

/sbin/iptables -A FORWARD -i eth0 -o eth1 -d $LINKSYS_VPN_IP 
	-p tcp --sport 1024: --dport 1723 
	-m state --state NEW,ESTABLISHED -j ACCEPT
/sbin/iptables -t nat -A POSTROUTING -o eth1 -d $LINKSYS_VPN_IP 
	-p tcp --sport 1024: --dport 1723 
	-m state --state NEW,ESTABLISHED -j ACCEPT

But, I am not seeing any logs for the outbound packets from
the Linksys box and the telnet session from the remore computer
is not connecting.  

Any ideas what is going on?

Thanks,
	Neil


--
Neil Aggarwal, (832)245-7314, www.JAMMConsulting.com
FREE! Eliminate junk email and reclaim your inbox.
Visit http://www.spammilter.com for details.


