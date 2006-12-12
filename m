From: "Michael P. Brininstool" <mikepb@hoplite.org>
Subject: RE: how do I target a specific machine - not ip address?
Date: Tue, 12 Dec 2006 09:28:41 -0700
Message-ID: <008901c71e0a$99ae9450$c84f949b@nasw.ds.army.mil>
References: <elhd9c$ema$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <elhd9c$ema$1@sea.gmane.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: 'sean' <seandarcy2@gmail.com>, netfilter@lists.netfilter.org

>I thought about putting the laptop's MAC address in the packet, and 
>using mac-source, but I've it seems to MAC address is stripped out over 
>the internet.

I think you misunderstand how the mac address is used.

Your data is broken into chunks and wrapped with TCP headers containing port
numbers, these chunks are wrapped in IP headers containing IP addrs.  Those
chunks of data are wrapped in ethernet headers containing MAC addrs.  The
ethernet headers are only valid on the current LAN segment or collision
domain.  As soon as the ethernet wrapped "frame" is received at some device
that speaks ethernet (like a gateway router), the ethernet headers (wrapper)
are removed and discarded.  The IP wrapped data will be RE-WRAPPED in
ethernet headers valid for the segment on the other side of the router.
This continues until the data reaches the destination.  There is no way to
preserve the MAC address when the destination is not in the same collision
domain unless you want to invent your own tunneling protocol.



