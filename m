From: Mike Machado <mike@innercite.com>
Subject: Re: pptp-conntrack-nat
Date: 11 Jun 2003 18:14:07 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1055380447.20003.28.camel@rocket.innercite.com>
References: <1055376249.20254.16.camel@rocket.innercite.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1055376249.20254.16.camel@rocket.innercite.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

There appears to be something that affects more than just the MASQUERADE
target. For shitz and gigglez I tried changing the rule to

iptables -t nat -A POSTROUTING -s 192.168.1.0/24 -o eth0 -j REJECT

and got the same Invalid Argument. I then tried -j DROP and that worked.
ipt_REJECT is also loaded, so is it possible that the pptp-conntrack-nat
patches changes some internal nat structures or code that is not
allowing the other ipt_ modules to function?

Just to be thorough, did a fresh cvs update I applied all the pending
patches, and got the same thing. 

On Wed, 2003-06-11 at 17:04, Mike Machado wrote:
> I used CVS/POM and patched my vanilla 2.4.20 kernel to include support
> for ip_conntrack_pptp and ip_nat_pptp, but after I do this, the
> MASQUERADE target no longer works. lsmod shows both modules load
> successfully as well as the ipt_MASQUERADE, but when I run my nat rule:
> 
> iptables -t nat -A POSTROUTING -s 192.168.1.0/24 -o eth0 -j MASQUERADE
> 
> it just says Invalid Argument. I have two identical kernels, one with
> the pptp patch applied, one without, and the one without allows the
> MASQUERADE target just fine. Is there a known bug with the latest CVS
> pptp-conntrack-nat patch interfearing with masquerading? Thanks.
-- 
Mike Machado
mike@innercite.com
InnerCite Inc.
Engineering Director / CTO


