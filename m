From: Patrick Schaaf <bof@bof.de>
Subject: Re: detection of the third tcp packet in a tcp connection setup
Date: Thu, 27 Jun 2002 22:11:41 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020627221141.G2890@oknodo.bof.de>
References: <20020627193043.UMUP19225.mta07-svc.ntlworld.com@there> <NJEFLNJDIFFNMHDEBKMJEEJBDOAA.jpatterson@asgardgroup.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <NJEFLNJDIFFNMHDEBKMJEEJBDOAA.jpatterson@asgardgroup.com>; from jpatterson@asgardgroup.com on Thu, Jun 27, 2002 at 03:50:49PM -0400
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Patterson <jpatterson@asgardgroup.com>
Cc: netfilter@lists.samba.org

> Other than order I don't see any way to distinguish the first ack from
> the 100th.

If perfect recognition is neccessary, a suitable in-kernel module would
be able to remember there are sequence numbers from the SYNs (conntrack
already does that), and pinpoint that ACK by looking at its sequence
numbers, seeing that they are next to the one from the SYNs.

> Now, you could say that if the tcp data length is greater than zero, then
> the packet is either *not* valid, or is *not* the third packet (although
> there was at one point a proposed tcp-like protocol that had data in the
> third packet, to keep down latency on short duration sessions, but I believe
> it's still considered evil in tcp-land).

That was called T/TCP, there were some problems hindering wide deploying,
if I remember correctly - and it would have permitted sending data already
along with the SYN packets, the third ACK having also a FIN, and thus
a full request/response connection in three packets.

best regards
  Patrick

