From: Jerry Alexander <jerrya@airmail.net>
Subject: iptables NAT and ICMP error messages
Date: Tue, 25 Oct 2005 15:00:01 -0500
Message-ID: <435E8EC1.1050705@airmail.net>
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
To: netfilter@lists.netfilter.org, Jerry <jerry@mavenir.com>

Dear NF:

          Set up three linux boxes. 
          Sending out iperf udp's to second box which is PREROUTED to 
the 3rd box and
prerouted back to the second and then to the first:

           Doing
-A PREROUTING -d 192.168.0.15 -i eth0 -p udp -j DNAT --to-destination 
192.169.0.30
and so on.
Also do a POSTROUTING command to change the source address before 
sending back
to the first box.

The good news is that the packets get routed from 1 to 2 to 3 to 2 to 1 
and have the
altered src and dest address.
Problem is I am also getting tons of ICMP destination unreachable messages.
Tried putting in some FORWARD commands but this did nothing.
Can some one tell me the source of these ICMP error messages and how to
eliminate them?
Running linux 2.4-20 and "yes" , ip_forward is set to 1.


                                                                                  
Jerry


