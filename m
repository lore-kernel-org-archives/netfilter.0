From: Romeo Theriault <romeo.theriault@maine.edu>
Subject: iptables with ssh and vnc
Date: Mon, 28 Nov 2005 15:24:43 -0500
Message-ID: <0A6FFB31-EABB-4616-9FCE-DADE1F7F171D@maine.edu>
Mime-Version: 1.0 (Apple Message framework v746.2)
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
Content-Type: text/plain; charset="us-ascii"; delsp="yes"; format="flowed"
To: netfilter@lists.netfilter.org

Hi, I'm not sure if this is the right place to ask this question but  
since iptables is involved I thought I'd give it a shot.

I have a linux box with an openssh and vnc server running on it. With  
my custom iptables firewall turned off I can tunnel vnc through ssh  
and connect to it just fine with a command like this.

ssh -L 5902:130.111.68.179:5901 admin@130.111.68.179

I then can fire up my vnc server and from my machine do a vncviewer  
localhost:2 and I get the vncserver.

This works fine until I started using iptables. I know it's because  
I'm not familiar with iptables and how to set it up correctly but I'm  
hoping someone will be able to help me a bit with this.

Now is I do the same thing with iptables turned on I get this error  
on the server side:
channel 3: open failed: connect failed: Connection refused

and this one on the client side:
VNC server closed connection

here is my iptables shell script.
#!/bin/bash
#
if [ ! -x /sbin/iptables ]; then
exit 0
fi

start()
{
echo "IPTables being started..."
# clear all
clearall

#start of iptables
#always allow ssh from my work box
iptables -A INPUT -s workstation -d server -p tcp --dport 22 -j ACCEPT
iptables -A INPUT -s workstation -d server -p tcp --dport 22 -j ACCEPT
iptables -A INPUT -s workstation -d server -p tcp --dport 22 -j ACCEPT
iptables -A INPUT -s workstation -d server -p tcp --dport 22 -j ACCEPT

#this will allow the standart tcp 3 way handshake and allow all  
outgoing traffic.
iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -i eth0 -m state --state RELATED,ESTABLISHED -j  
ACCEPT
iptables -A OUTPUT -m state --state NEW,RELATED,ESTABLISHED -j ACCEPT

#this will allow http on port 80
iptables -A INPUT -s workstation -d server -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -s workstation -d server -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -d server -p tcp --dport 80 -j ACCEPT

#this will allow samba traffic on the local network
iptables -A INPUT -p udp -m udp -s network/24 --dport 137 -j ACCEPT
iptables -A INPUT -p udp -m udp -s network/24 --dport 138 -j ACCEPT
iptables -A INPUT -m state --state NEW -m tcp -p tcp -s network/24 -- 
dport 139 -j ACCEPT
iptables -A INPUT -m state --state NEW -m tcp -p tcp -s network/24 -- 
dport 445 -j ACCEPT

iptables -A INPUT -p udp -m udp -s network/23 --dport 137 -j ACCEPT
iptables -A INPUT -p udp -m udp -s network/23 --dport 138 -j ACCEPT
iptables -A INPUT -m state --state NEW -m tcp -p tcp -s network/23 -- 
dport 139 -j ACCEPT
iptables -A INPUT -m state --state NEW -m tcp -p tcp -s network/23 -- 
dport 445 -j ACCEPT

iptables -A INPUT -p udp -m udp -s network/23 --dport 137 -j ACCEPT
iptables -A INPUT -p udp -m udp -s network/23 --dport 138 -j ACCEPT
iptables -A INPUT -m state --state NEW -m tcp -p tcp -s network/23 -- 
dport 139 -j ACCEPT
iptables -A INPUT -m state --state NEW -m tcp -p tcp -s network/23 -- 
dport 445 -j ACCEPT


#allow any traffic from localhost
iptables -A INPUT -d server -s 127.0.0.1 -j ACCEPT

#allow ICMP/Ping
iptables -A INPUT -d server -p icmp -j ACCEPT

#reject everything else to this ip:
iptables -A INPUT -d server -j REJECT

#reject everything else coming through to any ip:
iptables -A INPUT -j REJECT
iptables -A FORWARD -j REJECT



echo "IPTables started successfully..."

}

clearall()
{
iptables -F
iptables -X
echo "IPTables being cleared..."
}


case "$1" in
restart|start)
start
;;
stop)
clearall
;;
*)
echo "Usage: $0 {start|stop|restart}"
exit 1
esac

exit 0


Thank you,

Romeo Theriault



