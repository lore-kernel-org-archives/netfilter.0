From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: conntrack mismatch with iproute2 and iptables
Date: Fri, 26 Dec 2003 14:47:57 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1072468076.2907.43.camel@jasiiitosh.nexusmgmt.com>
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

	We have some good news on this front.  In tracing the path of IPSec
packets (we are using FreeS/WAN with iptables) through netfilter, we
found we had misunderstood the (very good) FreeS/WAN documentation.  We
thought we did not have access to the unencrypted packet in the nat
table.
	We were wrong and that is good news.  When the ISCS project is released
(http://iscs.sourceforge.net), we will have a product where with the
click of a mouse button and a few keystrokes, an admin should be able to
enable communication among networks that contain conflicting IP subnets,
i.e., two different subnets with the same network address.  It looks
like it is working flawlessly and statefully (as opposed to when we
implemented this with iproute2 nat).  Of course, the admin will also
have to deal with the DNS issues but that's a different matter :-)
	However, this still does not resolve the original issue.  We continue
to see that, when using iproute2 NAT, there is no entry in ip_conntrack
until the rule is matched using the NAT address but the ip_conntrack
table then records the source as the original address and the reply
packets cannot be matched (since they are using the NAT address as the
destination!).
	This is no longer a critical issue for us but does anyone have any idea
why this happens?
	
-- 
John A. Sullivan III
Chief Technology Officer
Nexus Management
+1 207-985-7880
john.sullivan@nexusmgmt.com


