From: =?iso-8859-15?Q?Mart=EDn?= <martin@familia-fiumara.com.ar>
Subject: Configuration question...
Date: Mon, 03 Nov 2003 01:47:55 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <oprx1ox5f3pvmot6@192.168.2.1>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

This is the situation:

I hace a linux machine, giving internet access to a win98 machine. The 
win98 machine has a soft wich does not accept NAT, so the soft does not 
work when has to connect to internet.
Linux: eth0 (wich is conected to the adsl modem > ppp0 ) 192.168.1.10
       eth1 (interface conected to the LAN, IP 192.168.2.1)

Win98: IP 192.168.2.5

What I need to do is: make the win98 software believe that it is connecting 
to a server service in the linux machine to port 10329, and that traffic 
has to be redirected to an external Ip in internet (the real server with 
the service in port 10329). And the, the traffic comeing fron that server 
has to be redirected to the win98 machine but with the source IP changed to 
192.168.2.1 (the internal IP of the linux)

Can tell me the comands to configure the linux and iptables to do this?
Thanks
       

