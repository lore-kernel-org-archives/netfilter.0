From: Pascal Italiaander <pc-secure@home.nl>
Subject: Re: special NAT setup
Date: Fri, 13 Jun 2003 07:41:16 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200306130741.16408.pc-secure@home.nl>
References: <Pine.LNX.4.50.0306122110001.9076-100000@alon1.dhs.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.50.0306122110001.9076-100000@alon1.dhs.org>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Op donderdag 12 juni 2003 20:17, schreef Alon Altman:
> Hi,
>   I am trying to use netfilter for my home network, which is connected as
> follows:
>
>                  192.168.1.1    _______ 192.168.1.2
>              (linux)      ______| PC1 | (linux)
>       ADSL   ----------___|     ^^^^^^^
>       =======| Router |---.      ______ (external IP)
>   (external  ----------   |_____| PC2 | (win)
>         ip)     192.168.2.1     ^^^^^^^
>
>     I would like PC2 to have the same IP as the external ADSL link, so
> stuff like KaZaA will work best. I also like several ports to be forwarded
> to the win machine (PC2), while others should still be handled by the linux
> router.
>
>     Also, I would like the router to do SNAT between PC1 and PC2, with
>   minimum mangling as possible of the addresses.
>
>     I have kernel 2.4.20 with patches as needed.
>
>   Alon


Wuhahaha , you think we make scripts on demand  ??

look furder.

Pascal

