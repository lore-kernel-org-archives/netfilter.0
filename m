From: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
Subject: ISCS new release
Date: Tue, 21 Jun 2005 16:48:00 -0400
Message-ID: <1119386880.6934.50.camel@jasiiitosh.nexusmgmt.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: Netfilter users list <netfilter@lists.netfilter.org>

For those who have been following the ISCS project, we made a new pre-
alpha release today.  Although it is pre-alpha with much missing
functionality, this version has been heavily tested in production. We
needed the iptables rule generator for a project involving roughly 7000
rules.  We didn't want to do that by hand!

Thus, we have completely rewritten the broken threaded update code,
corrected any rule creation errors and should have a reasonably robust
iptables section.  Source can be downloaded from the project page at
http://sourceforge.net/projects/iscs

We do hope this is an indication the project will move forward after an
far too long hiatus.  If anyone is interested in helping, we can use all
the help we can get.  We particularly need SQL expertise at this time.

For those unfamiliar with ISCS, it is not a rule creator but rather a
security environment creator for large deployments of network security
systems - John
-- 
John A. Sullivan III
Open Source Development Corporation
+1 207-985-7880
jsullivan@opensourcedevel.com

Financially sustainable open source development
http://www.opensourcedevel.com


