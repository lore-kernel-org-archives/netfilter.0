From: "Robert Czechonski" <mlody@elpec.com>
Subject: compiling iptables 1.2.6a and kernel 2.4.26 problem
Date: Tue, 6 Jul 2004 10:35:26 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3739.80.51.249.26.1089102926.squirrel@www.elpec.com>
Reply-To: mlody@elpec.com
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

I have error as follow:

<--
cc -O2 -Wall -Wunused -I/usr/src/linux-2.4.26/include -Iinclude/ -
DNETFILTER_VERSION=\"1.2.6a\"  -fPIC -o extensions/libipt_ECN_sh.o -c 
extensions/libipt_ECN.c
extensions/libipt_ECN.c: In function `parse':
extensions/libipt_ECN.c:51: `IPT_ECN_OP_REMOVE' undeclared (first use in 
this function)
extensions/libipt_ECN.c:51: (Each undeclared identifier is reported only 
once
extensions/libipt_ECN.c:51: for each function it appears in.)
extensions/libipt_ECN.c: In function `print':
extensions/libipt_ECN.c:82: `IPT_ECN_OP_REMOVE' undeclared (first use in 
this function)
extensions/libipt_ECN.c: In function `save':
extensions/libipt_ECN.c:99: `IPT_ECN_OP_REMOVE' undeclared (first use in 
this function)
extensions/libipt_ECN.c:103: warning: deprecated use of label at end of 
compound statement
<--

could you help me, where I got wrong...

-- 

Robert


