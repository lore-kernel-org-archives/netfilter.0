From: Torsten Luettgert <t.luettgert@pressestimmen.de>
Subject: Re: Dropping Malicious Packets in -t mangle
Date: 31 Jul 2003 15:47:56 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1059659276.3107.14.camel@scaramouche.combox.de>
References: <1059631347.4280.27.camel@jasiiitosh.nexusmgmt.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1059631347.4280.27.camel@jasiiitosh.nexusmgmt.com>
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
To: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Cc: netfilter@lists.netfilter.org

On Don, 2003-07-31 at 08:02, John A. Sullivan III via COM.BOX TEMA
wrote:
> Our idea was to filter malicious packets - spoofs, ping floods,
> suspicious tcp flags - in the mangle table.  We were concerned that we
> wanted to intercept these packets before they hit the connection
> tracking table for DNAT'd devices in case someone initiated a valid
> session and then tried to turn it foul.  We also noticed that the mangle
> table was the first all packets hit.
> 
> So we jumped various, possibly malicious, packets from -t mangle
> PREROUTING to -t mangle ProtectionMangle where they are examined for
> possible malice.  Are we being foolish or is this the best place to weed
> out possible problems?

I'm using that chain (mangle/PREROUTING) for exactly this kind of
stuff on all my servers.

Indeed, I sometime fantasize about writing a single netfilter match
which contains these matches, thus increasing performance. Probably,
I'd just extend unclean, which already is a kind of unified trash
matcher, and a good one.

So no, you're not being foolish, but not doing "something of
extraordinary creativity" either, I'm afraid ;-)

- Torsten


