From: "Leonardo Rodrigues ( listas )" <leolistas@solucoesip.net>
Subject: Re: question on recent module
Date: Sat, 25 Jan 2003 16:43:03 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <005201c2c4a9$f9e7f280$3201a8c0@leonardo>
References: <001901c2c3b3$5adfe4a0$3201a8c0@leonardo> <20030125013327.GO484@ns.snowman.net>
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
To: netfilter ML <netfilter@lists.samba.org>



    It's really not clear for me :) Could you give an example rule of how an
destination address could be checked with recent module in an OUTPUT rule
for example ? This is my situation ..... i want ALL packets whose
destination was matched for the last 60 seconds in a recent list called
'bullshit'.

iptables -A OUTPUT -m recent --seconds 60 --name bullshit ??????????????? -j
DROP

    Sincerily,
    Leonardo Rodrigues

----- Original Message -----
From: "Stephen Frost" <sfrost@snowman.net>
To: "Leonardo Rodrigues ( listas )" <leolistas@solucoesip.net>
Cc: "netfilter ML" <netfilter@lists.samba.org>
Sent: Friday, January 24, 2003 10:33 PM
Subject: Re: question on recent module


Using the latest versions of ipt_recent you can match against the
destination IP address.  I know it's not very clear, but you can use
--rdest in a 'check' rule too, and it will take the destionation IP
address of the packet and look it up in the recent list.

 Stephen

* Leonardo Rodrigues ( listas ) (leolistas@solucoesip.net) wrote:
>     I'm trying to setup recent module for doing some great things here :)
> Basically what I want is. Match some kind of traffic and, if that happens,
> traffic for that source address will be completly and silently dropped.
All
> examples of recent module I found were used on FORWARD chain, which is not
> my case, as machine running recent will be the final destination of the
> connection.
>
>     So, seems I'm successfully matching packets I need (
> /proc/net/ipt_recent/myrulename ) is created and sources are being added
> there. What I need now is: how can I make a rule on filter OUTPUT to DROP
> all traffic if the source address was matched by recent module ? As I
read,
> I can only check recent matches against source address ( --rcheck ). In
> OUTPUT chain, source address is my own address and the address I need to
> match is the DESTINATION one.
>
>     Can recent module help me in this situation ? Hope you understood it.
>
>     Anyway, thanks for your attention :)



