From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: iptables -L *very* slow
Date: Mon, 17 Feb 2003 01:25:59 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200302170125.59252.netfilter@newkirk.us>
References: <3E5074CF.90904@mega-bucks.co.jp>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3E5074CF.90904@mega-bucks.co.jp>
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
To: Jean-Christian Imbeault <jc@mega-bucks.co.jp>, netfilter@lists.netfilter.org

On Monday 17 February 2003 12:36 am, Jean-Christian Imbeault wrote:
> When I try and print out my iptable rules using iptables -L, it takes
> about three minutes for the rules to print out (and there are only 9
> of them).
>
> Why is does this take so long? Is this a bug?
>
> I am using the newest version of iptables with a custom 2.4.20 kernel.

You'll probably have nearly instant listing with "iptables -n -L".  My=20
guess is that it is taking all that time trying to resolve IP's in your=20
rules to actual hostnames.  That lookup process is bypassed with the=20
"-n" switch, to use numbers instead of names.

The root cause is a little deeper.  Either an IP cannot be resolved, or=20
it is taking an unusually long time to resolve.  The latter might be=20
caused by flawed DNS configuration at your end, or at the DNS for the=20
machine in question.

j


