From: Stephen Satchell <list@satchell.net>
Subject: Re: Linux kernel IP fragmentation
Date: Wed, 14 Jan 2004 20:49:11 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1074142151.4135.42.camel@ssatchell1.pyramid.net>
References: <1074102090.11499.38.camel@psylocke>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1074102090.11499.38.camel@psylocke>
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
To: Alain FORCIOLI <Alain.Forcioli@cyber-networks.fr>
Cc: netfilter@lists.netfilter.org

On Wed, 2004-01-14 at 09:41, Alain FORCIOLI wrote:
> It seems that the default linux kernel behavior, in case of IP
> fragmentation, is to start to send the last ip fragmented packet first.
> 
> Does someone can confirm this behavior ?

Depends on the situation.  Both 2.2 and 2.4 in the most common case
would send packets last to first.  Some reports here indicate that 2.6
sends them first to last.

TCPDUMP is your friend here.

Satch



