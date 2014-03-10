From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Subject: changes to nftables git repo to build docs/man pages
Date: Mon, 10 Mar 2014 12:29:47 -0400 (EDT)
Message-ID: <alpine.LFD.2.11.1403101220590.17750@localhost>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter mailing list <netfilter@vger.kernel.org>


  not sure if this is the right list to ask this on, but i wanted to
test nftables on my fedora 20 system and that required a bit of
tweaking. first, i upgraded to "rawhide" to have access to all of the
required packages (other than "nftables" itself), then checked out the
source for nftables from git://git.netfilter.org/nftables, and here's
what i ran into when i wanted to build the documentation.

  first, building the man page required the following patch:

===== start =====

diff --git a/INSTALL b/INSTALL
index ba6f7a3..88fad7c 100644
--- a/INSTALL
+++ b/INSTALL
@@ -18,7 +18,7 @@ Installation instructions for nftables

   - libreadline

-  - optional: docbook2x: required for building man-page
+  - optional: docbook2X: required for building man-page

   - optional: docbook-utils: required for building PDF man-page

diff --git a/Makefile.rules.in b/Makefile.rules.in
index ae563a5..d44eef0 100644
--- a/Makefile.rules.in
+++ b/Makefile.rules.in
@@ -37,7 +37,7 @@ configure:		configure.ac

 %.8:			%.xml	$(makedeps)
 			@echo -e "  MAN\t\t$@"
-			(cd $(SUBDIR); docbook2x-man ../$<)
+			(cd $(SUBDIR); db2x_docbook2man ../$<)

 %.pdf:			%.xml	$(makedeps)
 			@echo -e "  PDF\t\t$@"
diff --git a/configure.ac b/configure.ac
index b91bbac..7324dba 100644
--- a/configure.ac
+++ b/configure.ac
@@ -25,10 +25,10 @@ AC_PROG_MKDIR_P
 AC_PROG_INSTALL
 AC_PROG_SED

-AC_CHECK_PROG(CONFIG_MAN, docbook2x-man, y, n)
+AC_CHECK_PROG(CONFIG_MAN, db2x_docbook2man, y, n)
 if test "$CONFIG_MAN" != "y"
 then
-	AC_MSG_WARN([docbookx2-man not found, no manpages will be built])
+	AC_MSG_WARN([db2x_docbook2man not found, no manpages will be built])
 fi

 AC_CHECK_PROG(CONFIG_PDF, db2pdf, y, n)

===== end =====

since, in the current rawhide version of fedora, the command is now
"db2x_docbook2man" from the "docbook2X" package.

  related to that, the (fedora) package for PDF generation should be
"docbook-utils-pdf", not just "docbook-utils", so the INSTALL file
should be updated that way as well.

  finally, the man page generated appears to think the userspace
command is "nftables", not just "nft".

  is it worth submitting a patch for the above? is someone else
already taking care of this? thanks.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


