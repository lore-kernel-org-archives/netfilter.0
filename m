From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: removing black listed ip
Date: Sat, 10 Apr 2010 22:33:36 +0530
Message-ID: <z2xcfeab66d1004101003j5eb39eb1t38ec3b31ce3ce4b@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:received:message-id
         :subject:from:to:content-type;
        bh=UA6U/gto1onLTyeY1G3oHq4ypCIiFnGnbfNp2PjcXTA=;
        b=snYkqcTKcEtj9ciG1UMQtB0GM7JLHG4U55a5G+EcwsqU0vX+j8LsrGlXQfhKwwcED4
         CeVGpw1nMhNS1wxEkkIRSQJVIlxl+xy4L4NHU3wiQtiJwKf4zv76cCi+VoKCYTWqPQxc
         dM9I74L/l1Zmx7YkC77Bhdu7mmB6yDLEP8eXQ=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi ,

 I need to remove black listed ip if   last seen packet is  x time
ago  . I have changed code , but here it is comparing with first seen
packet time . i need to compare last seen packet .

**************************************************************************************************

--- xt_recent.c.old	2010-04-11 03:51:10.000000000 +0530
+++ xt_recent.c	2010-04-11 03:50:06.000000000 +0530
@@ -113,12 +113,13 @@
 	       (ip_list_hash_size - 1);
 }

+static void recent_entry_remove(struct recent_table *, struct recent_entry *);
 static struct recent_entry *
 recent_entry_lookup(const struct recent_table *table,
 		    const union nf_inet_addr *addrp, u_int16_t family,
 		    u_int8_t ttl)
 {
-	struct recent_entry *e;
+	struct recent_entry *e ,*next;
 	unsigned int h;

 	if (family == NFPROTO_IPV4)
@@ -126,7 +127,17 @@
 	else
 		h = recent_entry_hash6(addrp);

-	list_for_each_entry(e, &table->iphash[h], list)
+	
+          list_for_each_entry_safe(e,next , &table->iphash[h], list) {
+          if (e->family == family && (jiffies - e->stamps[0] > 10000 )  ) {
+                       printk("\n Removing one entry  %lu  %lu \n" ,
e->stamps[0] ,jiffies);
+                       printk(KERN_INFO "\nRemoving  ip entry:
%d.%d.%d.%d\n", NIPQUAD(e->addr));
+                      recent_entry_remove(table, e);
+                      }
+
+          }
+
+        list_for_each_entry(e, &table->iphash[h], list)
 		if (e->family == family &&
 		    memcmp(&e->addr, addrp, sizeof(e->addr)) == 0 &&
 		    (ttl == e->ttl || ttl == 0 || e->ttl == 0))
@@ -178,6 +189,10 @@
 		e->nstamps = e->index;
 	e->index %= ip_pkt_list_tot;
 	list_move_tail(&e->lru_list, &t->lru_list);
+
+
+
+
 }

 static struct recent_table *recent_table_lookup(const char *name)


***************************************************************************************
