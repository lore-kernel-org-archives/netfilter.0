From: <mlody@elpec.com>
Subject: ip_connlimit problem
Date: Wed, 16 Jun 2004 14:34:00 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <2151.80.51.249.26.1087389240.squirrel@www.elpec.com>
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

Hello
I've problem with ip_connlimit module during compilation. Kernel 2.4.26 and 
patch-o-matic-20040614

It looks like follows
<------------------
ipt_connlimit.c: In function `init':
ipt_connlimit.c:219: `ip_conntrack_module' undeclared (first use in this 
function)
ipt_connlimit.c:219: (Each undeclared identifier is reported only once
ipt_connlimit.c:219: for each function it appears in.)
ipt_connlimit.c:220: warning: value computed is not used
ipt_connlimit.c: In function `fini':
ipt_connlimit.c:227: `ip_conntrack_module' undeclared (first use in this 
function)
ipt_connlimit.c:228: warning: value computed is not used
<-------------------

I've read the post by Mark Vevers from february 2004 archive and I've 
realized that my ipt_connlimit.c looks like follows
<-------------------
static int __init init(void)
{
        /* NULL if ip_conntrack not a module */
        if (ip_conntrack_module)
                __MOD_INC_USE_COUNT(ip_conntrack_module);
        return ipt_register_match(&connlimit_match);
}

static void __exit fini(void)
{
        ipt_unregister_match(&connlimit_match);
        if (ip_conntrack_module)
                __MOD_DEC_USE_COUNT(ip_conntrack_module);
}
<---------------------

Anyone could help me?


Best regards

Robert
mlody@elpec.com


