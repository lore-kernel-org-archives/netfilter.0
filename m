From: piraguasu <grtruchet@gigared.com>
Subject: Can't get access remote LAN through firewall
Date: Sat, 14 Oct 2006 20:55:14 -0300
Message-ID: <453178E2.5020602@gigared.com>
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
To: netfilter@lists.netfilter.org

Hi All

I have two LAN, both connected to Internet through proxy/firewall on 
Linux. One is my working LAN and other remote. I want to see internal 
machines of remote LAN from any computers of my LAN, for this I setup a 
tunnel and when the  firewall  is down in both LAN, all OK.

When firewall is up, my problem is forwarding between tunnel device and 
internal card (eth1), I can't get pass through firewall, iptables rules 
don't work.

Forwarding is enabled in the systems "/proc/sys/net/ipv4/ip_forward = 1"

Why iptables FORWARD don't work.

Who can help me?

