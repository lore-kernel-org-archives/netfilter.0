From: Dmitry Labutcky <avl@strace.net>
Subject: Re: Match DF ( =?iso-8859-1?q?Don=B4t?= Fragment) bit
Date: Fri, 25 Apr 2003 12:43:40 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200304251243.40088.avl@strace.net>
References: <OF0AE04567.652B900B-ONC1256D11.0042E920@guardianit.se> <Pine.LNX.4.51.0304251108380.9600@dns.toxicfilms.tv>
Reply-To: avl@strace.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.51.0304251108380.9600@dns.toxicfilms.tv>
Content-Disposition: inline
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Hi!

> On Wed, 23 Apr 2003, Mathias Sundman wrote:
> > If a mashine on LocalNet1 sends full size packets (1500b)
> > to a mashine on LocalNet2, it will exceed 1500 bytes
> > when it=B4s encrypted and sent over the internet. These packets
> > will then be fragmented. This is fine as long as the fragments
> > gets through...
>
> How about using -j TCPMSS --clamp-mss-to-pmtu
> or setting mtu to a lower value to avoid fragmentation ?

But if one or more routers in tracepath does not support pmtu?
Setting mtu to lower is solution, but this not always good idea.
Another solution may be in clear DF flag on forwaders packets.


--=20
/bye
----------------------------------------------------------------------
Dmitry U.Labutcky                  System administrator of Swift Trace
mail to: avl@strace.net            Simferopol, Crimea, Ukraine
phone:   +380-652-516546           Yaltinskaya 20, office 502


