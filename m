From: =?iso-8859-1?q?Alpha=20Technologies?= <alphaside@yahoo.com>
Subject: ip_conntrack_core.c read not locked
Date: Mon, 16 Jun 2003 18:38:47 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030617013847.10524.qmail@web13306.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
To: netfilter@lists.netfilter.org

Hello,

I have compiled the kernel 2.4.21 and 2.4.20 but in
both i get this messanges when insert the conntrack
modules:

ASSERT ip_conntrack_core.c:629 &ip_conntrack_lock not
readlocked

Also, when i use h323 mmodule.. and everything is
going well... but if I remove the ip_nat_h323 module
the systems goes down with kernel panic.

Thanks for your help.

Att,

Pablo Tamayo

__________________________________
Do you Yahoo!?
SBC Yahoo! DSL - Now only $29.95 per month!
http://sbc.yahoo.com

