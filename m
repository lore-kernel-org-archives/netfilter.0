From: Claude Brisson <claude@renegat.net>
Subject: port restricted cone behaviour
Date: Wed, 23 Mar 2005 22:49:40 +0100
Message-ID: <1111614580.3657.11.camel@localhost.localdomain>
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

Hi folks,

I noticed that on some occasions, iptables does not behave strictly as a
port restricted cone NAT.

That is, when I reuse an internal udp socket towards a new external
host/port, iptables will SOMETIMES use a new mapping port... is it a
known behaviour? a bug? a feature?

distrib debian woody
kernel: v2.4.18-bf2.4
iptables: v1.2.6a 

-- 
Claude



