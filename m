From: seberino@spawar.navy.mil
Subject: How multiple PCs on private LAN possible if incoming is DNAT'd to
	*same* server *always*?
Date: Thu, 3 Feb 2005 09:25:00 -0800
Message-ID: <20050203172500.GB29677@spawar.navy.mil>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I got an iptables script for a NAT-ing firewall that
forwards packets between Internat and a private LAN.

All incoming packets are destination NAT'd to end up
at a single server on the private LAN.

**I don't understand how ANY packets can ever arrive
at ANY other PC on the private LAN since they
are ALL destination NAT'd to go to same private server IP
address!?!?**

If some arbitrary client on private LAN wants to visit
a web page, somehow his traffic arrives back at himself
without any specific NAT rules to get packets to him!??

I know it has something to do with ESTABLISHED,RELATED
state ACCEPT-ing rules but this has always confused me.

Do you understand the question?

Any help greatly appreciated.

Sincerely,

Chris

