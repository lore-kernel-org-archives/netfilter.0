From: "Darrell Dieringer" <netfilter@darrelldieringer.com>
Subject: RE: DNAT possible Bug?
Date: Mon, 27 Jan 2003 11:48:31 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <IMEDICLPAGAOCBLCCKLPKEKIEMAA.netfilter@darrelldieringer.com>
References: <3E35689E.4070604@gmx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3E35689E.4070604@gmx.de>
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
To: Jochen Radmacher <jradmacher@gmx.de>, netfilter@lists.netfilter.org


Do a quick google for...
"same network" +DNAT +netfilter

I know there was talk of adding this topic to the netfilter FAQ some
time ago, since it is something a number of people have trouble with
initially, but I don't know if it's in the faq.

Enjoy,

Darrell Dieringer - Madison, WI


> -----Original Message-----
> From: netfilter-admin@lists.netfilter.org
> [mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Jochen
> Radmacher
> Sent: Monday, January 27, 2003 11:13 AM
> To: netfilter@lists.netfilter.org
> Subject: DNAT possible Bug?
>
>
> I'm using a DNAT- Rule to Forward a Port from my Router to
> my Server:
>
> iptables -t nat -A PREROUTING -d <outsideip> -p tcp --dport 4000 \
> -j DNAT --to 192.168.0.44:80
>
> This works fine when I'm connecting from the outside. But If i try:
> jr@192.168.0.42# lynx <outsideip>:4000
> this does not work. Her is the Output from /proc/net/ip_conntrack:
>
> tcp      6 84 SYN_SENT src=192.168.0.44 dst=<outsideip> sport=33474
> dport=4000 [UNREPLIED] src=192.168.0.44 dst=192.168.0.44 sport=80
> dport=33474 use=1
>
>
> Jochen
>
>
>
>


