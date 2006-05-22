From: Unknown <unknown@unknown.invalid>
Subject: Re: Transparent proxy using squid, redirect all ssl/https ... ?
Date: Mon, 22 May 2006 13:30:17 +0200 (CEST)
Message-ID: <15433.811947196$1148299162@news.gmane.org>
References: <b4a631130605211917t7a747ceeo6d9f22b067d67466@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <b4a631130605211917t7a747ceeo6d9f22b067d67466@mail.gmail.com>
From: martijn@localhost
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
To: Elijah Alcantara <elijah.alcantara@gmail.com>
Cc: netfilter@lists.netfilter.org

<citaat van="Elijah Alcantara">
> Here are my current rules:
> -A PREROUTING -p tcp -m tcp -i eth0 --dport 80 -j REDIRECT --to-ports 3128
> -A PREROUTING -p tcp -m tcp -i eth0 --dport 443 -j DNAT
> --to-destination 192.168.100.3
>
> The first one works, it's for transparent proxy, the other one.. I
> have no idea why it's not working =(
>

See http://lists.debian.org/debian-user/2004/05/msg01434.html

HTH,
M4


