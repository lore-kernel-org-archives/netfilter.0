From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: libnetfilter_conntrack.so and C++
Date: Mon, 25 Sep 2006 13:18:24 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0609251317440.21631@yvahk01.tjqt.qr>
References: <2b76460a0609250151m51778379u34b0e89aecfbf219@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <2b76460a0609250151m51778379u34b0e89aecfbf219@mail.gmail.com>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: denis stauffer <denis.stauffer@gmail.com>
Cc: netfilter@lists.netfilter.org

> Hi everybody,
>
> I'm trying to develop a C++ programm wich uses
> libnetfilter_conntrack.so library. I've encountered a problem when
> linking the library : the called funtions in libnetfilter_contrack are
> not recognized.
> If some one has succeeded to use the libnetfilter_conntrack library
> with g++, please can you gve me some information about how to do it.

extern "C" {
#include <linux/netfilter.h>
#include <foo/bar.h>
}


Slightly ugly.


Jan Engelhardt
-- 

