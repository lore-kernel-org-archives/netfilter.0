From: alexb@atix.com.br
Subject: packets disapiring
Date: Tue, 01 Apr 2003 18:43:46 -0300 (BRT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1049233426.3e8a0812621b8@www.spsul.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

I've a iptables firewall/router where I look the trafic at /proc/net/dev and in
iptables rules for traffic aquisition. 

            Internet
                |
                |
                | eth0
              -----      iptables -I FORWARD 1 -i eth0 -j eth0-in
              |    |     iptables -I FORWARD 2 -o eth0 -j eth0-out
              | FW |     iptables -I FORWARD 3 -i eth1 -j eth1-in
              |    |     iptables -I FORWARD 4 -o eth1 -j eth1-out
              ------
                | eth1
                | 

Then I use: iptables -nvxL FORWARD   and cat /proc/net/dev|grep eth

The strange behavior is that there seams to be about twice the trafic coming in
on eth1 reported by /proc/net/dev then is going out thru eth0, but byte count
from rule 4 and 2 are the same and similar to eth0-out from /proc/net/dev.
I used iptraf and ethereal to monitor the device and bolth reported trafic
coming in thru eth1 consistent with /proc.
It seams that packages came in thru eth1 and before they reach netfilters they
disapeare. I try to understand the packeges captured by ethereal and it seams to
me that a lot of packages are repeated (same headers, sequence,...). 
This FW has only 32M RAM. Could it be that due to low memory packets ariving to
eth1 are discarted presuming that tcp (ip/udp) protocol will take care to resend
them ?
In that case shouldn't that discarded packege show up in droped packages shown
by ifconfig eth1 ?

And why doesn't I got similar behavior in oposit direction. Incoming bytes on
eth0 are very semelar in /proc and iptables rule 1.

Is there any other reason that could make incoming packages on eth1 not reach
netfilter ? (I already activated log_martians=1 sources and accept them
rp_filter=0, but nothing shows up)

Thanks for any help or guid line how to follow up the incoming packets

