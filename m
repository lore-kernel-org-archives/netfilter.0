From: Chris Brenton <cbrenton@chrisbrenton.org>
Subject: Re: Change iptables log format (would be a nice feature)
Date: 06 Oct 2003 12:12:26 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1065456746.1189.32.camel@valhalla>
References: <Pine.LNX.4.56L0.0310021637520.11122@sutsko.kollegie.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.56L0.0310021637520.11122@sutsko.kollegie.dk>
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
To: "Lasse B. Jensen" <gymer@odense.kollegienet.dk>
Cc: netfilter@lists.netfilter.org

On Thu, 2003-10-02 at 10:40, Lasse B. Jensen wrote:
>
> Is it possible to change the log format of iptables?

As others have pointed out this is not possible, however it might make a
nice feature to be added in. I've noticed that in high bandwidth
environments what chokes throughput the most is logging. This
materializes as the boxes throughput topping out quicker as well as
garbled/partial log entries being written.

I *strongly* feel that one of Netfilter's biggest strengths is the level
of detail in the logs and would hate to see that change. When your
pushing high speeds however, your choices come down to collecting
verbose info (and thus limiting throughput) or not collecting log
entries. An option that permits a terse log format (say IPs, ports &
transport only) might be a nice balance.

Just my $.02,
Chris



