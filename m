From: Martin Josefsson <gandalf@wlug.westbo.se>
Subject: Re: -m helper --helper pptp ?
Date: 25 Nov 2002 16:35:21 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1038238521.14752.407.camel@tux>
References: <4710803634.20021125114458@wp.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <4710803634.20021125114458@wp.pl>
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
To: Tomasz Wrona <twr@wp.pl>
Cc: netfilter@lists.samba.org

On Mon, 2002-11-25 at 11:44, Tomasz Wrona wrote:
> Hi,
> 
> How do You think, is it valid to use such a match case ?
> 
>   -m helper --helper pptp
>   -m helper --helper h323
> 
>   Personaly I used it but I have never seen if this rules had counted
>   anything.

-m helper --helper pptp

That should work given you have the ip_conntrack_pptp module loaded (or
compiled into your kernel)

-m helper --helper h323

That will _not_ work. h323 is just the name of a collection of other
protocols that run inside each other.

The primary controlchannel can be matched with H.225 and the
data-channels can be matched with H.245
(case-sensitive!)

-- 
/Martin

Never argue with an idiot. They drag you down to their level, then beat
you with experience.

