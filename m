From: Christophe.LINDHEIMER@fr.thalesgroup.com
Subject: beginner, trying to use iptables.
Date: Thu, 29 Jan 2004 13:59:08 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <66CE949D18BCB249ABE8D9AF48C4F1CE777AFF@helios.clb.tcfr.thales>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi.

I am working with iptables v1.2.8 on a mandrake 9.2.

My computer that is running iptables is 128.0.0.1

An other computer has @ 128.0.0.2.

I try to followings commands :

iptables -t nat -A PREROUTING -i eth0 -j LOG
iptables -t mangle -A PREROUTING -i eth0 -j LOG
iptables -A INPUT -i eth0 -j LOG

if I ping 128.0.0.1 from 128.0.0.2, I see the packets in the syslog.
if I ping 128.0.0.10 ( for example ) from 128.0.0.2, there is nothing in the
syslog.

Is it normal ?

I thought that I was going to see all the packets in the NAT and not only
the packets with the right IP @.

Missing something ???

Thanks

Chris



