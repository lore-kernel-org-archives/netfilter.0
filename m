From: Nimit Gupta <nimit@deeproot.co.in>
Subject: Re: Limiting upload bandwidth ...
Date: Mon, 3 Feb 2003 18:05:29 +0530 (IST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.43.0302031759001.1701-100000@avishkaar.lan.deeproot.co.in>
References: <1044268942.1119.3.camel@rayw.knowledgefactory.co.za>
Mime-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Raymond Leach <raymondl@knowledgefactory.co.za>
Cc: Netfilter Mailing List <netfilter@lists.netfilter.org>

hi,
	there is a bytelimit patch available for iptables you can try it.
for documentation over delay pools you can have a look at:
squid.visolve.com/squid24s1/delaypool.htm

regards,
nimit


On 3 Feb 2003, Raymond Leach wrote:

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


