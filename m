From: "james.Q.L" <shijialeeee@yahoo.ca>
Subject: Re: problem reach the internal.
Date: Sat, 30 Nov 2002 03:34:02 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021130083402.3274.qmail@web14506.mail.yahoo.com>
References: <200211292120.41544.netfilter@newkirk.us>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200211292120.41544.netfilter@newkirk.us>
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
Content-Transfer-Encoding: 7bit
To: netfilter@newkirk.us, Anders Fugmann <afu@fugmann.dhs.org>
Cc: netfilter@lists.netfilter.org

the iptables counter is very neat to debug problem. i never thought of that.

found a problem that in the following ruleset i shouldn't have '-i eth1'. it blocks the internal
DNAT.

> > iptables -t nat -A PREROUTING -p tcp -i eth1 --dport 8888 \
> > 	-j DNAT --to-destination 192.168.0.3:80

i also change the order of the rule in FORWARD chain in Filter table.

the rule for filter table is:
[root@cozy166 Qiang]#iptables -L -n --line-numbers

Chain FORWARD (policy DROP)
num  target     prot opt source               destination         
1    ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0          state RELATED,ESTABLISHED 
2    ACCEPT     tcp  --  0.0.0.0/0            192.168.0.3        tcp dpt:80 
3    ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0          
4    LOG        all  --  0.0.0.0/0            0.0.0.0/0          LOG flags 0 level 4 
        
the line num 3 and num 2 are swapped.

i tried reset the counter of ruleset and make connection test to it. i found something that i
don't understand. when i am testing from an internal machine to INET_IP:8888 the ruleset for
filter table is (counter has reset to zero)

[root@cozy166 Qiang]#iptables -L -v -n --line-numbers

Chain FORWARD (policy DROP 5 packets, 224 bytes)
num   pkts bytes target     prot opt in     out     source               destination         
1    11806   15M ACCEPT     all  --  eth1   eth0    0.0.0.0/0            0.0.0.0/0          state
RELATED,ESTABLISHED 
2        3   144 ACCEPT     tcp  --  *      *       0.0.0.0/0            192.168.0.3        tcp
dpt:80 
3     8000  341K ACCEPT     all  --  eth0   eth1    0.0.0.0/0            0.0.0.0/0          
4        5   224 LOG        all  --  *      *       0.0.0.0/0            0.0.0.0/0          LOG
flags 0 level 4 

Chain OUTPUT (policy ACCEPT 13143 packets, 996K bytes)
num   pkts bytes target     prot opt in     out     source               destination         

Chain drop-and-log-it (0 references)
num   pkts bytes target     prot opt in     out     source               destination         
1        0     0 DROP       all  --  *      *       0.0.0.0/0            0.0.0.0/0   

####
noticed that the Forward chain has (policy DROP 5 packets, 224 bytes) and the line num 2 has 3
counter and 144bytes hits. it's gotta be a problem here. 
one thing i am unsure is if the counter and packet get hit means the packet get passed or
attempted to pass?  taking a look at the line num 2 ruleset, it shouldn't block proper packet tho.
2    ACCEPT     tcp  --  0.0.0.0/0            192.168.0.3        tcp dpt:80 

another thing i'm unsure is the POSTROUTING and PREROUTING both have two hits and packet records.
so this seems to say the packet got back from the webserver. but if the FORWARD chain drops the
packet there, the POSTROUTING shouldn't have anything..

[root@cozy166 Qiang]#iptables -L -v -n -t nat --line-numbers
Chain PREROUTING (policy ACCEPT 146 packets, 10341 bytes)
num   pkts bytes target     prot opt in     out     source               destination         
1        4   192 DNAT       tcp  --  *      *       0.0.0.0/0            65.48.28.33        tcp
dpt:8888 to:192.168.0.3:80 

Chain POSTROUTING (policy ACCEPT 1 packets, 249 bytes)
num   pkts bytes target     prot opt in     out     source               destination         
1        4   192 SNAT       tcp  --  *      *       192.168.0.0/24       192.168.0.3        tcp
dpt:80 to:192.168.0.1 
2       51  2866 MASQUERADE  all  --  *      eth1    0.0.0.0/0            0.0.0.0/0          

Chain OUTPUT (policy ACCEPT 79573 packets, 5705K bytes)
num   pkts bytes target     prot opt in     out     source               destination

James.Q.L

=====
/James.Q.L

______________________________________________________________________ 
Post your free ad now! http://personals.yahoo.ca

