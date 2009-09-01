From: Patrick McHardy <kaber@trash.net>
Subject: Re: ULOG The kernel doesn't support a certain ebtables extension,
 consider recompiling your kernel or insmod the extension.
Date: Tue, 01 Sep 2009 14:35:41 +0200
Message-ID: <4A9D151D.30808@trash.net>
References: <4A9C2F4C.9050405@branndal.se> <200908311534.19700.rob0@gmx.co.uk> <4A9CD19C.6040107@branndal.se> <4A9D08FF.7070705@trash.net> <4A9D10DF.1050307@branndal.se>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------070004060405070300090401"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4A9D10DF.1050307@branndal.se>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Thomas Berg <thomas.berg@branndal.se>
Cc: /dev/rob0 <rob0@gmx.co.uk>, netfilter@vger.kernel.org

This is a multi-part message in MIME format.
--------------070004060405070300090401
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit

Thomas Berg wrote:
> Hi
> 
> trying this
> 
> rmmod ipt_ulog
> 
> modprobe ebt_ulog
> 
> ebtables 14108 3 ebtable_broute,ebtable_nat,ebtable_filter
> x_tables 14108 5 ebt_ulog,ebt_nflog,ebt_ip,ebt_log,ebtables
> 
> 
> module is then loaded, great but still the same error when trying to add
> a ebtables rule with ulog.
> 
> br0:~# /sbin/ebtables --modprobe /sbin/modprobe -A FORWARD
> --in-interface eth1.4 --protocol IPv4 --ip-protocol udp
> --ip-destination-port 67 -j DROP --ulog
> The kernel doesn't support a certain ebtables extension, consider
> recompiling your kernel or insmod the extension.

This patch should fix it.



--------------070004060405070300090401
Content-Type: text/plain;
 name="x"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="x"

commit 8a56df0ae1690f8f42a3c6c4532f4b06f93febea
Author: Patrick McHardy <kaber@trash.net>
Date:   Tue Sep 1 14:34:01 2009 +0200

    netfilter: ebt_ulog: fix checkentry return value
    
    Commit 19eda87 (netfilter: change return types of check functions for
    Ebtables extensions) broke the ebtables ulog module by missing a return
    value conversion.
    
    Signed-off-by: Patrick McHardy <kaber@trash.net>

diff --git a/net/bridge/netfilter/ebt_ulog.c b/net/bridge/netfilter/ebt_ulog.c
index 133eeae..ce50688 100644
--- a/net/bridge/netfilter/ebt_ulog.c
+++ b/net/bridge/netfilter/ebt_ulog.c
@@ -266,7 +266,7 @@ static bool ebt_ulog_tg_check(const struct xt_tgchk_param *par)
 	if (uloginfo->qthreshold > EBT_ULOG_MAX_QLEN)
 		uloginfo->qthreshold = EBT_ULOG_MAX_QLEN;
 
-	return 0;
+	return true;
 }
 
 static struct xt_target ebt_ulog_tg_reg __read_mostly = {

--------------070004060405070300090401--
