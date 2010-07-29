From: "Timothy Hayes" <morphieus@earthlink.net>
Subject: SNAT - on bridge only addressing some packets?
Date: Thu, 29 Jul 2010 12:37:25 -0700
Message-ID: <006601cb2f55$790557b0$6b100710$@net>
References: <1ef54a181001150733r5b688d27x3feaf7d4cc25128d@mail.gmail.com> <4B50959F.4040207@solutti.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4B50959F.4040207@solutti.com.br>
Content-Language: en-us
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 
Cc: netfilter@vger.kernel.org

First I only casually use net filter normally, and never before in with a bridged configuration so I apologize for any missing details.

What I need to do is have each connection from one box on the local side of the bridge to appear to come from different IP's the system currently. As I've stated the system that I've been told to enact these changes on appears to be a transparent bridge configuration.

The bridge is currently running ubuntu 9.04
2.6.28-19-server #61-Ubuntu SMP Thu May 27 00:22:27 UTC 2010 x86_64 GNU/Linux
An outsourced vendor is using shorewall version 4.0.15 for fw managment.
the virtual bridge interface is br0
the external interface is eth0
the internal interface is eth2
The sourcehost appears to have a router external to the bridge as it's default gw.

I've been trying a rule similar to:
iptables -t nat -A POSTROUTING -o br0 -p tcp -s <unnated source host> -d <external webhost> -j SNAT --to-source <natted sourcehost>


What I see off of bridge using "tcpdump -ni eth0 host <external webhost>"


listening on eth0, link-type EN10MB (Ethernet), capture size 96 bytes
12:21:26.149511 IP <natted sourcehost>.3387 > <external webhost>.www: S 1222579102:1222579102(0) win 65535 <mss 1460,nop,nop,sackOK>
12:21:26.233964 IP <external webhost>.www > <natted sourcehost>.3387: S 350740345:350740345(0) ack 1222579103 win 5840 <mss 1460,nop,nop,sackOK>
12:21:26.234005 IP <external webhost>.www > <unnated sourcehost>.3387: S 350740345:350740345(0) ack 1222579103 win 5840 <mss 1460,nop,nop,sackOK>
12:21:26.234082 IP <external webhost>.www > <unnated sourcehost>.3387: S 350740345:350740345(0) ack 1222579103 win 5840 <mss 1460,nop,nop,sackOK>
12:21:29.104834 IP <natted sourcehost>.3387 > <external webhost>.www: S 1222579102:1222579102(0) win 65535 <mss 1460,nop,nop,sackOK>
12:21:29.189434 IP <external webhost>.www > <natted sourcehost>.3387: S 350740345:350740345(0) ack 1222579103 win 5840 <mss 1460,nop,nop,sackOK>
12:21:29.189459 IP <external webhost>.www > <unnated sourcehost>.3387: S 350740345:350740345(0) ack 1222579103 win 5840 <mss 1460,nop,nop,sackOK>
12:21:29.189499 IP <external webhost>.www > <unnated sourcehost>.3387: S 350740345:350740345(0) ack 1222579103 win 5840 <mss 1460,nop,nop,sackOK>
12:21:29.231507 IP <external webhost>.www > <natted sourcehost>.3387: S 350740345:350740345(0) ack 1222579103 win 5840 <mss 1460,nop,nop,sackOK>
12:21:29.231529 IP <external webhost>.www > <unnated sourcehost>.3387: S 350740345:350740345(0) ack 1222579103 win 5840 <mss 1460,nop,nop,sackOK>
12:21:29.231568 IP <external webhost>.www > <unnated sourcehost>.3387: S 350740345:350740345(0) ack 1222579103 win 5840 <mss 1460,nop,nop,sackOK>
12:21:35.121142 IP <natted sourcehost>.3387 > <external webhost>.www: S 1222579102:1222579102(0) win 65535 <mss 1460,nop,nop,sackOK>
12:21:35.205294 IP <external webhost>.www > <natted sourcehost>.3387: S 350740345:350740345(0) ack 1222579103 win 5840 <mss 1460,nop,nop,sackOK>
12:21:35.205324 IP <external webhost>.www > <unnated sourcehost>.3387: S 350740345:350740345(0) ack 1222579103 win 5840 <mss 1460,nop,nop,sackOK>
12:21:35.205363 IP <external webhost>.www > <unnated sourcehost>.3387: S 350740345:350740345(0) ack 1222579103 win 5840 <mss 1460,nop,nop,sackOK>
12:21:35.234786 IP <external webhost>.www > <natted sourcehost>.3387: S 350740345:350740345(0) ack 1222579103 win 5840 <mss 1460,nop,nop,sackOK>
12:21:35.234807 IP <external webhost>.www > <unnated sourcehost>.3387: S 350740345:350740345(0) ack 1222579103 win 5840 <mss 1460,nop,nop,sackOK>
12:21:35.234847 IP <external webhost>.www > <unnated sourcehost>.3387: S 350740345:350740345(0) ack 1222579103 win 5840 <mss 1460,nop,nop,sackOK>

I did turn on ip forwarding by doing:
echo 1 > /proc/sys/net/ipv4/ip_forward

The firewall does appear to have all the rules needed to track the connections?
user@system:/home/user# cat base.fwr1 | grep ESTABLISHED
-A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
-A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
-A OUTPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
-A all2fw -m state --state RELATED,ESTABLISHED -j ACCEPT
-A all2loc -m state --state RELATED,ESTABLISHED -j ACCEPT
-A all2net -m state --state RELATED,ESTABLISHED -j ACCEPT
-A all2world -m state --state RELATED,ESTABLISHED -j ACCEPT
-A fw2world -m state --state RELATED,ESTABLISHED -j ACCEPT
-A loc2fw -m state --state RELATED,ESTABLISHED -j ACCEPT
-A loc2net -m state --state RELATED,ESTABLISHED -j ACCEPT
-A loc2world -m state --state RELATED,ESTABLISHED -j ACCEPT
-A net2fw -m state --state RELATED,ESTABLISHED -j ACCEPT
-A net2loc -m state --state RELATED,ESTABLISHED -j ACCEPT
-A net2world -m state --state RELATED,ESTABLISHED -j ACCEPT
-A world2all -m state --state RELATED,ESTABLISHED -j ACCEPT
-A world2fw -m state --state RELATED,ESTABLISHED -j ACCEPT
-A world2loc -m state --state RELATED,ESTABLISHED -j ACCEPT

Any help would be greatly appreciated.




