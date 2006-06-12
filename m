From: Tommy W <tommy@svearike.sytes.net>
Subject: libiptc linking problem under AMD64
Date: Mon, 12 Jun 2006 02:30:19 +0200
Message-ID: <200606120230.20148.tommy@svearike.sytes.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

Hi,
I'm writing an application that uses libiptc and iptables for various
monitoring applications.

http://www.freshmeat.net/projects/natstat

and I've come upon a small problem with libiptc on AMD64

It won't link into my program, because of lack of the flag -fPIC during
compile time.

I edited the Makefile for libiptc and put -fPIC in there, voila, everything
worked.
So my questions now are:

* is there a reason for not having -fPIC ?
* could you add -fPIC ?

Thanks in advance
/Tommy Wallberrg

-------------------------------------------------------

