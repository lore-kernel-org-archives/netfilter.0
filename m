From: Martin Josefsson <gandalf@wlug.westbo.se>
Subject: Re: assimetric routing & connection tracking
Date: 17 Mar 2003 13:02:15 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1047902534.748.1.camel@tux.rsn.bth.se>
References: <E18usYl-0008QQ-00@kashyyyk.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <E18usYl-0008QQ-00@kashyyyk.netfilter.org>
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
To: snake@penza-gsm.ru
Cc: Netfilter <netfilter@lists.netfilter.org>

On Mon, 2003-03-17 at 12:13, Alexey Nezhdanov wrote:
> Hello.
> 
> I have a question about subj:
> I'm intending to set up an assimetric sheme of internet connection:
> All outgouing traffic from intranet will be routed through ethernet 
> connection and some incoming traffic will come from ppp interface:
> <=-- local traffic --=>---[] <=-- eth0 -= >
>                           [] <=-- ppp0 ----
> 
> Is the connection tracking able to properly handle such disbalance?
> (rp_filter will be turned off on ppp0 since there will be no any route 
> throwgh it)

Assymetric routing in the conntrack sense means that only one direction
of the stream goes through the router. Conntrack doesn't care about
which interfaces traffic goes via. As long as both directions pass
through the same router that's using conntrack, it'll be fine.

-- 
/Martin

Never argue with an idiot. They drag you down to their level, then beat you with experience.

