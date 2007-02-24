From: <mabra@manfbraun.de>
Subject: debian [testing/etch] redirected broadcasts not working
Date: Sat, 24 Feb 2007 12:03:19 +0100
Message-ID: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAA5vnGI+hMzxGNBQCASISWKcKAAAAQAAAA/XFtDOjSZEyQI/6EoCSUaAEAAAAA@manfbraun.de>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi All!

I am struggling with ipfilters to redirect broadcast from the internet into
my LAN, which I need for Wake On LAN(WAN). I have just moved from NetBSD to
Debian and have set it up to be a router, which does well. I am new to
ipfilters, but I got all of my nat-based redirects of ports running, except
this one:

iptables -t nat -A PREROUTING -i $EXTIF -p udp --dport 8888 -j DNAT --to
192.168.26.255

This is syntactically accepted by ipfilters, but there are no redirected
packages in the LAN, which I track with tcpdump. The packages reach my
public interface, but not more. In NetBSD, I had to set the kernel variable
"net.inet.ip.directed-broadcast" to allow the redirected broadcast. After
long serches, I discovered "net.ipv4.ip_echo_ignore_broadcasts" for Debian
from a posting. But if I try to set this variable, I get only "unknown key"
[I use "sysctl -w ...] as an error message.

Is this a limitation to the testing version, or am I completely wrong with
my attempt?
Any help would be great!

Best regards,
Manfred 


