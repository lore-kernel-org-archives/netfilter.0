From: Itrat Rasod Quadri <iquadri@ccse.kfupm.edu.sa>
Subject: bidirectional forwarding
Date: Wed, 28 Jul 2004 04:20:53 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1090977653.4106ff750c48a@webmail.ccse.kfupm.edu.sa>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Hello,

I have setup linux routers as shown below

PC1               R1           R2           R3           R4            PC2
|---------------|   |-------|    |--------|   |--------|   |-----------|
192.168.10.2   .1  12.1    12.2 13.1     13.2 16.1    16.2 11.1       11.2
e0             e0   e1     e0   e1        e0  e1       e0  e1          e0

I am able to send traffic from PC1 to PC2 but I am unable to receive the 
response beyond R3. I am able to set up a bi directional path from R1 to R4 
but unbelievably I can't seem to do the same for PC1 and PC2. Response from a 
ping from PC2 doesn't go beyond e0 of R3.

I have the following settings at R3

iptables -F
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -A INPUT -i eth0 -d 192.168.11.2 -j ACCEPT
iptables -A FORWARD -i eth0 -d 192.168.11.2 -j ACCEPT
iptables -A OUTPUT -o eth1 -d 192.168.11.2 -j ACCEPT
iptables -A INPUT -i eth1 -d 192.168.10.2 -j ACCEPT
iptables -A FORWARD -i eth1 -d 192.168.10.2 -j ACCEPT
iptables -A OUTPUT -i eth0 -d 192.168.10.2 -j ACCEPT

I have set the default route as

route add default gw 192.168.16.2 dev eth1

Using tcpdump I can see the ping response at eth1 of R3 but it doesn't go 
beyond that. I tried to add another default route for eth0 as

route add default gw 192.168.13.1 dev eth0

but then the traffic from PC1 doesn't go beyond eth0. Any help will be most 
welcome.

Thanks in advance.

