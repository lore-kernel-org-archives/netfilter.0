From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: IPTables Flow Chart Revision
Date: Tue, 20 Sep 2005 08:30:56 -0500
Message-ID: <200509200830.59291.rob0@gmx.co.uk>
References: <432F5B51.3070904@ynsgroup.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <432F5B51.3070904@ynsgroup.net>
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

On Monday 19 September 2005 19:44, Jim Cliver wrote:
> Just posted a revision to the Flow Chart:
>
> http://www.aptalaska.net/~jclive/IPTablesFlowChart.pdf

1. Didn't render in gv(1) for me:
Error: /invalidfileaccessESP Ghostscript 815.00: Unrecoverable error, exit code 1
 in --file--
Operand stack:
   (/home/rob0/IPTablesFlowChart.pdf)   (r)
Execution stack:
   %interp_exit   .runexec2   --nostringval--   --nostringval--   --nostringval--   2   %stopped_push   --nostringval--   --nostringval--   --nostringval--   false   1   %stopped_push   1   3   %oparray_pop   1   3   %oparray_pop   1   3   %oparray_pop   1   3   %oparray_pop   .runexec2   --nostringval--   --nostringval--   --nostringval--   2   %stopped_push   --nostringval--
Dictionary stack:
   --dict:1114/1686(

This is using a recent ESP Ghostscript, Slackware 10.2:
espgs-8.15rc3-i486-2.

2. It rendered fine using KDE's embedded PDF viewing capabilities, but
alas, I didn't see the "raw" table displayed. Otherwise I didn't really
try to pick it over for content, because that is what I was looking for
in particular. I didn't see any errors, not sure about omissions.

Thanks.
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

