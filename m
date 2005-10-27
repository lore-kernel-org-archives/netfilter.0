From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: Forward internal packets as though they're external
Date: Thu, 27 Oct 2005 16:26:06 -0500
Message-ID: <200510271626.06383.rob0@gmx.co.uk>
References: <436051E9.2050701@jonheese.com> <4360D12E.4000509@jonheese.com>
	<200510270938.19458.rob0@gmx.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200510270938.19458.rob0@gmx.co.uk>
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

On Thursday 2005-October-27 09:38, I wrote:
> Perhaps you need a SNAT rule in POSTROUTING:

That's probably correct.

> iptables -vt nat -A PREROUTING -p tcp --dport 6969 -s 192.168.0.0/24
> \ -d 192.168.0.100 -j SNAT --to 65.9.134.4

The example, obviously, is not correct. Copy/paste/PEBKAC error.
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

