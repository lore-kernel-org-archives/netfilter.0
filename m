From: Daniel <damage@rooties.de>
Subject: iptables - losing packets between mangle and nat
Date: Sun, 8 Jan 2006 01:51:02 +0100
Message-ID: <200601080151.02899.damage@rooties.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
To: Netfilter List <netfilter@lists.netfilter.org>

Hi,
I'm trying to create an net-to-net VPN.

{192.168.0.0/24}--[192.168.0.1]-VPN/INET-[192.168.1.1]--{192.168.1.0/24}
       LAN           GATEWAY                GATEWAY           LAN

Everything seems to be fine:
1. I'm able to ping 192.168.1.1 from 192.168.0.1 (so, racoon allready
established the tunnel
2. I'm able to ping 192.168.0.1 from 192.168.1.1 (so, both ways are ok)
3. if I try to ping 192.168.1.1 from 192.168.0.0/24 then racoon is
establishing the tunnel
4. if I try to ping 192.168.0.1 from 192.168.1.0/24 then racoon is
establishing the tunnel

But in case 3 und 4 the client from the LAN does not got an reply on his
request. As I noticed the problem is the gateway from the lan which the
client is in (so in case 3 the problem is 192.168.0.1). Also (in case 3) I
noticed that the reply has been send from 192.168.1.1 but it gets "lost" on
192.168.0.1.

So I added some rules to iptables on 192.168.0.1 and I noticed that the packet
access the PREROUTING chain in the table mangle but never access the
PREROUTING chain in the table nat. I think it should because of the packet 
flow (http://www.siliconvalleyccie.com/images/iptables.gif) ?!?!?!

Why does this packet never access the PREROUTING chain in "nat" (and all other 
following chains)? Any suggestions?

Daniel

