From: Stack Buffer <black_merkury@yahoo.com>
Subject: POM woes
Date: Wed, 24 Sep 2003 14:11:59 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030924211159.64026.qmail@web60101.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Greetings Nox,
Thank u very much for the advice.
I recently tried checking out what this POM stuff was
all about and to see if I could apply any patches.
Well I did according to what the Netfilter Extension
HOWTO instructed, namely:

1). Get the latest CVS tree, by doing (taken from
HOWTO)..

# cvs -d :pserver:cvs@pserver.netfilter.org:/cvspublic
login

(When it asks you for a password type `cvs').

# cvs -d :pserver:cvs@pserver.netfilter.org:/cvspublic
co netfilter/userspace netfilter/patch-o-matic

2). Second I did the following to state my kernel src
dir..

# export KERNEL_DIR=/usr/src/linux-2.4.20-8

3). # cd /usr/src/linux/
    # make dep

4)# ./runme extra

Actually my problem is at stage 4, the output says..

Do you want to apply this patch [N/y/t/f/a/r/b/w/q/?]
y
Testing patch submitted/03_2.4.21.patch...
Failed to patch copy of /usr/src/linux-2.4.20-8/
TEST FAILED: patch NOT applied.

[Press enter to continue]....

 As u can see somethng is wrong, even worse when press
return it just keeps cycling thru the same above entry
:( . Is the patch number somehow related to my kernel
version number??. What can I do from here
I would really appreciate any help on the above.
Thanking u for ur time
Stack..

__________________________________
Do you Yahoo!?
Yahoo! SiteBuilder - Free, easy-to-use web site design software
http://sitebuilder.yahoo.com

