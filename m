From: Asim Shankar <asimshankar@gmail.com>
Subject: No ICMP connections in /proc/net/ip_conntrack?
Date: Fri, 11 Feb 2005 11:47:37 -0600
Message-ID: <7bca1cb5050211094730ec3a1a@mail.gmail.com>
Reply-To: Asim Shankar <asimshankar@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

Hi,

I can't see any ICMP entries in /proc/net/ip_conntrack. My setup is as follows:

Machine A: 
- Connected to the internet on eth0 and to a private (192.168.1.0/24) on eth1.
- iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

Machines B and C:
- Connected to the private (192.168.1.0/24) network on eth0
- Default gateway: Machine A

Machine D:
- Connected to the internet

If I ssh/ftp/run a udp-echo client on machines A/B, connecting to
machine D, I can see the entries in /proc/net/ip_conntrack on machine
A.

However, if I "ping D" from A and B, then no entry seems to be present
in ip_conntrack. My understanding based on:
http://www.faqs.org/docs/iptables/icmpconnections.html is that I
should see something in ip_conntrack.

Am I missing something?

Thanks,
Regards,

-- Asim

