From: Samuel Jean <sj-netfilter@cookinglinux.org>
Subject: Re: Limit module accept negation?
Date: Thu, 13 Jan 2005 20:24:50 -0500
Message-ID: <41E71F62.30208@cookinglinux.org>
References: <41E2E0CB.18071.252B3E2C@localhost>	<41E6C745.7555.2118F01@localhost>
	<41E71E70.4080703@cookinglinux.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------050901030309090202030207"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <41E71E70.4080703@cookinglinux.org>
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
To: jagrelo@novadevices.com
Cc: netfilter@lists.netfilter.org

This is a multi-part message in MIME format.
--------------050901030309090202030207
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Samuel Jean wrote:
> The patch below is against ipt_limit.c from 2.6.10. It's *untested* but 
> reflects what I told you. It's just an exemple of how you can make
> this module behaving the other way arround.
> 

Doh! crapy patch. Attached good one. I hope.

--------------050901030309090202030207
Content-Type: text/x-patch;
 name="ipt_limit.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="ipt_limit.patch"

--- ipt_limit.c.orig	2005-01-13 20:13:19.000000000 -0500
+++ ipt_limit.c	2005-01-13 20:14:10.000000000 -0500
@@ -82,11 +82,11 @@
 		/* We're not limited. */
 		r->credit -= r->cost;
 		spin_unlock_bh(&limit_lock);
-		return 1;
+		return 0;
 	}
 
        	spin_unlock_bh(&limit_lock);
-	return 0;
+	return 1;
 }
 
 /* Precision saver. */

--------------050901030309090202030207--

