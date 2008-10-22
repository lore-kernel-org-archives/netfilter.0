From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: [ANNOUNCE] conntrack-tools 0.9.8 released
Date: Wed, 22 Oct 2008 15:15:02 +0200
Message-ID: <48FF2756.4000804@netfilter.org>
References: <48FE2CA5.3050004@netfilter.org>	 <5b19ed110810220325y2c44e00dhbb42dddf56ff88bc@mail.gmail.com>	 <48FF0A29.90708@netfilter.org> <5b19ed110810220524q4f5520a3r58bc02d89ccb69a2@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------040801010209080702030906"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <5b19ed110810220524q4f5520a3r58bc02d89ccb69a2@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Karel Rericha <karel@maxtel.cz>
Cc: netfilter@vger.kernel.org

This is a multi-part message in MIME format.
--------------040801010209080702030906
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Karel Rericha wrote:
> 2008/10/22 Pablo Neira Ayuso <pablo@netfilter.org>:
> 
>> When you mean "delete all marks", you refer to resetting the connection
>> marks to zero? This command should be enough.
> 
> Yes, resetting all marks to zero, sry for not being clear enough.

Never mind.

>> # conntrack -U -m 0

This is only supported by conntrack-tools >= 0.9.7 as you have noticed.

> Works great from conntrack-tools 0.9.7 (0.9.6 complains about missing
> parameters), "man conntrack" does not show -U command and thats why I
> missed it. "conntrack --help" shows much more information.

I have committed the following patch. Thank you for the report.

-- 
"Los honestos son inadaptados sociales" -- Les Luthiers

--------------040801010209080702030906
Content-Type: text/plain;
 name="x"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="x"

diff --git a/conntrack.8 b/conntrack.8
index bfb2de0..cbf8434 100644
--- a/conntrack.8
+++ b/conntrack.8
@@ -1,4 +1,4 @@
-.TH CONNTRACK 8 "May 6, 2007" "" ""
+.TH CONNTRACK 8 "Oct 22, 2008" "" ""
 
 .\" Man page written by Harald Welte <laforge@netfilter.org (Jun 2005)
 .\" Maintained by Pablo Neira Ayuso <pablo@netfilter.org (May 2007)
@@ -14,6 +14,8 @@ conntrack \- command line interface for netfilter connection tracking
 .br
 .BR "conntrack -I [table] parameters"
 .br
+.BR "conntrack -U [table] parameters"
+.br
 .BR "conntrack -E [table] parameters"
 .br
 .BR "conntrack -F [table]"
@@ -62,6 +64,9 @@ Delete an entry from the given table.
 .BI "-I, --create "
 Create a new entry from the given table.
 .TP
+.BI "-U, --update "
+Update an entry from the given table.
+.TP
 .BI "-E, --event "
 Display a real-time event log.
 .TP

--------------040801010209080702030906--
