From: TheGesus <thegesus@gmail.com>
Subject: Re: Performance issues
Date: Thu, 15 Sep 2005 08:43:25 -0400
Message-ID: <5e70f6530509150543119e4434@mail.gmail.com>
References: <004c01c5b966$5386e7c0$94010a0a@commtech.ie>
Reply-To: thegesus@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <004c01c5b966$5386e7c0$94010a0a@commtech.ie>
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

On 9/14/05, Ferry van Aesch <tmp123@bavirtual.org> wrote:
> Hi,
>=20
> Gents, I'm using 2.6.13-1 (same results with 2.4.27 though). I have a PII=
I 550Mhz with 4 3Com NICs:
>   Bus  0, device  12, function  0:
>     Ethernet controller: 3Com Corporation 3c905C-TX/TX-M [Tornado] (rev 1=
20).
>       IRQ 5.
>       Master Capable.  Latency=3D80.  Min Gnt=3D10.Max Lat=3D10.
>       I/O at 0xe400 [0xe47f].
>       Non-prefetchable 32 bit memory at 0xfedffc00 [0xfedffc7f].
>   Bus  0, device  14, function  0:
>     Ethernet controller: 3Com Corporation 3c905C-TX/TX-M [Tornado] (#2) (=
rev 120).
>       IRQ 10.
>       Master Capable.  Latency=3D80.  Min Gnt=3D10.Max Lat=3D10.
>       I/O at 0xf400 [0xf47f].
>       Non-prefetchable 32 bit memory at 0xfedff800 [0xfedff87f].
>   Bus  0, device  16, function  0:
>     Ethernet controller: 3Com Corporation 3c905 100BaseTX [Boomerang] (re=
v 0).
>       IRQ 9.
>       Master Capable.  Latency=3D64.  Min Gnt=3D3.Max Lat=3D8.
>       I/O at 0xe800 [0xe83f].
>   Bus  0, device  18, function  0:
>     Ethernet controller: 3Com Corporation 3c905 100BaseTX [Boomerang] (#2=
) (rev 0).
>       IRQ 11.
>       Master Capable.  Latency=3D64.  Min Gnt=3D3.Max Lat=3D8.
>       I/O at 0xe000 [0xe03f].
>=20

I see two 3c905Cs and two 3C905s.  Two different chipsets.  I don't
like that much, but it's a personal preference.

Regardless of your success in the past with 3com NICs, I would suggest
using something... ANYTHING... else.  3C90x's have been the bane of my
existence ever since they came out in the late 90s.  If there is an S3
video chipset on that motherboard, it's a lost cause.

