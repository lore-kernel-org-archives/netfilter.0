From: Folkert van Heusden <folkert@vanheusden.com>
Subject: Re: transparent proxying NTP
Date: Mon, 28 Jun 2004 16:38:58 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.33.0406281636350.12956-100000@muur.intranet.vanheusden.com>
References: <006401c45c84$05827250$8b00000a@casa>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <006401c45c84$05827250$8b00000a@casa>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: =?iso-8859-1?Q?Leonardo_Rodrigues_Magalh=E3es?= <leolistas@solutti.com.br>
Cc: netfilter@lists.netfilter.org

>     I think SNATing to 127.0.0.1 would break things, unless this linux
> router IS your timeserver, which i believe isn't. You should SNAT to your
> linux router IP not 127.0.0.1.

Yes it is actually. Its load is aprox. > 2.0 most of the time but it works
:)

>     Last ...... are you sure protocol used for time syncing works fine when
> DNATted ?? I dont know, never tried this.

I don't know that yet, that is a thing I want to try. And if it doesn't
work, I'll try to write a wrapper around it.


Folkert

+--------------------------------------------------------------------------+
| UNIX sysop? Then give MultiTail ( http://www.vanheusden.com/multitail/ ) |
| a try, it brings monitoring logfiles to a different level! See:          |
| http://www.vanheusden.com/multitail/features.html for a feature list.    |
+---------------------------------------------------= www.vanheusden.com =-+


