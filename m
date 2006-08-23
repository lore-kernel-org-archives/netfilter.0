From: "Pablo Sanchez" <pablo@blueoakdb.com>
Subject: P-O-M  - cvs server down?
Date: Wed, 23 Aug 2006 11:37:33 -0400
Message-ID: <001d01c6c6ca$0dd2cc90$9e0110ac@chaussy>
References: <44EB5BCA.2010504@dmusyd.edu>
Reply-To: pablo@blueoakdb.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <44EB5BCA.2010504@dmusyd.edu>
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

Is the cvs server down?  From two machines on different ISP's (one in Canada
and the other in Columbia) I've tried to check out netfilter in order to run
P-O-M and I'm getting 'connection refused'  I can ping
'pserver.netfilter.org' which leads me to believe the cvs server isn't
running:

% cvs -d :pserver:cvs@pserver.netfilter.org:/cvspublic login
Logging in to :pserver:cvs@pserver.netfilter.org:2401/cvspublic
CVS password:
cvs [login aborted]: connect to pserver.netfilter.org(213.95.27.115):2401
failed: Connection refused

I'm following the information found on:

http://www.netfilter.org/documentation/HOWTO//netfilter-extensions-HOWTO-2.h
tml#ss2.1

Which worked before.  :)

Cheers,
---
Pablo Sanchez - Blueoak Database Engineering, Inc
Ph:    819.459.1926          Toll free:  888.459.1926
Cell:  819.918.9731                Pgr:  pablo_p@blueoakdb.com
Fax:   603.720.7723 (US)


