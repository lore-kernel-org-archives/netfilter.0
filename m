From: marc pascual <marcpascual@yahoo.com>
Subject: iptables/nat/others problem
Date: Fri, 9 Jun 2006 08:33:24 -0700 (PDT)
Message-ID: <20060609153324.57289.qmail@web34313.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

hello all. my friend's network has a lotus domino
server having both a public ip and a lan ip. he asked
me to setup a linux firewall and put the lotus domino
server behind it, while maintaining accessibility from
the outside via port forwarding.

the domino server's public ip is xxx.xxx.103.29 and
its LAN ip is 10.10.0.1. the firewall's public ip is
xxx.xxx.103.26 and its LAN ip is 10.10.0.50. i issued
a couple of iptables command like this:

# iptables -t nat -A POSTROUTING -o eth0 -j SNAT
--to-source xxx.xxx.103.26
# iptables -t nat -A PREROUTING -i eth0 -p tcp -d
xxx.xxx.103.26 --dport 80 -j DNAT --to-destination
10.10.0.1:80

i fired up a web browser (from another public ip) to
http://xxx.xxx.103.26 and it timed out. there is
another box on the lan, 10.10.0.3, but this has no
public ip. it has port 80 open (smc wireless network
manager web interface), and i thought i can use it for
testing.

# iptables -t nat -A POSTROUTING -o eth0 -j SNAT
--to-source xxx.xxx.103.26
# iptables -t nat -A PREROUTING -i eth0 -p tcp -d
xxx.xxx.103.26 --dport 80 -j DNAT --to-destination
10.10.0.3:80

fired up a browser and it connected successfully. this
time i thought that the problem is beyond my iptables
syntax. i nmapped both public ip's, and i noticed
something.

[root@localhost ~]# nmap xxx.xxx.103.26
22/tcp   open     ssh
25/tcp   filtered smtp
135/tcp  filtered msrpc
136/tcp  filtered profile
137/tcp  filtered netbios-ns
138/tcp  filtered netbios-dgm
139/tcp  filtered netbios-ssn
445/tcp  filtered microsoft-ds
1080/tcp filtered socks
1720/tcp filtered H.323/Q.931
6112/tcp filtered dtspc

this is kinda odd since the firewall is running linux,
and the only open port on it is 22.

[root@localhost ~]# nmap xxx.xxx.103.29
25/tcp   filtered smtp
80/tcp   open     http
135/tcp  filtered msrpc
136/tcp  filtered profile
137/tcp  filtered netbios-ns
138/tcp  filtered netbios-dgm
139/tcp  filtered netbios-ssn
445/tcp  filtered microsoft-ds
1027/tcp open     IIS
1080/tcp filtered socks
1352/tcp open     lotusnotes
1720/tcp filtered H.323/Q.931
2105/tcp open     eklogin
3389/tcp open     ms-term-serv

looking from the outside (internet), the domino server
has the 'filtered' ports just like the firewall. the
only thing similar to both of them is the gateway ip.
here's the gateway's nmap result:

[root@localhost ~]# nmap xxx.xxx.103.25
25/tcp   filtered smtp
135/tcp  filtered msrpc
136/tcp  filtered profile
137/tcp  filtered netbios-ns
138/tcp  filtered netbios-dgm
139/tcp  filtered netbios-ssn
445/tcp  filtered microsoft-ds
1080/tcp filtered socks
1720/tcp filtered H.323/Q.931


i could be wrong with my conclusion that the gateway
has something to do with the firewall not being able
to do port-forwarding on computers with both public
and private interfaces (with the public interface
passing thru the gateway). at first i thought it was
safe to leave the public ip on the domino server
running since i was at the stage of 'seeing if stuff
works' then. but still i admit i lack a lot of
knowledge in ip/packet filtering and i need advice as
much as i can get.

questions:
1. is it safe to say that if i turn off the public
interface on the domino server, run services on the
lan scope, and do port forwarding from the gateway,
this specific problem will go away?

2. what could be the exact reason why i cant do
port-forwarding to the domino's lan ip while the
public ip is active? why can i do port forwarding on
the smc server (not on any public ip) and
localhost(firewall), but not on a computer within the
lan with public ip?

3. all of my assumptions could be wrong. based on my
statements, what do you think is the problem?

im sorry for the long post, thanks a lot in advance.



__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam
protection around 
http://mail.yahoo.com 

__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 

