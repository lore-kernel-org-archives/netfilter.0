From: Dzianis Kahanovich <mahatma@bspu.unibel.by>
Subject: Re: NOTRACK only new connections
Date: Mon, 14 Jan 2008 14:12:10 -0200
Message-ID: <478B89DA.1010308@bspu.unibel.by>
References: <478933BA.9090906@bspu.unibel.by>
Reply-To: mahatma@eu.by
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <478933BA.9090906@bspu.unibel.by>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: 
Cc: netfilter@vger.kernel.org

Dzianis Kahanovich wrote:

Sorry. Sometimes I need idiotic posts to force my lasy ;)
Accidentally I install this (fixed month ago, but not verifyed) kernel and got 
illusion to it work. There are bugfixed patch (_patch_ bugfixed only, but 
common code works unverified and I in doubts about fixing if it will not 
work). There are current condition, use on you risc. And if you know how to 
make it works - please, say. Netfilter code are not simple :)

> I am trying to modify conntrack core + NOTRACK target to NOTRACK only
> untracked connections. First packet searching for its connection entry 
> and if
> none - no new conntrack entry created.
> 
> I use single IP for few computers - for router (only in NAT "SAME" 
> target and
> ARP to communicate with ISP) and server and want to exclude tracking for
> passing connections to server. Goal to not use IP directly on router and
> NATting it to fake IP on server are speed and DoS-stability.

--- linux-2.6.23-gentoo-r3/net/netfilter/Kconfig	2007-10-09 23:31:38.000000000 
+0300
+++ linux-2.6.23-gentoo-r3.fixed/net/netfilter/Kconfig	2007-12-11 
16:17:26.000000000 +0200
@@ -353,6 +353,12 @@
  	  If you want to compile it as a module, say M here and read
  	  <file:Documentation/kbuild/modules.txt>.  If unsure, say `N'.

+config NETFILTER_XT_TARGET_NOTRACK_NEW
+	bool "NOTRACK safe (only new)"
+	depends on NETFILTER_XT_TARGET_NOTRACK
+	help
+	  Slow but safe way to NOTRACK only new/untracked connections.
+
  config NETFILTER_XT_TARGET_TRACE
  	tristate  '"TRACE" target support'
  	depends on NETFILTER_XTABLES
--- linux-2.6.23-gentoo-r3/net/netfilter/nf_conntrack_core.c	2007-10-09 
23:31:38.000000000 +0300
+++ linux-2.6.23-gentoo-r3.fixed/net/netfilter/nf_conntrack_core.c	2007-12-11 
16:38:04.000000000 +0200
@@ -594,15 +594,26 @@
  			     dataoff, l3num, protonum, &tuple, l3proto,
  			     l4proto)) {
  		pr_debug("resolve_normal_ct: Can't get tuple\n");
+		NF_CT_STAT_INC_ATOMIC(invalid);
  		return NULL;
  	}

  	/* look for tuple match */
  	h = nf_conntrack_find_get(&tuple);
  	if (!h) {
+#ifdef CONFIG_NETFILTER_XT_TARGET_NOTRACK_NEW
+		if(skb->nfctinfo == IP_CT_NEW) {
+		    skb->nfct = &nf_conntrack_untracked.ct_general;
+		    nf_conntrack_get(skb->nfct);
+		    NF_CT_STAT_INC_ATOMIC(ignore);
+		    return NULL;
+		}
+#endif
  		h = init_conntrack(&tuple, l3proto, l4proto, skb, dataoff);
-		if (!h)
+		if (!h) {
+			NF_CT_STAT_INC_ATOMIC(invalid);
  			return NULL;
+		}
  		if (IS_ERR(h))
  			return (void *)h;
  	}
@@ -678,7 +689,6 @@
  			       &set_reply, &ctinfo);
  	if (!ct) {
  		/* Not valid part of a connection */
-		NF_CT_STAT_INC_ATOMIC(invalid);
  		return NF_ACCEPT;
  	}

--- linux-2.6.23-gentoo-r3/net/netfilter/xt_NOTRACK.c	2007-10-09 
23:31:38.000000000 +0300
+++ linux-2.6.23-gentoo-r3.fixed/net/netfilter/xt_NOTRACK.c	2007-12-11 
16:18:44.000000000 +0200
@@ -22,6 +22,9 @@
  	if ((*pskb)->nfct != NULL)
  		return XT_CONTINUE;

+#ifdef CONFIG_NETFILTER_XT_TARGET_NOTRACK_NEW
+	(*pskb)->nfctinfo = IP_CT_NEW;
+#else
  	/* Attach fake conntrack entry.
  	   If there is a real ct entry correspondig to this packet,
  	   it'll hang aroun till timing out. We don't deal with it
@@ -29,6 +32,7 @@
  	(*pskb)->nfct = &nf_conntrack_untracked.ct_general;
  	(*pskb)->nfctinfo = IP_CT_NEW;
  	nf_conntrack_get((*pskb)->nfct);
+#endif

  	return XT_CONTINUE;
  }




-- 
WBR,
Denis Kaganovich,  mahatma@eu.by  http://mahatma.bspu.unibel.by
