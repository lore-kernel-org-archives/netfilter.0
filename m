From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: Re: Couple More Questions
Date: Thu, 30 Oct 2003 14:06:43 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0310301405390.19227-100000@localhost.localdomain>
References: <1067540253.2895.44.camel@main.tqmcube.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1067540253.2895.44.camel@main.tqmcube.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David C. Hart" <DCH@TQMcube.com>
Cc: iptables mailing list <netfilter@lists.netfilter.org>

On Thu, 30 Oct 2003, David C. Hart wrote:

> I've read the tutorial but a couple of doubts linger.
> 
> 1. Since I'm only logging rejected packets, any suggestions on getting
> name resolution into the log?

you don't need to log only rejected packets.  logging represents a
"non-terminating" rule.  you can log packets and they will continue
to be processed by subsequent rules until you decide what you want
to do with them.

rday


