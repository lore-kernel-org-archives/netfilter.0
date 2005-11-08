From: Pablo Neira <pablo@eurodev.net>
Subject: Re: iptables v1.3.4: STRING match: You must specify `--algo'
Date: Tue, 08 Nov 2005 02:01:06 +0100
Message-ID: <436FF8D2.3070101@eurodev.net>
References: <1131367085.11452.9.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1131367085.11452.9.camel@localhost.localdomain>
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
To: jasbir.k@gmail.com
Cc: netfilter@lists.netfilter.org

Jasbir Khehra wrote:
> Hi,
>    while  running this command
> # iptables -t nat -I PREROUTING -p tcp -s 192.168.2.20 -m string
> --hex-string '0d0a0d0a594d5347' -j REJECT
> 
> Not able to get the different options for '--algo' parameter . 
> Kernel 2.6.14 iptables v1.3.4  thanks - Jasbir 

--algo [bm|kmp]

bm: Boyer-Moore
kmp: Knuth-Pratt-Morris

Those are the algorithm implemented at the moment.

BTW, you should do that in the raw table, not nat. Nobody should use the
nat table for filtering purposes.

-- 
Pablo

