From: Ashutosh <ashutosh@teneoris.com>
Subject: Possible problem with FTP ALG
Date: 29 Nov 2004 14:46:00 +0200
Message-ID: <1101732359.12476.3077.camel@ashutosh.teneoris.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Cc: laforge@gnumonks.org

Hi folks,

I am running Linux 2.4.20 on my router with LAN IP FILTER rules as -

Allow from LAN to WAN on port 21
Deny all from LAN to WAN

Now, when I ftp to a machine on the WAN Only the control connection
opens ( Login is fine), but the data connection does not open. The
machine freezes when I do an "ls".. I am using passive ftp here.

When I put printk's in the code, the expected is added, the CT is formed
and NF_DROP does get called at any stage

Kindly Help!!!

Regards
-- 
Ashutosh Naik



