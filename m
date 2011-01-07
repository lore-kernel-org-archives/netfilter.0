From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: iptables -I with interface behavior
Date: Fri, 7 Jan 2011 12:41:20 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1101071236570.26681@obet.zrqbmnf.qr>
References: <9F69795E29C890408AC2DAF646C89BB37998F4E870@MAILBOX.arc.local>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <9F69795E29C890408AC2DAF646C89BB37998F4E870@MAILBOX.arc.local>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fiedler Roman <Roman.Fiedler@ait.ac.at>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Friday 2011-01-07 12:05, Fiedler Roman wrote:

>Hello List,
>
>I have encountered an unexpected behavior using iptables on Ubuntu 
>lucid and would like to hear your opinition on it:
>
>In a custom firewall setup, I have defined variables for the various 
>interface names, I use them e.g.
>
>Iptables -A FORWARD -i  "${MyInterfaceName}"  -j FORWARD-SOMECHAIN
>
>Due to a configuration, the variable was empty, the execution of
>
>Iptables -A FORWARD -i  "" -j FORWARD-SOMECHAIN
>
>was equivalent to
>
>Iptables -A FORWARD  -j FORWARD-SOMECHAIN
>
>which would have caused a security problem. I would have expected the iptables call to
>a) fail with "empty interface name" error or

Yeah that sounds best. I see no reason to use -i "" when you can use 
(omit -i).

I'll queue this:

parent 7f8f85117831a6cd9d093492300e58ced9883baf (v1.4.10-21-g7f8f851)
commit 435c0cf63ac13d6b72e4b13c184ba831424ec9d0

iptables: abort on empty interface specification

Fiedler Roman brings to attention that if, in a faulty script,
"$some_variable" expands to an empty string, iptables should probably
catch this most likely undesired invocation. If no/all interfaces were
really desired, one can either omit -i completely, or use -i +.
---
 ip6tables.c |    8 ++++++++
 iptables.c  |    8 ++++++++
 2 files changed, 16 insertions(+), 0 deletions(-)

diff --git a/ip6tables.c b/ip6tables.c
index 84908eb..b8449f6 100644
--- a/ip6tables.c
+++ b/ip6tables.c
@@ -1573,6 +1573,10 @@ int do_command6(int argc, char *argv[], char **table, struct ip6tc_handle **hand
 
 
 		case 'i':
+			if (*optarg == '\0')
+				xtables_error(PARAMETER_PROBLEM,
+					"Empty interface is likely to be "
+					"undesired");
 			xtables_check_inverse(optarg, &invert, &optind, argc, argv);
 			set_option(&options, OPT_VIANAMEIN, &fw.ipv6.invflags,
 				   invert);
@@ -1582,6 +1586,10 @@ int do_command6(int argc, char *argv[], char **table, struct ip6tc_handle **hand
 			break;
 
 		case 'o':
+			if (*optarg == '\0')
+				xtables_error(PARAMETER_PROBLEM,
+					"Empty interface is likely to be "
+					"undesired");
 			xtables_check_inverse(optarg, &invert, &optind, argc, argv);
 			set_option(&options, OPT_VIANAMEOUT, &fw.ipv6.invflags,
 				   invert);
diff --git a/iptables.c b/iptables.c
index 2d0861c..c92f297 100644
--- a/iptables.c
+++ b/iptables.c
@@ -1590,6 +1590,10 @@ int do_command(int argc, char *argv[], char **table, struct iptc_handle **handle
 
 
 		case 'i':
+			if (*optarg == '\0')
+				xtables_error(PARAMETER_PROBLEM,
+					"Empty interface is likely to be "
+					"undesired");
 			xtables_check_inverse(optarg, &invert, &optind, argc, argv);
 			set_option(&options, OPT_VIANAMEIN, &fw.ip.invflags,
 				   invert);
@@ -1599,6 +1603,10 @@ int do_command(int argc, char *argv[], char **table, struct iptc_handle **handle
 			break;
 
 		case 'o':
+			if (*optarg == '\0')
+				xtables_error(PARAMETER_PROBLEM,
+					"Empty interface is likely to be "
+					"undesired");
 			xtables_check_inverse(optarg, &invert, &optind, argc, argv);
 			set_option(&options, OPT_VIANAMEOUT, &fw.ip.invflags,
 				   invert);
-- 
# Created with git-export-patch
