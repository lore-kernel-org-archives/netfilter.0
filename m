From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Kernel panic with RPC patch
Date: 26 Apr 2003 05:19:35 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1051338674.4852.20.camel@jasiiitosh.nexusmgmt.com>
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

I was thrilled to see the RPC patch but find that I cannot use it.  My
RedHat 7.3 system running kernel 2.4.20 hangs on boot with:

Unable to handle kernel NULL pointer dereference at virtual address
00000010

I thought it might be the use of cryptoapi so I removed it.  That made
no difference.  I overwrote the kernel source with a fresh copy and
recompiled without cryptoapi.  That didn't make a difference either.

I suspected some of the other patches but the one that made the error go
away when removed and return when applied was RPC.

Has anyone else had this problem?

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


