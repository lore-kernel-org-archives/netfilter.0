From: Roman Hoog Antink <rha@open.ch>
Subject: conntrackd: fix IPv6 address pattern
Date: Tue, 19 Mar 2013 15:36:18 +0100
Message-ID: <514877E2.9050105@open.ch>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------010305010902000709040001"
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org

This is a multi-part message in MIME format.
--------------010305010902000709040001
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi

Please consider accepting the following patch that fixes an IPv6 address
pattern in the lexical parser.

-Roman

--------------010305010902000709040001
Content-Type: text/x-patch;
 name="ipv6-conntrackd.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="ipv6-conntrackd.patch"

commit 747bb23944cca2e6927f05f60fc6fba70e187ca0
Author: James Guthrie <jag@open.ch>
Date:   Tue Mar 19 15:12:35 2013 +0100

    conntrackd: fix IPv6 address pattern
    
    The conntrackd configuration allows for IPv6 addresses to be specified that
    should be ignored (connections for which should not be synchronised). The
    Conntrackd config accepts two forms of IPv6 address:
    1: fe80::1
    2: fe80:0:0:0:0:0:0:1
    
    This patch fixes the lexical parser for form 2.
    
    Signed-off-by: Roman Hoog Antink <rha@open.ch>

diff --git a/src/read_config_lex.l b/src/read_config_lex.l
index bec2d81..b4d11d4 100644
--- a/src/read_config_lex.l
+++ b/src/read_config_lex.l
@@ -44,8 +44,8 @@ ip4		{ip4_part}\.{ip4_part}\.{ip4_part}\.{ip4_part}{ip4_cidr}?
 hex_255		[0-9a-fA-F]{1,4}
 ip6_cidr	\/[0-1]*[0-9]*[0-9]+
 ip6_part	{hex_255}":"?
-ip6_form1	{ip6_part}{0,16}"::"{ip6_part}{0,16}
-ip6_form2	({hex_255}":"){16}{hex_255}
+ip6_form1	{ip6_part}{0,7}"::"{ip6_part}{0,7}
+ip6_form2	({hex_255}":"){0,7}{hex_255}
 ip6		{ip6_form1}{ip6_cidr}?|{ip6_form2}{ip6_cidr}?
 string		[a-zA-Z][a-zA-Z0-9\.\-]*
 persistent	[P|p][E|e][R|r][S|s][I|i][S|s][T|t][E|e][N|n][T|T]

--------------010305010902000709040001--
