From: Maciej Soltysiak <solt@dns.toxicfilms.tv>
Subject: Re: Match DF ( =?iso-8859-1?Q?Don=B4t_Fragment=29_bit?=
Date: Fri, 25 Apr 2003 11:15:30 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.51.0304251108380.9600@dns.toxicfilms.tv>
References: <OF0AE04567.652B900B-ONC1256D11.0042E920@guardianit.se>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <OF0AE04567.652B900B-ONC1256D11.0042E920@guardianit.se>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: Mathias Sundman <Mathias.Sundman@sungard.se>
Cc: netfilter@lists.netfilter.org

On Wed, 23 Apr 2003, Mathias Sundman wrote:

> If a mashine on LocalNet1 sends full size packets (1500b)
> to a mashine on LocalNet2, it will exceed 1500 bytes
> when it=B4s encrypted and sent over the internet. These packets
> will then be fragmented. This is fine as long as the fragments
> gets through...
How about using -j TCPMSS --clamp-mss-to-pmtu
or setting mtu to a lower value to avoid fragmentation ?

> That seemed to do the trick, but I=B4d like to do this only if the
> original packet had the DF flag set, so my question is, is it
> possible to check whether the DF flag is set or not?
AFAIK there are no matches like that, but writing one would be very easy.
I can do it for you if you are desperate.

Though i am not a networking / bridging guru, i belive there must be a way
to solve your problem without clever netfilter tricks.

Regards,
Maciej


