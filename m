From: vykupitel@volny.cz
Subject: I need
Date: Sat, 21 Feb 2004 19:55:30 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3f6e4560a02076078ccbb3f799a53e7c@www3.mail.volny.cz>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello,
I have in my LAN(10.0.0.x) one computer(192.168.1.253) behind
simply masquerade. I need to mount a NFS exported directory on
computer in my LAN(10.0.0.7). I'm just thinking about doing some
port forward or something like this,but I have no experince with
that. I just need some advice how to do it. I did some experiment
with DNAT and NAT but with no succes. My iptables -L:
Chain INPUT (policy DROP)
target     prot opt source               destination         
ACCEPT     all  --  anywhere             anywhere           
eth0_in    all  --  anywhere             anywhere           
eth1_in    all  --  anywhere             anywhere           
ACCEPT     all  --  anywhere             anywhere           

Chain FORWARD (policy DROP)
target     prot opt source               destination         
eth0_fwd   all  --  anywhere             anywhere           
eth1_fwd   all  --  anywhere             anywhere           
ACCEPT     all  --  anywhere             anywhere           

Chain OUTPUT (policy DROP)
target     prot opt source               destination         
ACCEPT     all  --  anywhere             anywhere           
ACCEPT     icmp --  anywhere             anywhere           
fw2net     all  --  anywhere             anywhere           
fw2masq    all  --  anywhere             anywhere           
ACCEPT     all  --  anywhere             anywhere           

Chain all2all (12 references)
target     prot opt source               destination         
ACCEPT     all  --  anywhere             anywhere           state
RELATED,ESTABLISHED  newnotsyn  tcp  --  anywhere            
anywhere           state NEW tcp flags:!SYN,RST,ACK/SYN  ACCEPT  
  all  --  anywhere             anywhere           

Chain common (0 references)
target     prot opt source               destination         
icmpdef    icmp --  anywhere             anywhere           
DROP       tcp  --  anywhere             anywhere           state
INVALID  REJECT     udp  --  anywhere             anywhere       
   udp dpts:netbios-ns:netbios-ssn reject-with
icmp-port-unreachable  REJECT     udp  --  anywhere            
anywhere           udp dpt:microsoft-ds reject-with
icmp-port-unreachable  reject     tcp  --  anywhere            
anywhere           tcp dpt:135  DROP       udp  --  anywhere     
       anywhere           udp dpt:1900  DROP       all  -- 
anywhere             255.255.255.255    
DROP       all  --  anywhere             BASE-ADDRESS.MCAST.NET/4
reject     tcp  --  anywhere             anywhere           tcp
dpt:auth  DROP       all  --  anywhere             10.0.0.255    
    
DROP       all  --  anywhere             192.168.1.255      

Chain dynamic (4 references)
target     prot opt source               destination         

Chain eth0_fwd (1 references)
target     prot opt source               destination         
dynamic    all  --  anywhere             anywhere           
net2masq   all  --  anywhere             anywhere           

Chain eth0_in (1 references)
target     prot opt source               destination         
dynamic    all  --  anywhere             anywhere           
net2fw     all  --  anywhere             anywhere           

Chain eth1_fwd (1 references)
target     prot opt source               destination         
dynamic    all  --  anywhere             anywhere           
masq2net   all  --  anywhere             anywhere           

Chain eth1_in (1 references)
target     prot opt source               destination         
dynamic    all  --  anywhere             anywhere           
masq2fw    all  --  anywhere             anywhere           

Chain fw2loc (0 references)
target     prot opt source               destination         
ACCEPT     all  --  anywhere             anywhere           state
RELATED,ESTABLISHED  newnotsyn  tcp  --  anywhere            
anywhere           state NEW tcp flags:!SYN,RST,ACK/SYN  ACCEPT  
  all  --  anywhere             anywhere           state NEW 
all2all    all  --  anywhere             anywhere           

Chain fw2masq (1 references)
target     prot opt source               destination         
ACCEPT     all  --  anywhere             anywhere           state
RELATED,ESTABLISHED  newnotsyn  tcp  --  anywhere            
anywhere           state NEW tcp flags:!SYN,RST,ACK/SYN  ACCEPT  
  all  --  anywhere             anywhere           state NEW 
all2all    all  --  anywhere             anywhere           

Chain fw2net (1 references)
target     prot opt source               destination         
ACCEPT     all  --  anywhere             anywhere           state
RELATED,ESTABLISHED  newnotsyn  tcp  --  anywhere            
anywhere           state NEW tcp flags:!SYN,RST,ACK/SYN  ACCEPT  
  all  --  anywhere             anywhere           state NEW 
all2all    all  --  anywhere             anywhere           

Chain icmpdef (1 references)
target     prot opt source               destination         

Chain loc2fw (0 references)
target     prot opt source               destination         
ACCEPT     all  --  anywhere             anywhere           state
RELATED,ESTABLISHED  newnotsyn  tcp  --  anywhere            
anywhere           state NEW tcp flags:!SYN,RST,ACK/SYN  ACCEPT  
  all  --  anywhere             anywhere           state NEW 
all2all    all  --  anywhere             anywhere           

Chain loc2masq (0 references)
target     prot opt source               destination         
ACCEPT     all  --  anywhere             anywhere           state
RELATED,ESTABLISHED  newnotsyn  tcp  --  anywhere            
anywhere           state NEW tcp flags:!SYN,RST,ACK/SYN  ACCEPT  
  all  --  anywhere             anywhere           state NEW 
all2all    all  --  anywhere             anywhere           

Chain loc2net (0 references)
target     prot opt source               destination         
ACCEPT     all  --  anywhere             anywhere           state
RELATED,ESTABLISHED  newnotsyn  tcp  --  anywhere            
anywhere           state NEW tcp flags:!SYN,RST,ACK/SYN  ACCEPT  
  all  --  anywhere             anywhere           state NEW 
all2all    all  --  anywhere             anywhere           

Chain masq2fw (1 references)
target     prot opt source               destination         
ACCEPT     all  --  anywhere             anywhere           state
RELATED,ESTABLISHED  newnotsyn  tcp  --  anywhere            
anywhere           state NEW tcp flags:!SYN,RST,ACK/SYN  ACCEPT  
  all  --  anywhere             anywhere           state NEW 
all2all    all  --  anywhere             anywhere           

Chain masq2loc (0 references)
target     prot opt source               destination         
ACCEPT     all  --  anywhere             anywhere           state
RELATED,ESTABLISHED  newnotsyn  tcp  --  anywhere            
anywhere           state NEW tcp flags:!SYN,RST,ACK/SYN  ACCEPT  
  all  --  anywhere             anywhere           state NEW 
all2all    all  --  anywhere             anywhere           

Chain masq2net (1 references)
target     prot opt source               destination         
ACCEPT     all  --  anywhere             anywhere           state
RELATED,ESTABLISHED  newnotsyn  tcp  --  anywhere            
anywhere           state NEW tcp flags:!SYN,RST,ACK/SYN  ACCEPT  
  all  --  anywhere             anywhere           state NEW 
all2all    all  --  anywhere             anywhere           

Chain net2fw (1 references)
target     prot opt source               destination         
ACCEPT     all  --  anywhere             anywhere           state
RELATED,ESTABLISHED  newnotsyn  tcp  --  anywhere            
anywhere           state NEW tcp flags:!SYN,RST,ACK/SYN  ACCEPT  
  all  --  anywhere             anywhere           state NEW 
all2all    all  --  anywhere             anywhere           

Chain net2loc (0 references)
target     prot opt source               destination         
ACCEPT     all  --  anywhere             anywhere           state
RELATED,ESTABLISHED  newnotsyn  tcp  --  anywhere            
anywhere           state NEW tcp flags:!SYN,RST,ACK/SYN  ACCEPT  
  all  --  anywhere             anywhere           state NEW 
all2all    all  --  anywhere             anywhere           

Chain net2masq (1 references)
target     prot opt source               destination         
ACCEPT     all  --  anywhere             anywhere           state
RELATED,ESTABLISHED  newnotsyn  tcp  --  anywhere            
anywhere           state NEW tcp flags:!SYN,RST,ACK/SYN  ACCEPT  
  all  --  anywhere             anywhere           state NEW 
all2all    all  --  anywhere             anywhere           

Chain newnotsyn (13 references)
target     prot opt source               destination         
DROP       all  --  anywhere             anywhere           

Chain reject (2 references)
target     prot opt source               destination         
REJECT     tcp  --  anywhere             anywhere          
reject-with tcp-reset  REJECT     all  --  anywhere            
anywhere           reject-with icmp-port-unreachable 

Chain shorewall (0 references)
target     prot opt source               destination         

-- 
VOLNY klub: Modemisti vseho druhu, spojte se!
http://klub.volny.cz


