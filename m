From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: iptables LOG options
Date: Tue, 24 May 2005 09:43:19 -0500
Message-ID: <42933D87.1060501@riverviewtech.net>
References: <4292A1A7.3020401@poornam.com>
	<4292A6CF.4020904@rfgt.net>	<4292AABF.4060009@poornam.com>
	<4292B530.3070801@rfgt.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4292B530.3070801@rfgt.net>
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

> From my experience with -m owner/group (extremely limited I must admit)
> I don't think it's possible. The messages in /var/log/messages don't
> seem to have any uid information, and afaik there isn't any sort of
> variables that iptables has in to do this sort of thing.

Would it be possible to get the LOG target to log the PID of the process that tried to send the traffic out?  If this could be done it would be a relatively trivial to write a daemon that would watch the log looking for the LOG liens (presumably with a special pattern in the --log-prefix parameter as a key) and try to identify who ran the process that has the PID in question.  The only caveat that comes to mind is that process might spawn and die / close before the daemon could identify who was running it so I would be tempted to send the traffic to user space QUEUE (I think) to something that would ultimately just drop it but that could introduce a pause long enough (or do the searching it's self) for the user identification to take place?

I am in no way capable of writing such applications / daemons, but I know there are those who are.  This is just my $.02 on it.



Grant. . . .

