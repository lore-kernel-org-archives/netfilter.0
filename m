From: felix@crowfix.com
Subject: Re: Newbie question about NAT and forwarding
Date: Wed, 6 Sep 2006 15:59:40 -0700
Message-ID: <20060906225940.GA4082@crowfix.com>
References: <20060906205232.GA23980@crowfix.com> <ednhr3$pjc$1@sea.gmane.org>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <ednhr3$pjc$1@sea.gmane.org>
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

On Wed, Sep 06, 2006 at 06:24:34PM -0400, Danny Rathjens wrote:
> 
> Then you just need to route the smtp traffic through your dial-up.
> 
> echo 202 mail >> /etc/iproute2/rt_tables
> ip rule add fwmark 2 table mail
> ip route add default via $dialup_gateway dev eth0 table mail

I see I have mucho to learn -- I didn't even know about this
/etc/iproute2 directory.  It does look simple, but not at all what I
had thought of.  I must read up some more!

Thanks.

-- 
            ... _._. ._ ._. . _._. ._. ___ .__ ._. . .__. ._ .. ._.
     Felix Finch: scarecrow repairman & rocket surgeon / felix@crowfix.com
  GPG = E987 4493 C860 246C 3B1E  6477 7838 76E9 182E 8151 ITAR license #4933
I've found a solution to Fermat's Last Theorem but I see I've run out of room o

