From: Mats Blomstrand  <mats.blomstrand@htu.se>
Subject: Im stupid or its broken
Date: Fri, 13 Sep 2002 12:29:11 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200209131029.g8DATBQ32523@bergelmer.thn.htu.se>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-ID: <32520.1031912948.1@htu.se>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi all
This is perhaps a stupid question. But I have *really* tried to
get it by reading FAQ's and tutorials all over all week long.
Please take some  time to help me out.

I have a master and a couple of nodes that need NAT from master.
If I boot master and nodes without any iptables stuff and then
add this rule to iptables

  root@wsk0 # iptables -t nat -A POSTROUTING -o eth0 \
              -s 192.168.0.0/24 -j SNAT --to-source 193.10.192.63

and the do

  root@wsk0 # echo 1 > /proc/sys/net/ipv4/ip_forward

it does what I want. Ie, i can ping from node to the outside
and the node can do nfs-mounts from master.

** However!! If I reboot the node it can still ping to the outside
but it cant no longer do the nfs mount:

  root@wsk9 # mount -t nfs wsk0.vip:/usr/local/share/ /usr/local/share/
  mount: RPC: Timed out
  root@wsk9 #

Every policy is ACCEPT and the above command is the ONLY thing
added to the nat-table.

Here is all the rules:
  root@wsk0 # service iptables status
  Table: filter
  Chain INPUT (policy ACCEPT)
  target     prot opt source               destination         
  
  Chain FORWARD (policy ACCEPT)
  target     prot opt source               destination         
  
  Chain OUTPUT (policy ACCEPT)
  target     prot opt source               destination         
  Table: nat
  Chain PREROUTING (policy ACCEPT)
  target     prot opt source               destination         
  
  Chain POSTROUTING (policy ACCEPT)
  target     prot opt source               destination         
  SNAT       all  --  192.168.0.0/24       anywhere           to:193.10.192.63 
  
  Chain OUTPUT (policy ACCEPT)
  target     prot opt source               destination         
  Table: mangle
  Chain PREROUTING (policy ACCEPT)
  target     prot opt source               destination         
  
  Chain OUTPUT (policy ACCEPT)
  target     prot opt source               destination         
  root@wsk0 # 


What is wrong??
//Mats

PS: Versions ...
  root@wsk0 # iptables --version
  iptables v1.2.3
  root@wsk0 # uname -sr
  Linux 2.4.7-10smp
  root@wsk0 # 
  

