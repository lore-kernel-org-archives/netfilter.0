From: Maciej Soltysiak <solt@dns.toxicfilms.tv>
Subject: Re: ip_conntrack: table full, dropping packet.
Date: Mon, 20 Jan 2003 16:13:08 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.51.0301201610400.15863@dns.toxicfilms.tv>
References: <1648.10.35.120.83.1043012159.squirrel@mail.unixpimps.org>
 <1043015513.24583.16.camel@wizardslair> <1084.10.35.120.83.1043023502.squirrel@mail.unixpimps.org>
 <1043049030.24581.76.camel@wizardslair> <1043074151.1391.39.camel@venom.int.unixpimps.org>
 <046a01c2c094$c0a61d80$13fcc5cb@Housecall>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <046a01c2c094$c0a61d80$13fcc5cb@Housecall>
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
To: hare ram <hareram@sol.net.in>
Cc: Netfiler E-Mail List <netfilter@lists.netfilter.org>

> iam getting this error
> what is the problem
The conntrack table is full and your machine can not store
more connection tracking information, as each tracked connection
takes up some memory.

Increase your
/proc/sys/net/ipv4/ip_conntrack_max

as described in the FAQ. The FAQ shows how to calculate the value
for your system.

Regards,
Maciej Soltysiak


