From: Dzianis Kahanovich <mahatma@bspu.unibel.by>
Subject: connlimit timeout average (was: Re: Patch-o-matic+iptables+kernel,
 which versions fits together?)
Date: Thu, 07 Feb 2008 19:44:56 -0200
Message-ID: <47AB7BD8.8040103@bspu.unibel.by>
References: <2301.5897-15286-1144045463-1202227021@seznam.cz> <47AB6847.4000405@bspu.unibel.by>
Reply-To: mahatma@eu.by
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------090209070707040705060800"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <47AB6847.4000405@bspu.unibel.by>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org

This is a multi-part message in MIME format.
--------------090209070707040705060800
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Something like this (average (TOO average) timeout, untested!)

Dzianis Kahanovich wrote:

>> i would like to use connlimit module, but i don't know which version 
>> of patch-o-matic should i use on which version of kernel and iptables. 
>> Could someone help me?
>> Thanks a lot

> Latest kernel & iptables. Connlimit now inside of kernel.

> PS But I lazy think about patch of connlimit to bound timeout. While 
> users using keep-alive connections - there are too abstract 
> classification (I use slowdown "abusers"). IMHO it is easy (in entry 
> listing add one "if" with existing "timeout" field, but I use proxy too 
> and first timout need for proxy, then I do not do nothing while - I do 
> not know how to do it in squid).
> 


-- 
WBR,
Denis Kaganovich,  mahatma@eu.by  http://mahatma.bspu.unibel.by

--------------090209070707040705060800
Content-Type: text/plain;
 name="connlimit-timeout.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="connlimit-timeout.diff"

--- a/net/netfilter/xt_connlimit.c	2007-10-09 23:31:38.000000000 +0300
+++ b/net/netfilter/xt_connlimit.c	2008-02-07 19:23:20.000000000 +0200
@@ -28,6 +28,8 @@
 #include <net/netfilter/nf_conntrack_core.h>
 #include <net/netfilter/nf_conntrack_tuple.h>
 
+int connlimit_timeout = 10*60*HZ; /* 10 sec */
+
 /* we will save the tuples of all connections we care about */
 struct xt_connlimit_conn {
 	struct list_head list;
@@ -103,7 +105,8 @@ static int count_them(struct xt_connlimi
 		      const struct nf_conntrack_tuple *tuple,
 		      const union nf_conntrack_address *addr,
 		      const union nf_conntrack_address *mask,
-		      const struct xt_match *match)
+		      const struct xt_match *match,
+		      const unsigned long timeout)
 {
 	struct nf_conntrack_tuple_hash *found;
 	struct xt_connlimit_conn *conn;
@@ -130,6 +133,7 @@ static int count_them(struct xt_connlimi
 			found_ct = nf_ct_tuplehash_to_ctrack(found);
 
 		if (found_ct != NULL &&
+		    abs(found_ct->timeout.expires-timeout)<connlimit_timeout &&
 		    nf_ct_tuple_equal(&conn->tuple, tuple) &&
 		    !already_closed(found_ct))
 			/*
@@ -210,7 +214,7 @@ static bool connlimit_match(const struct
 	}
 
 	spin_lock_bh(&info->data->lock);
-	connections = count_them(info->data, tuple_ptr, &addr, &mask, match);
+	connections = count_them(info->data, tuple_ptr, &addr, &mask, match, ct->timeout.expires);
 	spin_unlock_bh(&info->data->lock);
 
 	if (connections < 0) {

--------------090209070707040705060800--
