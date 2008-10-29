From: =?ISO-8859-2?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: libxt_conntrack.c ctdir patch
Date: Wed, 29 Oct 2008 14:41:16 +0100
Message-ID: <490867FC.5090504@freemail.hu>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------070905020109080900080002"
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Netfilter list <netfilter@vger.kernel.org>, Jan Engelhardt <jengelh@medozas.de>

This is a multi-part message in MIME format.
--------------070905020109080900080002
Content-Type: text/plain; charset=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 7bit

A bit cleanup and support for ctdir...

Swifty

--------------070905020109080900080002
Content-Type: text/x-diff;
 name="libxt_contrack.c.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="libxt_contrack.c.patch"

--- extensions/libxt_conntrack.c.old	2008-09-02 06:28:38.000000000 +0200
+++ extensions/libxt_conntrack.c	2008-10-29 14:33:57.000000000 +0100
@@ -293,10 +293,9 @@
 	struct in_addr *addrs = NULL;
 
 
+	check_inverse(optarg, &invert, &optind, 0);
 	switch (c) {
 	case '1':
-		check_inverse(optarg, &invert, &optind, 0);
-
 		parse_states(argv[optind-1], sinfo);
 		if (invert) {
 			sinfo->invflags |= XT_CONNTRACK_STATE;
@@ -305,8 +304,6 @@
 		break;
 
 	case '2':
-		check_inverse(optarg, &invert, &optind, 0);
-
 		if(invert)
 			sinfo->invflags |= XT_CONNTRACK_PROTO;
 
@@ -326,8 +323,6 @@
 		break;
 
 	case '3':
-		check_inverse(optarg, &invert, &optind, 0);
-
 		if (invert)
 			sinfo->invflags |= XT_CONNTRACK_ORIGSRC;
 
@@ -346,8 +341,6 @@
 		break;
 
 	case '4':
-		check_inverse(optarg, &invert, &optind, 0);
-
 		if (invert)
 			sinfo->invflags |= XT_CONNTRACK_ORIGDST;
 
@@ -366,8 +359,6 @@
 		break;
 
 	case '5':
-		check_inverse(optarg, &invert, &optind, 0);
-
 		if (invert)
 			sinfo->invflags |= XT_CONNTRACK_REPLSRC;
 
@@ -386,8 +377,6 @@
 		break;
 
 	case '6':
-		check_inverse(optarg, &invert, &optind, 0);
-
 		if (invert)
 			sinfo->invflags |= XT_CONNTRACK_REPLDST;
 
@@ -406,8 +395,6 @@
 		break;
 
 	case '7':
-		check_inverse(optarg, &invert, &optind, 0);
-
 		parse_statuses(argv[optind-1], sinfo);
 		if (invert) {
 			sinfo->invflags |= XT_CONNTRACK_STATUS;
@@ -416,8 +403,6 @@
 		break;
 
 	case '8':
-		check_inverse(optarg, &invert, &optind, 0);
-
 		parse_expires(argv[optind-1], sinfo);
 		if (invert) {
 			sinfo->invflags |= XT_CONNTRACK_EXPIRES;
@@ -873,6 +858,14 @@
         	else
                 	printf("%lu:%lu ", sinfo->expires_min, sinfo->expires_max);
 	}
+
+	if(sinfo->flags & XT_CONNTRACK_DIRECTION) {
+		if (sinfo->invflags & XT_CONNTRACK_DIRECTION)
+			printf("%sctdir REPLY", optpfx);
+		else
+			printf("%sctdir ORIGINAL", optpfx);
+	}
+
 }
 
 static void
@@ -970,6 +963,13 @@
 			printf("%u:%u ", (unsigned int)info->expires_min,
 			       (unsigned int)info->expires_max);
 	}
+
+	if(info->match_flags & XT_CONNTRACK_DIRECTION) {
+		if (info->invert_flags & XT_CONNTRACK_DIRECTION)
+			printf("%sctdir REPLY", prefix);
+		else
+			printf("%sctdir ORIGINAL", prefix);
+	}
 }
 
 static void conntrack_print(const void *ip, const struct xt_entry_match *match,

--------------070905020109080900080002--
