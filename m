From: Lopsch <lopsch@lopsch.com>
Subject: Re: Filtering encrypted vs. unencrypted packages?
Date: Sun, 31 Oct 2004 16:14:03 +0100
Message-ID: <4185013B.9040907@lopsch.com>
References: <41840BB2.6020904@danisch.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <41840BB2.6020904@danisch.de>
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
To: Netfilter-Mailinglist <netfilter@lists.netfilter.org>

Hadmut Danisch schrieb:
> Hi,
> 
> I was just playing around with 2.6 IPSec and isakmpd and ran into a 
> problem:
> 
> In order to have the packets from the peer IPSEC network accepted,
> I need to have an entry like
> 
> iptables -A INPUT -s 192.168.19.0/24 -j ACCEPT
> 
Try using the the protocol option:

iptables -A INPUT -s 192.168.19.0/24 -p 50 -j ACCEPT
iptables -A INPUT -s 192.168.19.0/24 -p 51 -j ACCEPT

where 50 are esp packets und 51 ah if I understood it right.


