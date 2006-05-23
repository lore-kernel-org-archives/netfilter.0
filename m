From: Carlos O'Donell <carlos@codesourcery.com>
Subject: netfilter files in a case-insensitive filesystem
Date: Tue, 23 May 2006 16:27:45 -0400
Message-ID: <20060523202744.GO31607@lios>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org


netfilter,

Netfilter has header files with names that differ only in case [1].

e.g.

include/linux/netfilter_ipv4/ipt_MARK.h  
include/linux/netfilter_ipv4/ipt_mark.h

Such files conflict in a case-insensitive filesystem. This is a problem
for users building on Windows, or installing the headers on a Windows
case-insensitive filesystems.

The structures in the conflicting files seem to have unique names. Is it
possible to merge both files together? 

Comments welcome, please keep me on the CC.

Thanks!

Cheers,
Carlos.
-- 
Carlos O'Donell
CodeSourcery
carlos@codesourcery.com
(650) 331-3385 x716

[1] Netfilter has many files with names that differ only in case.

