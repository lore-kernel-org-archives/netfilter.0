From: Oumer Teyeb <oumer@cpk.auc.dk>
Subject: Tcpdump and libipq
Date: Wed, 08 Oct 2003 11:14:15 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F83D567.8030704@cpk.auc.dk>
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

Hi,
I have a program that uses libipq to delay and drop packets, so that the 
transmission will be affected as if the connection is a wireless 
network. It works fine. My intention was to use tcpdump in conjunction 
with my program to see exactly when the packets are arriving, and then 
use tcptrace to plot the graphs. But as libipq is working at the netlink 
socket layer, I am doubting that when a packet reaches my firewall, it 
will alreay be registerd by tcpdump.

For example, I set my program to delay every packet arriving from port 
xx 100 msec. I also run tcpdump in the background to sniff on the same 
flow. Say a  packet arrives at 0.000 in my network card, and it was 
delayed 100 msec by my program and sent to upper layers. Will Tcpdump 
register the packet arrival time as 0.000 or as 100 ? I will try to 
check it myself, but if anyone knows, that will save me some time.

Regards,
Oumer


