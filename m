From: Henrik Nordstrom <hno@marasystems.com>
Subject: Re: Possible Bug? /proc/net/ip_tables_targets listing problem?
Date: Mon, 10 Oct 2005 02:40:19 +0200 (CEST)
Message-ID: <Pine.LNX.4.61.0510100230390.32235@filer.marasystems.com>
References: <434845cc.3c4ac938.1fcf.ffffeab3@mx.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <434845cc.3c4ac938.1fcf.ffffeab3@mx.gmail.com>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Rob M <c4blem0nkey@gmail.com>
Cc: netfilter@lists.netfilter.org

On Sat, 8 Oct 2005, Rob M wrote:

> Issue:  When you cat out `/proc/net/ip_tables_targets' the MARK target is
> listed twice

Correct. This because it exists in two different versions depending on 
which version of the iptables userspace program you use.

It's not a bug, but maybe a misfeature.

Regards
Henrik

