From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Second failover failure with conntrackd - INVALID packets
Date: Sun, 25 Jan 2009 18:55:46 +0100
Message-ID: <497CA7A2.2000906@netfilter.org>
References: <497760CB.6090008@univ-nantes.fr> <49778AF4.7000201@netfilter.org> <4978425F.1030003@univ-nantes.fr> <4978A4F8.5060901@netfilter.org> <4979BA72.50405@univ-nantes.fr> <497C4440.7050809@netfilter.org>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------080606080800050104030105"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <497C4440.7050809@netfilter.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: yoann.juet@univ-nantes.fr
Cc: netfilter@vger.kernel.org

This is a multi-part message in MIME format.
--------------080606080800050104030105
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Pablo Neira Ayuso wrote:
> Yoann Juet wrote:
>> "Error parsing config file: line (190), symbol 'from': syntax error"
>>
>> I have to delete it to make starting conntrackd.
> 
> Filter From Kernelspace {
>          Protocol Accept {
>                 TCP
>          }
>          Address Ignore {
>                 IPv4_address 127.0.0.1 # loopback
>          }
> }
> 
> It works here fine. Error reporting in the parsing is not very precise
> yet, probably the problem is not in Filter but before (something is
> missing and the parser gets confused). Could you post your config file
> to reproduce it? You can send it to me in private if you want.

Sorry, you're right. There is a typo in the example files. I have
applied the following fix to the git (will be available in
conntrack-tools-0.9.10).

-- 
"Los honestos son inadaptados sociales" -- Les Luthiers

--------------080606080800050104030105
Content-Type: text/x-diff;
 name="doc3.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="doc3.patch"

doc: use 'From' instead of 'from' in the example configfiles

This patch fixes a wrong use of 'from' instead of 'From' in the
example configuration files.

Signed-off-by: Pablo Neira Ayuso <pablo@netfilter.org>
---

 doc/sync/alarm/conntrackd.conf   |    2 +-
 doc/sync/ftfw/conntrackd.conf    |    2 +-
 doc/sync/notrack/conntrackd.conf |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)


diff --git a/doc/sync/alarm/conntrackd.conf b/doc/sync/alarm/conntrackd.conf
index 39741b3..da11887 100644
--- a/doc/sync/alarm/conntrackd.conf
+++ b/doc/sync/alarm/conntrackd.conf
@@ -226,7 +226,7 @@ General {
 	# event filtering, use the keyword 'Kernelspace' instead of 
 	# 'Userspace'.
 	#
-	Filter from Userspace {
+	Filter From Userspace {
 		#
 		# Accept only certain protocols: You may want to replicate
 		# the state of flows depending on their layer 4 protocol.
diff --git a/doc/sync/ftfw/conntrackd.conf b/doc/sync/ftfw/conntrackd.conf
index 93f7a44..3c39291 100644
--- a/doc/sync/ftfw/conntrackd.conf
+++ b/doc/sync/ftfw/conntrackd.conf
@@ -235,7 +235,7 @@ General {
 	# event filtering, use the keyword 'Kernelspace' instead of 
 	# 'Userspace'.
 	#
-	Filter from Userspace {
+	Filter From Userspace {
 		#
 		# Accept only certain protocols: You may want to replicate
 		# the state of flows depending on their layer 4 protocol.
diff --git a/doc/sync/notrack/conntrackd.conf b/doc/sync/notrack/conntrackd.conf
index 39a5faa..f86d17b 100644
--- a/doc/sync/notrack/conntrackd.conf
+++ b/doc/sync/notrack/conntrackd.conf
@@ -216,7 +216,7 @@ General {
 	# event filtering, use the keyword 'Kernelspace' instead of 
 	# 'Userspace'.
 	#
-	Filter from Userspace {
+	Filter From Userspace {
 		#
 		# Accept only certain protocols: You may want to replicate
 		# the state of flows depending on their layer 4 protocol.

--------------080606080800050104030105--
