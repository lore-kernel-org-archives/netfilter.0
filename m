From: John Holman <jaholman@eastax.com>
Subject: Accuracy of packet counting?
Date: Fri, 17 May 2002 08:32:26 +1000
Sender: netfilter-admin@lists.samba.org
Message-ID: <3CE4337A.85D8CAE1@eastax.com>
Reply-To: mail@john.holman.name
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

I would be grateful for expert opinion on a simple matter:

I am trying to reconcile the traffic charges of my ISP with my own
counts.  
I have a plain 1500/256 bridged ADSL connection (i.e. no connection
software or overhead) to eth0 on a lightly-loaded web/mail server.

My traffic counter is simply this:

#iptables -L -n -v -x
Chain INPUT (policy ACCEPT 21095 packets, 2640498 bytes)
    pkts      bytes target     prot opt in     out    
source               destination         
    9639  1817610 ACCOUNTING  all  --  eth0   *      
0.0.0.0/0            0.0.0.0/0          

Chain FORWARD (policy ACCEPT 629 packets, 262264 bytes)
    pkts      bytes target     prot opt in     out    
source               destination         

Chain OUTPUT (policy ACCEPT 20654 packets, 5383330 bytes)
    pkts      bytes target     prot opt in     out    
source               destination         
    9957  4391462 ACCOUNTING  all  --  *      eth0   
0.0.0.0/0            0.0.0.0/0          

Chain ACCOUNTING (2 references)
    pkts      bytes target     prot opt in     out    
source               destination         
   19596  6209072 RETURN     all  --  *      *      
0.0.0.0/0            0.0.0.0/0

My question:

Is there ANY reason to suppose that the ACCOUNTING total is not an
accurate count of all IP traffic into and out of eth0?

(The machine is a dual-Pentium Pro Linux box, daily traffic 20-30 MB
average, ifconfig never reports any dropped packets).

TIA, 

-- 
Best regards,
John Holman
Eastax WWW
Melbourne, Australia

