From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: A Humble Proposal
Date: Wed, 24 Sep 2003 06:57:34 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1064401053.1892.5.camel@jasiiitosh.nexusmgmt.com>
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

	What an interesting project! Perhaps nufw and ISCS
(http://iscs.sourceforge.net) can share some ideas.  ISCS plans to
support the dynamic creation of iptables rules based upon LDAP, AD, NDS,
SecureID and RADIUS in version 2.x.  It currently supports the dynamic
creation of iptables rules based upon the fields of a user's X.509
digital certificate.  The scripts to make this happen on the enforcement
device are in the project CVS but we are still building the
administrative interface.  In fact, we may be looking to hire a few
developers to accelerate this process.  Please feel free to use the
scripts if they are of help - John
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

> I have seen some of this functionality in Checkpoint, and I think
that> it would be immensely useful in the iptables community if it is
adopted.
NuFW provides these sort of things :
  http://www.nufw.org
Code can be considered has beta code. It works but things need to be
done (especially a Windows Client ;-).
With NuFW, you really filter by User (Group) and not by IP as it often
the case.



