From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: Re: new iptables user - default options
Date: Tue, 28 Oct 2003 07:34:18 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0310280732100.22581-100000@localhost.localdomain>
References: <FDB52A0429DFD31196FB0008C7D972D50EA578C7@OST_EXCH_USR5>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <FDB52A0429DFD31196FB0008C7D972D50EA578C7@OST_EXCH_USR5>
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
To: "Knight, Steve" <Steve.Knight@bskyb.com>
Cc: netfilter@lists.netfilter.org

On Tue, 28 Oct 2003, Knight, Steve wrote:

> Hi there
> 
> Rh9 has installed all the default filter policies as "accept" and then
> forwards all packets from INPUT and FORWARD to a Lokkit chain.
> 
> Is this normal?  It seems to me [as a iptables n00b, although I am
> checkpoint certified] to be ok, as eventually the traffic is hitting the
> detailed lokkit chain, but is this the default install options that everyone
> gets?

it seems that it's just a philosophical difference.  you can set the
DENY policy, then explicitly accept only what you want, or as RH did,
accept everything only to pass it all to a user-defined chain that
effectively does the same thing.

personally, i'd rather see a DENY policy so that, if i somehow messed
up some of my rules, i'm more likely to be *more* restrictive than
less restrictive.  but RH's approach seems no worse, just different.

rday


