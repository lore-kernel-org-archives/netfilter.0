From: Bart <b-m@pandora.be>
Subject: Re: How to check user-defined chains
Date: Mon, 28 Oct 2002 16:40:51 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DBD5A83.7040900@pandora.be>
References: <200210281605.SAA33419@mover.WUCB.Lviv.net>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: o.darchuk@wucb.lviv.net
Cc: netfilter@lists.netfilter.org



Oleksandr Darchuk wrote:

>Hello.
>
>Are there any ways to know all user-defined chains for iptables (like 
>/proc/net/ip_tables_names for tables)? 
>I try to builded my ipfw script using many own chains, but it's hard to 
>delete all of them 
>
to delete them all, just perform iptables -X

>-- I must remember all of previous definitions. Are there 
>any standart solutions?
>Thanx for all advises.
>
>
>
>  
>
greetz



