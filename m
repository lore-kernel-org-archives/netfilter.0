From: Micheal Scofield <dtsmedia@easynet.co.uk>
Subject: libipq
Date: Tue, 14 Aug 2007 21:33:12 +0400
Message-ID: <1187112792.5915.9.camel@linux.site>
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
To: netfilter@lists.netfilter.org

I'm trying to use the libipq fucntions such as ipq_create_handle in C,
but I keep getting the error 

too many arguments to function `ipq_create_handle'

I tried downloading the latest libnetfilter_queue files by wget-ing it,
and I can see after "./configure"ing, "make"ing and "make install"ing it
that there is a new libipq.h file with 2 arguments for the function
"ipq_create_handle", but I'm not sure how to successfully get those into
my include files. I tried "cp"ing it, but that ended up with more errors
after I compiled.

Luckily I kept a backup of the old libipq.h file and put it back... It
was a stupid idea, I know. but what am I supposed to do to use the
updated functions.

Your help is grately apreeshiated.


