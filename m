From: Christian Kreibich <christian@whoop.org>
Subject: ICMP replies aren't unnated
Date: 05 May 2003 13:56:49 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1052139409.21360.84.camel@ghouls.cl.cam.ac.uk>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi,


my apologies if this is a faq -- I feel I'm missing something obvious
but couldn't find a pointer anywhere.

Using iptables on a 2.4.18 kernel, I want a simple NAT for all IP
packets going over my box's eth0 to my DSL provider. Say the
dhcp-obtained IP address is ISP_IP. I want all IP packets to or from
this IP to be nated to 192.168.169.2. I have everything working, except
that ICMP is broken: incoming ping requests are properly natted and
arrive at 192.168.169.2, but I see ICMP replies on eth0 that aren't
unnated.

The iptables command I use is

iptables -t nat -A PREROUTING -d ISP_IP -j DNAT --to 192.168.169.2

Look at what I see on eth0 when I ping the machine from the outside
(from my office machine, OFF_IP):

13:21:14.303528 OFF_IP > ISP_IP: icmp: echo request (DF)
13:21:14.306158 192.168.169.2 > OFF_IP: icmp: echo reply
13:21:15.319962 OFF_IP > ISP_IP: icmp: echo request (DF)
13:21:15.321757 192.168.169.2 > OFF_IP: icmp: echo reply
13:21:16.319127 OFF_IP > ISP_IP: icmp: echo request (DF)
13:21:16.320931 192.168.169.2 > OFF_IP: icmp: echo reply

Other connections work fine, just ICMP seems broken. Any help would
really be appreciated, I've played with it for a while and cannot seem
to get it right.

Regards,
Christian.



