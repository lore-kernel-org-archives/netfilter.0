From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: 2.4.33.3 kernel & pptp-conntrack-nat
Date: Mon, 09 Oct 2006 00:25:59 +0200
Message-ID: <45297AF7.3020305@netfilter.org>
References: <45276000.1070506@network1.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <45276000.1070506@network1.ca>
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
To: Blake Patton <pattonb@network1.ca>
Cc: netfilter@lists.netfilter.org

Blake Patton wrote:
> I am attempting to to add the pptp-conntrack-nat from patch-o-matic and
> I receive the following error,
> 
> unable to find ladd slot in src usr/src/linux/net/ipv4/netfilter/Config.in
> 
> 
> do I need a 2.6 kernel ?

AFAIK pptp helper in pom-ng is outdated, so it is a good idea using a
recent kernel that already comes with it.

-- 
The dawn of the fourth age of Linux firewalling is coming; a time of
great struggle and heroic deeds -- J.Kadlecsik got inspired by J.Morris

