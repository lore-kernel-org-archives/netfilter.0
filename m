From: Pablo Neira <pablo@eurodev.net>
Subject: Re: iptables v1.3.4: STRING match: You must specify `--algo'
Date: Sat, 12 Nov 2005 13:03:47 +0100
Message-ID: <4375DA23.4060202@eurodev.net>
References: <1131367085.11452.9.camel@localhost.localdomain>	
	<436FF8D2.3070101@eurodev.net>
	<e053ca9d0511110554v2b8f187bh63526a9cf887dfbc@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <e053ca9d0511110554v2b8f187bh63526a9cf887dfbc@mail.gmail.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: Jasbir Khehra <jasbir.k@gmail.com>
Cc: netfilter@lists.netfilter.org

Jasbir Khehra wrote:
> 
> 
> On 11/8/05, *Pablo Neira* <pablo@eurodev.net <mailto:pablo@eurodev.net>>
> wrote:
> 
>     Jasbir Khehra wrote:
>     > Hi,
>     >    while  running this command
>     > # iptables -t nat -I PREROUTING -p tcp -s 192.168.2.20
>     <http://192.168.2.20> -m string
>     > --hex-string '0d0a0d0a594d5347' -j REJECT
>     >
>     > Not able to get the different options for '--algo' parameter .
>     > Kernel 2.6.14 iptables v1.3.4  thanks - Jasbir
> 
>     --algo [bm|kmp]
> 
>     bm: Boyer-Moore
>     kmp: Knuth-Pratt-Morris
> 
>     Those are the algorithm implemented at the moment.
> 
>     BTW, you should do that in the raw table, not nat. Nobody should use the
>     nat table for filtering purposes.
> 
>     --
>     Pablo
> 
> 
>  
> 
> Thankz Pablo for the reply and the "string" module :) . I redifined my
> rule now and after some googling found the right syntax for  using  the
> "--hex-string"
> # iptables -t raw -A PREROUTING -s $source_ip -m string --algo bm
> --hex-string "|0d 0a 59 4d 53 47|" -j DROP
> Whats the initial position/counter for the "--from" parameter  0 or 1
> and does it start from the IP header ?

Yes, the IP header. Use --from 0 for the initial position.

-- 
Pablo

