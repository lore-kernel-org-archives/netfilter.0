From: Tib <tib@tigerknight.org>
Subject: Re: use of the limiting options
Date: Tue, 25 Jan 2005 13:08:34 -0600 (CST)
Message-ID: <Pine.LNX.4.53.0501251306320.24829@altaica>
References: <Pine.LNX.4.53.0501251248340.24829@altaica>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.53.0501251248340.24829@altaica>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org


Ok.. looked at my other rules and came up with this instead.. but it still
complains:

iptables -A INPUT -i eth0 -p tcp --destination-port 22 \
--limit 6/hour --limit-burst 2

iptables v1.2.6a: Unknown arg `--limit'
Try `iptables -h' or 'iptables --help' for more information.

Help would be much appreciated :]

<EOL>
Tib


On Tue, 25 Jan 2005, Tib wrote:

>
> I'd like to use the --limit and --limit-burst options to protect my sshd
> from dictionary password attacks. Considering the userbase and activity
> level I'd say that something like this would suit me just fine.
>
> --limit 6/hour
> --limit-burst 2
>
> This would limit it to two connect/login attempts at first, and then one
> more every 10 minutes.. correct?
>
> Would this be the proper command to use? I'm trying to just limit
> connections from the outside world, not from the local network, hence the
> address as a destination:
>
> iptables -A INPUT --d 66.80.174.210 --dport 22   \
>    --limit 6/hour --limit-burst 2
>
>
> <EOL>
> Tib
>

