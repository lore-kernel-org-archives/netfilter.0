From: "G.Laxman" <laxman@oxynetworks.com>
Subject: Port Forwarding........Help
Date: Wed, 24 Dec 2003 15:47:39 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <6.0.1.1.0.20031224153752.01e905d0@mail.oxynetworks.com>
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

Hi,

I have configured IP Tables 1.2.6 on RH Linux 8.0. Working nice.....


I have local system which is running Apache WebServer on Solaris... its ip 
Address is 192.168.1.10
I have configured DNS and Gateway for this system.....From This system I 
can connect to the Internet ( Ping,nslookup,ssh..etc)

My problem is......


          eth1      ||Linux Firewall|| 
eth0-------------------------->  ||solaris machine (web server)||
         (61.11.10.11)              (192.168.1.1)                   ( 
192.168.1.10)


Here I have one more public IP . ..ie. 61.11.10.12.. I need to map this 
IP  61.11.10.12 to 192.168.1.10
and I want to allow only 80 port of 192.168.1.10 machine....... (Only web 
request)

I have tried the following command........but not working......

iptables -t nat -A PREROUTING -p tcp --dport 80 -i eth1 -s 0.0.0.0/0 -d 
61.11.10.12 -j DNAT --to 192.168.1.10:80


Please help me......

bye
Laxman




