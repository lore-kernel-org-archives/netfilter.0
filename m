From: Fabrice MARIE <fabrice@netfilter.org>
Subject: Re: length match problem
Date: Thu, 9 Jan 2003 10:39:44 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200301091039.44259.fabrice@netfilter.org>
References: <3E1CA2BF.6050707@boh.de>
Reply-To: fabrice@netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3E1CA2BF.6050707@boh.de>
Content-Disposition: inline
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
To: Jackfritt <jackfritt@boh.de>
Cc: netfilter@lists.netfilter.org


Hello Joerg,

On Thursday 09 January 2003 06:14, Jackfritt wrote:
> Ok I have the following problem.
> iptables -A OUTPUT -o ppp0 -p tcp -m length --length :40 -j MARK --set-mark 10
> That should mark all ACK's or not ?
> When I try to do this I get the error:
> iptables: Invalid argument
> [...]
> So now my question is what am I doin wrong ?

Typically when the only error message from iptables
is 'Invalid Argument', the actual error message would
be most of the time in the kernel log.
i.e. If I run your command above, it tells me

# dmesg
MARK: can only be called from "mangle" table, not "filter"

So, you should be using a -t mangle in front..

Have a nice day,

Fabrice.
--
Fabrice MARIE

"Silly hacker, root is for administrators"
       -Unknown

