From: CC <cc@kdtc.net>
Subject: tcpdump and Iptables
Date: Fri, 03 Sep 2004 01:56:33 +0800
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <41375ED1.5090400@kdtc.net>
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
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi,

I think I've asked this before here, but I
don't remember what the answer was.

If I have iptables running and I do a
tcpdump -i eth0,   at what point is
tcpdump listening to the connection?

I'm trying to troubleshoot my firewall,
but am not seeing the right behaviour
as the packets that I'm trying to block
by the following command:

$IPTABLES -A FORWARD -i eth1 -p tcp \
              -d 192.168.7.1 -j DROP

But I still get tcp packets going to
192.168.7.1.

And wouldn't :

$IPTABLES -A FORWARD -i eth1 -p tcp \
             -s 192.168.7.1 -j DROP

in effect disables all access to the
internet for machine IP 192.168.7.1?

But my main query is about the
relationship between the packets that
TCPDUMP sees and where the packets
are within the packet filtering
process.

Thanks



