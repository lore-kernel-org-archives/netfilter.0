From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: owner based routing
Date: Tue, 11 Oct 2005 09:07:19 -0500
Message-ID: <200510110907.19845.rob0@gmx.co.uk>
References: <379640488.20051011175704@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <379640488.20051011175704@gmail.com>
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

On Tuesday 2005-October-11 08:57, Ignatich wrote:
> Since ipt_owner does not work in PREROUTING chain and fwmark is
> pointless, I thought that ipt_ROUTE from p-o-m can help me.

Why is fwmark pointless?

> Any ideas how to solve my problem?

I would try -j MARK --set-mark $UID for your -m owner matched packets 
and use a ip rule / ip route combination. I've not done this, but I 
don't see why it wouldn't work.
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

