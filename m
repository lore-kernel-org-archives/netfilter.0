From: Bernardo Vieira <bernardo.vieira@terra.com.br>
Subject: Newbie iptables question
Date: Thu, 09 Dec 2004 13:47:28 -0200
Message-ID: <41B87390.3080501@terra.com.br>
Mime-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Netfilter <netfilter@lists.netfilter.org>

Hi all,
Sorry for the lame post but I'm really stuck with this and got nowhere 
to turn. Anyway, here's my problem:
I need to close all external traffic (eth0:0)  to my server from execpt 
on a few ports (smtp, http, ping, echo, etc) and for my local network I 
need, in addition to those ports,  SMB. So, as a test I came up with the 
following tables (for now I'm allowing all local traffic):


Chain INPUT (policy DROP 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               
destination        
15521 3812K ACCEPT     all  --  !eth0:0 *      !192.168.1.3         
!192.168.1.3       
    0     0 ACCEPT     tcp  --  *      *       0.0.0.0/0            
0.0.0.0/0          tcp flags:0x10/0x10
    0     0 ACCEPT     all  --  *      *       0.0.0.0/0            
0.0.0.0/0          state ESTABLISHED
    0     0 ACCEPT     all  --  *      *       0.0.0.0/0            
0.0.0.0/0          state RELATED
    0     0 ACCEPT     udp  --  *      *       0.0.0.0/0            
0.0.0.0/0          udp spt:53 dpts:1024:65535
    0     0 ACCEPT     icmp --  *      *       0.0.0.0/0            
0.0.0.0/0          icmp type 0
    0     0 ACCEPT     icmp --  *      *       0.0.0.0/0            
0.0.0.0/0          icmp type 3
    0     0 ACCEPT     icmp --  *      *       0.0.0.0/0            
0.0.0.0/0          icmp type 4
    0     0 ACCEPT     icmp --  *      *       0.0.0.0/0            
0.0.0.0/0          icmp type 11
    0     0 ACCEPT     icmp --  *      *       0.0.0.0/0            
0.0.0.0/0          icmp type 12
    0     0 ACCEPT     tcp  --  *      *       0.0.0.0/0            
0.0.0.0/0          tcp dpt:22
    0     0 ACCEPT     tcp  --  *      *       0.0.0.0/0            
0.0.0.0/0          tcp dpt:113
    0     0 ACCEPT     tcp  --  *      *       0.0.0.0/0            
0.0.0.0/0          tcp dpt:25
    0     0 ACCEPT     tcp  --  *      *       0.0.0.0/0            
0.0.0.0/0          tcp dpt:80
    0     0 ACCEPT     tcp  --  *      *       0.0.0.0/0            
0.0.0.0/0          tcp dpt:10000
    0     0 SMB        all  --  *      *       192.168.1.0/24       
192.168.1.0/24    

Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               
destination        
    0     0 SMB        all  --  *      *       0.0.0.0/0            
0.0.0.0/0         

Chain OUTPUT (policy ACCEPT 20416 packets, 20M bytes)
 pkts bytes target     prot opt in     out     source               
destination        
15938   16M SMB        all  --  *      *       192.168.1.0/24       
192.168.1.0/24    

Chain SMB (3 references)
 pkts bytes target     prot opt in     out     source               
destination        
   10  1111 ACCEPT     tcp  --  *      *      !192.168.1.3         
!192.168.1.3        tcp multiport dports 135,136,137,138,139,445
    4   499 ACCEPT     udp  --  *      *      !192.168.1.3         
!192.168.1.3        udp multiport sports 135,136,137,138,139,445

However, when I run a portscan I get the following, I'm particularly 
worried about ports 139 and 3306 being open:

21           ftp       File Transfer [Control]                      
22           ssh       Secure Shell Login                           
25          smtp       Simple Mail Transfer                         
37          time       timserver                                    
80          http       World Wide Web HTTP                          
111        sunrpc      portmapper, rpcbind                          
139      netbios-ssn   NETBIOS Session Service                      
143         imap2      Interim Mail Access Protocol v2              
443         https      secure http (SSL)                            
587      submission    -                                            
3306        mysql      mySQL                                        
10000 snet-sensor-mgmt SecureNet Pro Sensor https management server 

Can anyone shed some light on this?

Thanx.




---
avast! Antivirus: Outbound message clean.
Virus Database (VPS): 0450-1, 09/12/2004
Tested on: 9/12/2004 13:47:30
avast! - copyright (c) 2000-2004 ALWIL Software.
http://www.avast.com




