From: Sheldon Hearn <sheldonh@starjuice.net>
Subject: Re: CONNMARK restore-mark creates conntrack entry?
Date: Fri, 09 Jul 2004 16:28:49 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1089383329.2844.34.camel@axl.seasidesoftware.co.za>
References: <1085752508.16078.44.camel@axl.seasidesoftware.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1085752508.16078.44.camel@axl.seasidesoftware.co.za>
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
To: netfilter@lists.netfilter.org


I'm answering my own post for the archives.

On Fri, 2004-05-28 at 15:55, Sheldon Hearn wrote:

> It seems that, in linux-2.6.5 w/ CONNMARK from patch-o-matic 20040302,
> the CONNMARK --restore-mark modifier causes a conntrack entry to be
> created if it doesn't already exist.
> 
> I'm using CONNMARK to remember customer-initiated connections and route
> them differently from "wild world"-initiated connections.  I don't want
> to mark "wild world"-initiated connections, because a SYN flood then
> becomes a trivial way to DOS the conntrack table, and thus the firewall.
> 
> Any idea how to stop this happening?

You can prevent certain packets from creating a conntrack table entry
with the "raw" patch, which adds a raw table, a NOTRACK target and an
UNTRACKED state match.

Available in pom-ng, as of at least 20040631.

Ciao,
Sheldon.


