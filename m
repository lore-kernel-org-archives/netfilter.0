From: Lars Brinkhoff <lars.spam@nocrew.org>
Subject: Re: Translating between local and global IP address
Date: 23 Jan 2003 14:14:48 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <85iswg9fef.fsf@junk.nocrew.org>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Rob Sterenborg wrote:
> > I want packets originating from internet to $OUT to be accepted by
> > the gateway and redirected to $IN.  Without the ifconfig, the
> > gateway appears to accept only packets to itself.
> 
> Yes.  The gateway has 2 IP addresses, 1 public ($OUT) and 1 private
> ($IN).

No, I want the gateway to have a public address other than $OUT, and
the private address shouldn't be $IN, because that's what COMPUTER's
address.

Maybe an example help explain what I want.  Say, GATEWAY has public
address 200.1.1.1 and private address 192.168.1.1.  COMPUTER is
connected to the private network and has private address 192.168.1.2.
However, I want to make it appear that COMPUTER exists as a node on
the internet, on the same subnet as GATEWAY.  The public address of
COMPUTER should be 200.1.1.2.  When a packet to 200.1.1.2 reaches
GATEWAY, it should be NAT'ed to 192.1.1.2 and passed to COMPUTER, and
vice versa.

> > I want the gateway to have an IP address of its own, distinct from
> > $OUT.
> 
> I don't see the point in "appearing to come from another IP", because
> reply packets would not reach you anymore (private IP), or you'd have
> asymmetric routing (2nd public IP).

Yes, there is a second public IP.

