From: Jim Laurino <nfcan.x.jimlaur@dfgh.net>
Subject: Re: iptables/mac address filtering question (nfcan: to exclusive)
Date: Sat, 11 Aug 2007 14:55:51 -0400
Message-ID: <1186858551l.31324l.0l@soapy>
References: <1b5f39a10708111046w55a4b00axb39c018a0ab54fb9@mail.gmail.com>
Reply-To: nfcan.x.jimlaur@dfgh.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1b5f39a10708111046w55a4b00axb39c018a0ab54fb9@mail.gmail.com>
	(from +nfcan+jimlaur+0d697027d9.jsprenkle#gmail.com@spamgourmet.com on
	Sat Aug 11 13:46:51 2007)
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

On 08/11/2007 01:46:51 PM, Jay Sprenkle - jsprenkle@gmail.com wrote:

....
> I've put in a rule in my iptables chain but notice when I try to
> connect it's rejected. The mac address I'm getting is not the same as
> what iwconfig reports on my device. If a packet is passed through
> routers on it's way to my box do they change the mac address of the
> packet?

Yes, the MAC address is lost when a packet leaves an ethernet segment.
Recall that a MAC address is how devices sharing an ethernet address each o=
ther.
Routers operate on IP addresses and do not use or preserve ethernet address=
es.
Maybe bridging, if you could do that, would preserve the MAC address.

Regards,

--=20
Jim Laurino
nfcan.x.jimlaur@dfgh.net
Please reply to the list.
Only mail from the listserver reaches this address.


