From: Upma Gandhi <upma@networkprograms.com>
Subject: Re: marking all h323 packets with some TOS
Date: Thu, 09 Jan 2003 17:13:09 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E1D604D.18388311@networkprograms.com>
References: <3E1D2F29.6443D681@networkprograms.com> <1042101858.26554.125.camel@rayw.knowledgefactory.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: raymondl@knowledgefactory.co.za, netfilter <netfilter@lists.netfilter.org>

Hello Raymond,
       Thanks for your help.
Modules are not missing and they are compiled also.
But one doubt , in ip_conntarck_in function of ip_conntrack_core.c file.
        When it lokks for ct-helper, it's address is 0, means that helper are
not register.
       But I've compiled h323& rtc helper, as I'm very new to
iptables/netfilter, I don't have any idea what does this means ?

Regards
Upma

Raymond Leach wrote:

> Sounds like it doesn't understand the -j FTOS. Maybe a missing module or
> not compiled into the kernel?
>
> On Thu, 2003-01-09 at 10:13, Upma Gandhi wrote:
> > Hello All,
> >          I have a following setup
> >
> > Internet <-> Router with netfilter configure <-> LAN(192.9.201.0/24)
> >
> > lets supopose eth0 is LAN side Interface and
> > eth1 is WAN side interface.
> >
> > what I want to do is "Mark all h323 packets with some tos value".
> > for which my iptables  command seems to be like this-
> >      iptables -t mangle -A FORWARD -o eth0 -d 192.9.201.0/24 -p tcp -m
> > rtp -j FTOS --set-ftos 0xb8.
> >
> > but it's giving an error message -
> > iptable: No chain/target/match by tha rule.
> >
> > Can anybody help me out.
> >
> > Thanks & Regards
> > Upma
> >
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
>      \___)=(___/          \___)=(___/
>
>   ------------------------------------------------------------------------
>                        Name: signature.asc
>    signature.asc       Type: application/pgp-signature
>                 Description: This is a digitally signed message part


