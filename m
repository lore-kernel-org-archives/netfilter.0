From: Maciej Soltysiak <solt@dns.toxicfilms.tv>
Subject: Re: Total data limiting
Date: Fri, 17 Jan 2003 18:48:10 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.51.0301171840460.13600@dns.toxicfilms.tv>
References: <Pine.LNX.4.40.0301170955110.5759-100000@wolfman.lanl.gov>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.40.0301170955110.5759-100000@wolfman.lanl.gov>
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
To: asclark <asclark@lanl.gov>
Cc: netfilter@lists.netfilter.org

> When X amount of data reaches a certain limit, say 50mb then the
> netfilter box drops all further connections from Node A for a specified
> period of time, say 12 hours.
You could use the 'quota' and 'recent' matches.
Look for them in patch-o-matic

> Is this possible with netfilter? would this be something better suited to
> Squid or even perhapse some of the ip and traffic shaping stuff?
I am not sure if squid has options to do time based acl.
Traffic shaping does traffic shaping, not time based acls.
Anyway traffic shaper should have other means of measuring the time, from
an other source, like a netfilter match.

Regards,
Maciej Soltysiak


