From: Fabrice MARIE <fabrice@celestix.com>
Subject: Re: quota and time patch.
Date: Fri, 27 Sep 2002 11:27:03 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200209271127.03831.fabrice@celestix.com>
References: <F91y07vQONDZsbg5YX600007f11@hotmail.com>
Reply-To: fabrice@celestix.com
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <F91y07vQONDZsbg5YX600007f11@hotmail.com>
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
To: SB CH <chulmin2@hotmail.com>, netfilter@lists.netfilter.org


Hello,

On Friday 27 September 2002 10:30, SB CH wrote:
> Hello all.
> I would like to limit the traffic usage per user
> using iptables extension function, quota and time.
> for example, I would like to set like this.
> one can use 10M http traffic per hour per one IP address at business
> time(09h~18h).
> Is it possible to set using iptables?
> thanks in advance.

The problem with the current iptables framework is that you cannot
"auto-remove" rules dynamically. For example, the quota match will
increase the used-up quota, until the limit is reached, after which
the rule will stop matching. However the quota rule will not go away
by itself, and cannot be made so. So as things are right now, no, you
cannot do what you want.

It would be easy enough however to modify the source of the quota match to implement
quota per hour with a quota that would reset once the new time slice starts.

Have a nice day,

Fabrice.
--
Fabrice MARIE
Senior R&D Engineer
Celestix Networks
http://www.celestix.com/

"Silly hacker, root is for administrators"
       -Unknown

