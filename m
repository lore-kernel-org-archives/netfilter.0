From: "Hard__warE" <hard__ware@hotmail.com>
Subject: Multi Port Tested & Example
Date: Wed, 12 Jun 2002 07:45:38 +1000
Sender: netfilter-admin@lists.samba.org
Message-ID: <000d01c21191$53304e40$7b0010ac@dynamicaccess.lan>
Reply-To: "Hard__warE" <hard__ware@hotmail.com>
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

i remember a while back people were screeming for help on multi port

well here what ya .. need

the example is For all SAMBA Ports to be added and DROPED

---------------Start Below This Line---------------------

## Load the Multi Port  Modue ##

echo -e "ipt_multiport, "
if [ -z "` $LSMOD | $GREP ipt_multiport | $AWK {'print $1'} `" ]; then
   /sbin/insmod ipt_multiport
fi

##########Creat Samba Chain #############
$IPTABLES -N SMB
$IPTABLES -A SMB -m multiport -p tcp --dport 135,136,137,138,139,445 -j DROP
$IPTABLES -A SMB -m multiport -p tcp --dport 135,136,137,138,139,445 -j DROP
$IPTABLES -A SMB -m multiport -p udp --sport 135,136,137,138,139,445 -j DROP
$IPTABLES -A SMB -m multiport -p udp --sport 135,136,137,138,139,445 -j DROP

$IPTABLES -A INPUT -s $UNIVERSE -d $UNIVERSE -j SMB
$IPTABLES -A OUTPUT -s $UNIVERSE -d $UNIVERSE -j SMB
$IPTABLES -A FORWARD -j SMB

To prove it works here is my Chains  /sbin/iptbales -L -n -v

Chain INPUT (policy DROP 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source
destination
    2   202 ACCEPT     all  --  lo     *       0.0.0.0/0
0.0.0.0/0
  470 49894 ACCEPT     all  --  eth0   *       172.16.0.0/16
0.0.0.0/0
    0     0 drop-and-log-it  all  --  eth1   *       172.16.0.0/16
0.0.0.0/0
    0     0 drop-and-log-it  all  --  eth1   *       0.0.0.0/0
172.16.0.0/16
    0     0 SPOOFED    icmp --  eth1   *       0.0.0.0/0
0.0.0.0/0
    0     0 ACCEPT     icmp --  eth1   *       0.0.0.0/0
192.168.0.253
   16  1395 ACCEPT     all  --  eth1   *       0.0.0.0/0
192.168.0.253
    0     0 ACCEPT     all  --  eth1   *       0.0.0.0/0
192.168.0.212
    0     0 ACCEPT     all  --  eth1   *       0.0.0.0/0
192.168.0.212      state RELATED,ESTABLISHED
    0     0 ACCEPT     all  --  eth1   *       0.0.0.0/0
192.168.0.213
    0     0 ACCEPT     all  --  eth1   *       0.0.0.0/0
192.168.0.213      state RELATED,ESTABLISHED
    0     0 ACCEPT     all  --  eth1   *       0.0.0.0/0
192.168.0.253      state RELATED,ESTABLISHED
   17  1702 SMB        all  --  *      *       0.0.0.0/0
0.0.0.0/0
    0     0 drop-and-log-it  all  --  *      *       0.0.0.0/0
0.0.0.0/0

Chain FORWARD (policy DROP 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source
destination
   67  5190 ACCEPT     tcp  --  eth1   *       0.0.0.0/0
172.16.0.111       tcp dpt:80
    0     0 ACCEPT     tcp  --  eth1   *       0.0.0.0/0
172.16.0.111       tcp dpt:443
    0     0 ACCEPT     udp  --  eth1   *       0.0.0.0/0
172.16.0.111       udp dpt:443
    0     0 ACCEPT     tcp  --  eth1   *       192.168.0.212
172.16.0.52        tcp
    0     0 ACCEPT     udp  --  eth1   *       192.168.0.212
172.16.0.52        udp
    0     0 ACCEPT     tcp  --  eth1   *       192.168.0.213
172.16.0.53        tcp
    0     0 ACCEPT     udp  --  eth1   *       192.168.0.213
172.16.0.53        udp
  334 92708 SMB        all  --  *      *       0.0.0.0/0
0.0.0.0/0
    0     0 ACCEPT     tcp  --  eth1   *       0.0.0.0/0
0.0.0.0/0          tcp flags:0x16/0x02 limit: avg 1/sec burst 5
    0     0 ACCEPT     tcp  --  eth1   *       0.0.0.0/0
0.0.0.0/0          tcp flags:0x17/0x04 limit: avg 1/sec burst 5
    0     0 ACCEPT     icmp --  eth1   *       0.0.0.0/0
0.0.0.0/0          icmp type 8 limit: avg 1/sec burst 5
    0     0 ACCEPT     all  --  eth1   eth0    0.0.0.0/0
172.16.0.52        state RELATED,ESTABLISHED
    0     0 ACCEPT     all  --  eth1   eth0    0.0.0.0/0
172.16.0.53        state RELATED,ESTABLISHED
  127 32555 ACCEPT     all  --  eth1   eth0    0.0.0.0/0
0.0.0.0/0          state RELATED,ESTABLISHED
  207 60153 ACCEPT     all  --  eth0   eth1    172.16.0.0/16
0.0.0.0/0
    0     0 drop-and-log-it  all  --  *      *       0.0.0.0/0
0.0.0.0/0

Chain OUTPUT (policy DROP 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source
destination
    2   202 ACCEPT     all  --  *      lo      0.0.0.0/0
0.0.0.0/0
  392  151K ACCEPT     all  --  *      eth0    172.16.0.253
172.16.0.0/16
    0     0 ACCEPT     all  --  *      eth0    192.168.0.253
172.16.0.0/16
    0     0 drop-and-log-it  all  --  *      eth1    0.0.0.0/0
172.16.0.0/16
    0     0 ACCEPT     all  --  *      eth0    192.168.0.212
172.16.0.0/16
    0     0 ACCEPT     all  --  *      eth1    192.168.0.212
0.0.0.0/0
    0     0 ACCEPT     all  --  *      eth0    192.168.0.213
172.16.0.0/16
    0     0 ACCEPT     all  --  *      eth1    192.168.0.213
0.0.0.0/0
   16  1059 ACCEPT     all  --  *      eth1    192.168.0.253
0.0.0.0/0
    0     0 SMB        all  --  *      *       0.0.0.0/0
0.0.0.0/0
    0     0 drop-and-log-it  all  --  *      *       0.0.0.0/0
0.0.0.0/0

Chain SMB (3 references)
 pkts bytes target     prot opt in     out     source
destination
    0     0 DROP       tcp  --  *      *       0.0.0.0/0
0.0.0.0/0          multiport dports 135,136,137,138,139,445
    0     0 DROP       tcp  --  *      *       0.0.0.0/0
0.0.0.0/0          multiport dports 135,136,137,138,139,445
   17  1702 DROP       udp  --  *      *       0.0.0.0/0
0.0.0.0/0          multiport sports 135,136,137,138,139,445
    0     0 DROP       udp  --  *      *       0.0.0.0/0
0.0.0.0/0          multiport sports 135,136,137,138,139,445

Chain SPOOFED (1 references)
 pkts bytes target     prot opt in     out     source
destination
    0     0 drop-and-log-it  all  --  *      *       10.0.0.0/8
0.0.0.0/0
    0     0 drop-and-log-it  all  --  *      *       172.16.0.0/16
0.0.0.0/0
    0     0 drop-and-log-it  all  --  *      *       0.0.0.0/0
10.0.0.0/8
    0     0 drop-and-log-it  all  --  *      *       0.0.0.0/0
172.16.0.0/16

Chain drop-and-log-it (10 references)
 pkts bytes target     prot opt in     out     source
destination
    0     0 LOG        all  --  *      *       0.0.0.0/0
0.0.0.0/0          LOG flags 0 level 6
    0     0 DROP       all  --  *      *       0.0.0.0/0
0.0.0.0/0






