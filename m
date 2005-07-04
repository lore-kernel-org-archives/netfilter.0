From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: Problem with routing decisions, and multihop
Date: Mon, 4 Jul 2005 10:10:13 -0500
Message-ID: <200507041010.13653.rob0@gmx.co.uk>
References: <45219fb00507040715442f52cf@mail.gmail.com>
	<45219fb00507040732192b77e0@mail.gmail.com>
	<200507041007.06513.rob0@gmx.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200507041007.06513.rob0@gmx.co.uk>
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

On Monday 04 July 2005 10:07, I wrote:
> Are multiple "ip route get ip.add.re.ss" commands in sequence showing
> routes out the same interface?

for X in `seq 10` ; do /sbin/ip route get $X.$X.$X.$X ; done
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

