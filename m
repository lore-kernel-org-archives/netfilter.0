From: Jordi Bruguera <jordi@grn.es>
Subject: Re: QoS using HTB and SFQ ...
Date: Thu, 12 Dec 2002 11:46:43 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.33.0212121144490.27512-100000@chemical.grn.es>
References: <1039684623.4085.47.camel@rayw.knowledgefactory.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1039684623.4085.47.camel@rayw.knowledgefactory.co.za>
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
To: Raymond Leach <raymondl@knowledgefactory.co.za>
Cc: Netfilter Mailing List <netfilter@lists.netfilter.org>

On 12 Dec 2002, Raymond Leach wrote:

Hi.

=09To use HTB you have to apply the patches from <devik>
downloadable from:

=09http://luxik.cdi.cz/~devik/qos/htb/

I've made several tests with them with successful results.

=09regards,

> Hi
>
> Does anyone have any experience (good or bad) with using htb and sfq to
> do QoS using 2.4.20 kernels?
>
> I compiled the kernel, installed the image, but tc tells me that htb is
> an unknown qdisc. I checked that I did select htb in the QoS section.
>
> Any ideas?
>
> Ray
> --
>  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> (  Raymond Leach                       )
>  ) Knowledge Factory                  (
> (                                      )
>  ) Tel: +27 11 445 8100               (
> (  Fax: +27 11 445 8101                )
>  )                                    (
> (  http://www.knowledgefactory.co.za/  )
>  ) http://www.saptg.co.za/            (
>  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    o                                o
>     o                              o
>         .--.                  .--.
>        | o_o|                |o_o |
>        | \_:|                |:_/ |
>       / /   \\              //   \ \
>      ( |     |)            (|     | )
>      /`\_   _/'\          /'\_   _/`\
>      \___)=3D(___/          \___)=3D(___/
>

+------------------------------------------------+
! Jordi Bruguera i Cortada         jordi@grn.es  !
! Cap T=E8cnic                                     !
! GRN Serveis Telem=E0tics, SL Tel. +34 972 230000 !
+------------------------------------------------+



