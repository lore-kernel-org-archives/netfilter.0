From: Julian Gomez <julianjose.gomez@getronics.com>
Subject: Re: Dropped/Corrupted Log Entries?
Date: Wed, 4 Aug 2004 13:55:42 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040804055542.GG1899@jgomez-p-latitude.asia.unity>
References: <20040803061936.50702.qmail@web21121.mail.yahoo.com>
Reply-To: julianjose.gomez@getronics.com
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20040803061936.50702.qmail@web21121.mail.yahoo.com>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Mon, Aug 02, 2004 at 11:19:36PM -0700, Tim Burress spoke thusly:
>Hello!
>
>We've run across a problem and I thought I would check
>to see if anyone else has seen this, or has
>suggestions for how to fix or work around it. On both
>
>Linux 2.4.21, iptables v1.2.8
>Linux 2.4.26, iptables v1.2.11-20040621
>
>When we do a very fast port scan of a system on the
>other side of a firewall with various common rules, a
>majority of the denied connection attempts are not
>showing up in the logs even though they should be, and
>depending on circumstances and versions, anywhere from
>1% to 100% of the accepted connections are also not
>being logged.

What you are seeing is an artifact of running syslog unfortunately.
There is no guarantee that you'll get all the connection attempts
logged. Truncated log entries are somewhat common also.

Dig around in Google, its quite common.

