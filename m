From: Mikhail Zotov <e-boogie@yandex.ru>
Subject: Re: [OBORONA-SPAM]  more limiting fun
Date: Fri, 11 Feb 2005 18:53:40 +0300
Message-ID: <200502111853.40434.e-boogie@yandex.ru>
References: <Pine.LNX.4.53.0502110936210.1996@altaica>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.53.0502110936210.1996@altaica>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

On Friday 11 February 2005 18:43, Tib wrote:
> Ok, I've done some fiddling but still have some issues. I went with some
> recommendations on what people said and here's what I have. The first
> three rules of my startup set are as follows:
> 
> iptables -A INPUT -i eth0 -p tcp --dport 22 -m state \
>   --state ESTABLISHED -j ACCEPT
> 
> iptables -A INPUT -i eth0 -p tcp --destination-port 22 -m limit \
> --limit 15/hour --limit-burst 5
> 
> The problem is that it still does exactly what it did before, namely that
> it doesn't respond at all once those rules are in place. Anyone have an
> idea what's going on? I know my ssh port isn't getting hammered THAT hard.

AFAIU, the last line is incomplete: there is nowhere to "jump".
As for me, I would have added 

-m state --state NEW

to it for clarity.

--
Mikhail

