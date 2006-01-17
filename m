From: Matteo Manzinello <mmanzinello@yahoo.it>
Subject: VNC and two firewall
Date: Tue, 17 Jan 2006 22:24:16 +0100
Message-ID: <43CD6080.2070003@yahoo.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hello,
In a LAN I need to connect remotly with VNC to a client computer with 
Windows OS. The problem is that there are two firewalls or better one is 
a modem/router zyxel and then there is firewall on a server Linux (that 
it is used as backup file and mail server and other services) and after 
that there are the PC clients of the LAN:
INTERNET (WAN) -- ZYXEL/FIREWALL -- LINUX FIREWALL -- PC LAN
About the modem/router Zyxel I noticed that there are sets called "SUA" 
where you can set the IP and the port where to connect VNC. But the 
problems is with Linux in a generic LAN. Where I have a Linux machine 
connect to Internet I have these rules:
iptables -t nat -A PREROUTING -i ippp0 -p tcp -m tcp --dport 5900 -j 
DNAT --to-destination 192.168.0.2:5900
iptables -A FORWARD -i ippp0 -p tcp --dport 5900 -m state  --state 
NEW,ESTABLISHED -j ACCEPT

so everything works. Do you think it is enought to leave open the ports 
of the Firework Zyxel (5900) and then to set the rules with iptables on 
Linux?

Thanks a lot!
Take care

