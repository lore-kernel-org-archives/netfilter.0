From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: iptables NAT routing issues
Date: Wed, 9 May 2007 00:25:37 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0705090024450.2342@yvahk01.tjqt.qr>
References: <4640E893.1010206@bserved.nl>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4640E893.1010206@bserved.nl>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bas Verhoeven <netfilter@bserved.nl>
Cc: netfilter@lists.netfilter.org


On May 8 2007 23:16, Bas Verhoeven wrote:
>
> OUTBOUND SERVER:
>
> iptables -t nat -A PREROUTING -p tcp --dport 80 -d <ext_web_ip> -j DNAT
> --to-destination <webserver_ip>:80
>
> Note: We didn't touch this as it seems to works fine.
>
> WEBSERVER:

You do not need any rules here. The outbound server will do the translation
in both directions.

> Tried various, from the detailed:
>   iptables -t nat -A POSTROUTING -s <webserver_ip>-p tcp --sport 80 -j SNAT
> --to-source <ext_web_ip>:80 -o eth0
>
> To the 'should-be-catching-it-all':
>   iptables -t nat -A POSTROUTING -s <webserver_ip> -j SNAT --to-source
> <ext_web_ip>
>
> None of those seem to do the thing we want to do tho.
>
> Some advice would be very welcome.
>
> Cheers,
> Bas Verhoeven
>

Jan
-- 

