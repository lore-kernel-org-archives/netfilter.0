From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: PREROUTING SNAT?
Date: Tue, 23 Dec 2003 18:44:48 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1072223087.2145.34.camel@jasiiitosh.nexusmgmt.com>
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

	For the ISCS project, we need to be able to change the source address
of a packet before a routing decision is made.  It would appear that the
SNAT target can only be used in the POSTROUTING nat table chain.  As we
mentioned in an earlier post, we are facing some complications when
trying to do this with iproute2.  Is there any other way to change the
source address (especially if we can do it statefully) in the PREROUTING
chains of either mangle of nat? Thanks - John
-- 
John A. Sullivan III
Chief Technology Officer
Nexus Management
+1 207-985-7880
john.sullivan@nexusmgmt.com
---
If you are interested in helping to develop a GPL enterprise class
VPN/Firewall/Security device management console, please visit
http://iscs.sourceforge.net 


