From: Joe <joeja@mindspring.com>
Subject: question on the nat table and iptables && REDIRECT
Date: Sun, 22 Sep 2002 22:38:55 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3D8EA8EF.60909@mindspring.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: netfilter@lists.netfilter.org

Hello,
    I am trying to get the redirect to work for use with squid. I know 
that squid is working, but it seems that nothing from the local machine 
is going through the nat PREROUTING table.  

    1) how do the tables interact with each other?  i.e. if a rule in 
the FILTER table is processed is that the end of it or does it make its 
way through the NAT and MANGLE tables as well?

    2) is there some reason that the POSTROUTING filter of the NAT  
shows data going through it but the  PREROUTING does not?  How does the 
PRE, POST and OUTPUT relate to each other?  According to what I read the 
packets should all go through the PRE, but this does not seem to be the 
case.

output of iptables -L -v -t nat
#######################################
 Chain PREROUTING (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               
destination        
    0     0 ACCEPT     all  --  ppp0   any     anywhere             
anywhere           state RELATED,ESTABLISHED
    1    48 ACCEPT     all  --  !ppp0  any     anywhere             
anywhere          
    0     0 LOG        all  --  any    any     anywhere             
anywhere           limit: avg 3/hour burst 5 LOG level warning prefix 
`nat: PREROUTED -> unknown: '

Chain POSTROUTING (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               
destination        
    3   136 MASQUERADE  all  --  any    ppp0    anywhere             
anywhere          
    0     0 ACCEPT     all  --  any    !ppp0   anywhere             
anywhere          
    0     0 LOG        all  --  any    any     anywhere             
anywhere           limit: avg 3/hour burst 5 LOG level warning prefix 
`nat: POSTROUTED unknown: '

Chain OUTPUT (policy ACCEPT 2 packets, 88 bytes)
#######################################




