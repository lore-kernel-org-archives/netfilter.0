From: "Rob Sterenborg" <rsterenborg@xs4all.nl>
Subject: RE: Translating between local and global IP address
Date: Wed, 22 Jan 2003 21:18:06 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <GOEDLKDBKHLHGAKAGFGKEEGMLMAA.rsterenborg@xs4all.nl>
References: <853cnlb0bf.fsf@junk.nocrew.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <853cnlb0bf.fsf@junk.nocrew.org>
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

> The game is Age of Mythology.

Mm. Don't know if you need a helper. Can't find anything on it.

> I want packets originating from internet to $OUT to be
> accepted by the
> gateway and redirected to $IN.  Without the ifconfig, the gateway
> appears to accept only packets to itself.

Yes.
The gateway has 2 IP addresses, 1 public ($OUT) and 1 private ($IN).
From the internet you can't reach $IN  (nor any host in your LAN)
unless you use NAT or have multiple public IP's to assign to hosts in
your LAN.

> I want the gateway to have an IP address of its own, distinct from
> $OUT.

I don't see the point in "appearing to come from another IP", because
reply packets would not reach you anymore (private IP), or you'd have
asymmetric routing (2nd public IP).

Or maybe someone should tell me what I'm missing that makes sense of
it.


Rob.


