From: kate <kate7234@yahoo.com>
Subject: kb.c:179: warning: return makes integer from pointer without a cast
Date: Tue, 2 Nov 2004 18:58:26 -0800 (PST)
Message-ID: <20041103025826.22372.qmail@web21524.mail.yahoo.com>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

Hi,

I installed nessus on RH Fedora-Linux FC2 box. using
sh nessus-installer.sh

It seems to run, but I got a few error messages
including-

kb.c: In function `kb_item_addset_str':
kb.c:179: warning: return makes integer from pointer
without a cast
kb.c: In function `kb_item_addset_int':
kb.c:236: warning: return makes integer from pointer
without a cast
x -- Installing

What happened here? I understand integers and cast,
but did I omit a linux package prior to Nessus
install? Should I re-install?

guidance appreciated,
thanks in advance,
kate


		
__________________________________ 
Do you Yahoo!? 
Check out the new Yahoo! Front Page. 
www.yahoo.com 
 


