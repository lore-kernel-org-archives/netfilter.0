From: =?iso-8859-1?q?=D6yk=FC=20Gen=E7ay?= <oyku@solfix.net>
Subject: Re: Limiting upload bandwidth ...
Date: Mon, 3 Feb 2003 13:35:10 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200302031335.10248.oyku@solfix.net>
References: <1044268942.1119.3.camel@rayw.knowledgefactory.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1044268942.1119.3.camel@rayw.knowledgefactory.co.za>
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
To: raymondl@knowledgefactory.co.za, Netfilter Mailing List <netfilter@lists.netfilter.org>

This might help.=20
Take a look at CBQ section. I'm also currently trying to implement such a=
=20
thing.
http://www.tldp.org/HOWTO/Bandwidth-Limiting-HOWTO/index.html

On Monday 03 February 2003 12:42, Raymond Leach wrote:
> Hi all
>
> Enjoying your day so far?
>
> Does anyone have any ideas for limiting upload bandwidth per user(ip)?
> Can I use delay pools in squid to do this, or is that only for
> downloads? I didn't see in the docs where I could specify either upload
> or download.
>
> Do I have to use something like HTB?
>
> Regards
>
> Ray

