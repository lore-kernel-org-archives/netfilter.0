From: "J. Bakshi" <joydeep@infoservices.in>
Subject: how to access port forwarded server through internet ?
Date: Tue, 15 Mar 2011 17:59:28 +0530
Message-ID: <20110315175928.4dbbe83c@debian>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Dear list,

Here is a port forwarding issue.  I have a linux router which have two NIC; one facing WAN and the other facing LAN. IP forwarding is active and this box is working as a gateway. This box has LAN IP 192.168.1.1

There is another box (webserver) 192.168.1.2 within the internal network and the router box has port forwarding to access the webserver.

```````````````````````````
iptables -A INPUT -p tcp -m tcp --dport 81 -j ACCEPT
iptables -A PREROUTING -t nat -i ${LAN_IFACE} -p tcp --dport 81 -j DNAT --to 192.168.1.2:8080
iptables -A FORWARD -p tcp -m state --state NEW --dport 81 -i ${LAN_IFACE} -j ACCEPT
````````````````````````````

So within LAN I can access the 192.168.1.2 web server through  192.168.1.1:81 as port forwarding is there. But I can not access the same through internet. If I point at <domain-name>:81 throught internet ; the browser simply reports it can't connect to the service; though the other services running at that very server are quite accessible through internet. Have I missed something in my firewall rule ? Could anyone give any clue please ?

Thanks 
