From: "Vosburgh, Brian P, CTR, WHS-BB" <bvosburgh@whs.mil>
Subject: Intercept name lookup discover SA and alter reply?
Date: Fri, 20 Sep 2002 15:45:11 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <86E43FEDC7E2D411B9610002A50900EB881B7D@ddsmttayz076.ref.whs.mil>
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

I've seen iptables used to block SPAM via dnsbl so I'm wondering... can
iptables watch UDP 53, inspect for a specific name query
(server.company.com), remap the address to a closer server?  I know I can do
it with F5's 3DNS, essentially detect where a client is coming from and
redirect to a closer server.  Since 3DNS is glorified BSD/IPFilter I'm
hoping that Linux 2.4.x running NetFilter could do the equivilant.

It would be even better if iptables would know (via TCP connect) if the
alternate server were up or down and if down resort to the main server.

Thanks in advance for any info.


Brian Vosburgh
WHS Network Engineering
Work: 703-614-4888
Cell: 703-867-2317

"Moore's Law is too slow for us." 
- Shin'ichi Okamoto, CTO for Sony Computer Entertainment



