From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: conntrack idle timeout
Date: Tue, 25 Feb 2003 22:42:06 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200302252242.06586.netfilter@newkirk.us>
References: <3E5C2FE4.3010007@slamb.org>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3E5C2FE4.3010007@slamb.org>
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
To: Scott Lamb <slamb@slamb.org>, netfilter@lists.netfilter.org

On Tuesday 25 February 2003 10:09 pm, Scott Lamb wrote:
> Is there a way to control the time it takes for an idle, established
> TCP session to be purged from conntrack's state tables? I'm looking
> for the something like "ipchains -M -S". I saw at
> <http://www.syrlug.org/contrib/ipmasq.html> that there is no iptables
> equivalent, but I'm hoping it's changed since then. Maybe there's a
> sysctl or something?

/proc/sys/net/ipv4/netfilter/ip_ct_tcp_timeout_established does this, if=20
you have tcp-window-tracking from patch-o-matic installed.  However, the=20
default timeout apparently is 5 days, so I doubt this is the source of=20
the problem.

j

> The problem I'm experiencing is pretty simple. I leave ssh sessions
> open for a while (possibly several hours). I come back to them and get
> a "Connection reset by peer" error and have to open a new session.
> Back when I used ipchains, "iptables -M -S 86400 10 60" or similar
> solved the problem for me.
>
> Thanks,
> Scott Lamb


