From: adderek <adderek@polbox.com>
Subject: Re: Problem: ISA card & iptables (2.4.26) - disappearing packets
Date: Sat, 17 Jul 2004 16:47:29 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40F93C01.5020107@polbox.com>
References: <40F8D503.3040608@polbox.com> <200407180939.37668.Antony@Soft-Solutions.co.uk> <40F8E16B.2020808@polbox.com> <200407181140.35100.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200407181140.35100.Antony@Soft-Solutions.co.uk>
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

I have removed all cards except those three network cards and graphic card.


10.0.0.2 (BNC terminal):

1)    exec(`ping 10.0.0.1`)

result:
     100% packet loss


2)    exec(`ping google.com`)

result:
     100% packet loss


------------------------------------------------------------
10.0.1.2 (RJ45 terminal):

1)    exec(`ping 10.0.1.1`)

result:
     0% packet loss


2)    exec(`ping google.com`)

result:
     0% packet loss


-------------------------------------------------------------

10.0.0.1 (BNC router, ISA@eth0 PCI@eth1 internet@eth2):

3)    exec(`iptables -t filter -L -v -n`)

result:    Chain INPUT (policy DROP 89 packets, 11837 bytes)
      pkts bytes target     prot opt in     out     source destination
      2041  175K ACCEPT     all  --  eth1   *       0.0.0.0/0 0.0.0.0/0
        31  2340            all  --  eth0   *       0.0.0.0/0 0.0.0.0/0

     Chain FORWARD (policy ACCEPT 107 packets, 6663 bytes)
      pkts bytes target     prot opt in     out     source destination

     Chain OUTPUT (policy ACCEPT 1040 packets, 96388 bytes)
      pkts bytes target     prot opt in     out     source destination
      1178  162K ACCEPT     all  --  *      eth1    0.0.0.0/0 0.0.0.0/0
         0     0 ACCEPT     all  --  *      eth0    0.0.0.0/0 0.0.0.0/0

4)    exec(`ping 10.0.0.2`)

result:
     0% packet loss


conclusion:
iptables is catching incoming bytes and statistics are rising from both 
interfaces.
I don't understand why packets are not forwarded.
ping replies goes only when requesting from 'PCI network'.
ping requests from 'ISA network' are ignored.
I've forgotten about '-j ACCEPT' in INPUT from eth0 :)

and now : strange thing:


5)
on router I've executed:
     exec(`iptables -t filter -I INPUT -i eth2 -j DROP`)
     exec(`iptables -P INPUT ACCEPT`)

and then on BNC terminal:
     exec(`ping 10.0.0.1`)
     and the result.....
result:    0% packet loss !!!
and
     exec(`ping google.com`)
result:    100% packet loss

conclusion:
packets are forwarded only internally trough ISA card.
however PCI card is forwarded to the internet.
Interface eth0 acts like it is something else (like packets are incoming 
from some non existing card).
But data can be send to this interface (cause `ping 10.0.0.2 on router 
always works).



6)    exec(`iptables -t filter -L -v -n`)

result:    Chain INPUT (policy ACCEPT 4 packets, 240 bytes)
      pkts bytes target     prot opt in     out     source destination
        10  1512 DROP       all  --  eth2   *       0.0.0.0/0 0.0.0.0/0
      3317  287K ACCEPT     all  --  eth1   *       0.0.0.0/0 0.0.0.0/0
        48  3989            all  --  eth0   *       0.0.0.0/0 0.0.0.0/0

     Chain FORWARD (policy ACCEPT 196 packets, 11439 bytes)
      pkts bytes target     prot opt in     out     source destination

     Chain OUTPUT (policy ACCEPT 1085 packets, 99644 bytes)
      pkts bytes target     prot opt in     out     source destination
      2546  313K ACCEPT     all  --  *      eth1    0.0.0.0/0 0.0.0.0/0
         4   240 ACCEPT     all  --  *      eth0    0.0.0.0/0 0.0.0.0/0


After few more researches I've managed that kernet even don't try 
forwarding my packets:

Chain FORWARD (policy ACCEPT 29 packets, 1512 bytes)
  pkts bytes target     prot opt in     out
    51  2364 ACCEPT     all  --  eth1   *
     0     0 ACCEPT     all  --  eth0   *
     0     0 ACCEPT     all  --  *      eth0
    63 20975 ACCEPT     all  --  *      eth1

(table shown above was created after making some `ping google.com` from 
both subnetworks)


What now?

