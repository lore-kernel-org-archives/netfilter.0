From: Ram Devarayi <ram@innomedia.soft.net>
Subject: Reverse NAT functionality.
Date: 24 May 2003 11:29:49 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1053755989.3661.10.camel@ram>
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

Hi There,
Iam using uClinux 2.4.19 as Home Gateway. It has 1 WAN port(Global IP)
and 4 LAN ports(Local IP's). When LAN port1 sends a packet to LAN port2,
uClinux has to send packet to LAN port2 directly without sending out via
WAN port and coming back to LAN port2.

Does this support is there in uClinux?. If not where to add the changes
needed for this in uClinux?. 

In linux-2.4.x/net/ipv4/netfilter directory, i find files related to NAT
and ip filtering.

Any help is appreciated.

Regards
Ram.D  


