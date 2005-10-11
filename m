From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: owner based routing
Date: Tue, 11 Oct 2005 09:46:17 -0500
Message-ID: <200510110946.17767.rob0@gmx.co.uk>
References: <1854128681.20051011182532@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1854128681.20051011182532@gmail.com>
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

On Tuesday 2005-October-11 09:25, Ignatich wrote:
> dr> Why is fwmark pointless?
>
> It's pointless because ipt_owner does not work in PREROUTING table.
> So even if I mark packet routing decision is already made.

The mangle table OUTPUT chain is consulted before routing.

root@room101:~# iptables -vt mangle -A OUTPUT -m owner --uid-owner rob0 -j MARK --set-mark 0x80
MARK  all opt -- in * out *  0.0.0.0/0  -> 0.0.0.0/0  OWNER UID match 1000 MARK set 0x80

Did you try this?
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

