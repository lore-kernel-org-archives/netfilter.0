From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: how do you add multiple addresses for -s??
Date: Mon, 12 Jan 2004 13:01:43 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1073930503.3088.61.camel@jasiiitosh.nexusmgmt.com>
References: <4294.66.65.50.122.1073927755.squirrel@sojourn.dyndns.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <4294.66.65.50.122.1073927755.squirrel@sojourn.dyndns.org>
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
To: Technical <technical@sojourn.dyndns.org>
Cc: netfilter@lists.netfilter.org

I do not think one can.  One can use a subnet,e.g., -s 10.1.1.16/28.  If
the addresses do not fall into a single subnet, one can use a range with
the iprange patch in patch-o-matic.  Failing that, there is a handy
utility at http://subnetcreator.sourceforge.net which can convert an
iprange into a series of subnets so that one can make a series of subnet
rules for a range, e.g, -s 10.1.1.10/31 -j ACCEPT, -s 10.1.1.11/30 -j
ACCEPT, -s 10.1.1.12/30 -j ACCEPT, -s 10.1.1.16/30 and 10.1.1.20/32 for
the range 10.1.1.10-20.  We use it extensively to create NETMAP rules to
resolve IP network address conflicts in the ISCS network security
project (http://iscs.sourceforge.net).  Other than that, I think you're
stuck :-)
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


