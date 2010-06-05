From: David Favro <netfilter@meta-dynamic.com>
Subject: [PATCH libnetfilter_queue 3/3] Added .gitignore for base directory.
Date: Sat,  5 Jun 2010 13:40:20 +0700
Message-ID: <1275720020-14058-3-git-send-email-netfilter@meta-dynamic.com>
References: <1275720020-14058-1-git-send-email-netfilter@meta-dynamic.com>
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1275720020-14058-1-git-send-email-netfilter@meta-dynamic.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org
Cc: pablo@netfilter.org, David Favro <netfilter@meta-dynamic.com>


Signed-off-by: David Favro <netfilter@meta-dynamic.com>
---
 .gitignore |   17 +++++++++++++++++
 1 files changed, 17 insertions(+), 0 deletions(-)
 create mode 100644 .gitignore

diff --git a/.gitignore b/.gitignore
new file mode 100644
index 0000000..99e943d
--- /dev/null
+++ b/.gitignore
@@ -0,0 +1,17 @@
+doxygen.cfg
+doxygen
+
+config.guess
+config.log
+config.sub
+config.status
+configure
+autom4te.cache
+libtool
+ltmain.sh
+missing
+install-sh
+depcomp
+aclocal.m4
+
+libnetfilter_queue.pc
-- 
1.7.0.4

