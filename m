From: <joydeep@infoservices.in>
Subject: firewall cause  [ping: sendmsg: Operation not permitted]
Date: Wed, 26 Sep 2012 12:39:18 +0530
Message-ID: <20120926123918.18003d60@shiva.selfip.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello list,

I have installed a pdnsd server and trying to force all DNS request through it.
I have configure iptables to do the same as below

iptables -F
iptables -X
iptables -Z
iptables -t nat -Z 2>/dev/null
iptables -t mangle -Z
iptables -t nat -F
iptables -t mangle -F

    iptables -P INPUT DROP
    iptables -P FORWARD DROP
    iptables -P OUTPUT DROP

    # Established incoming connections are accepted.
    iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT

    # Traffic on the loopback interface is accepted.
    iptables -A INPUT -i lo -j ACCEPT

   # Established outgoing connections are accepted.
    iptables -A OUTPUT -m state --state RELATED,ESTABLISHED -j ACCEPT

    # Internal network connections are accepted.
    iptables -A OUTPUT -d 127.0.0.0/255.0.0.0 -j ACCEPT

    # Local network connections should be passed but DNS shall be
    # rejected.
    iptables -N lan
    iptables -A lan -p TCP --dport domain -j REJECT
    iptables -A lan -p UDP --dport domain -j REJECT
    iptables -A lan -j ACCEPT

   # Sort out traffic to local network
    # Note that we exclude the VirtualAddrNetwork used for .onion:s here.
    iptables -A OUTPUT -d 192.168.0.0/255.255.0.0 -j lan
    iptables -A OUTPUT -d 10.0.0.0/255.0.0.0 -j lan
    iptables -A OUTPUT -d 172.16.0.0/255.240.0.0 -j lan

iptables -t nat -A OUTPUT -p udp --dport 53 -m state --state NEW -j REDIRECT --to-ports 53
iptables -t filter -A OUTPUT -p udp -m udp --dport 53 -j ACCEPT



    # Everything else is dropped.
	iptables -t filter -A OUTPUT ! -o lan -j DROP
	

    # log incomming connection attempts
    iptables -A INPUT -p tcp -m tcp -m state --state NEW -j LOG --log-prefix "input(tcp) " -m limit --limit 1/minute 
    iptables -A INPUT ! -p tcp -j LOG --log-prefix "input(all) " -m limit --limit 1/minute

`````````````````````````````````````````````````````````````

And when try to ping gmail.com   it reports  

ping: sendmsg: Operation not permitted

I don't understand what is causing the issue. Any clue / fix please  ?

Thanks

