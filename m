From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: http acces
Date: Thu, 20 Nov 2003 22:54:50 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311202254.hAKMss723777@onyx.rockstone.co.uk>
References: <1069364822.3fbd3656723b4@roma-hme1>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1069364822.3fbd3656723b4@roma-hme1>
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

On Thursday 20 November 2003 9:47 pm, skydive wrote:

> hi all
>
> i have been experienced a problem since i'm trying to
> access my web server from my lan through my internet ip.
>
> i have no problems doing DNAT, from those who access my
> web page form the outside:
>
> iptables -A PREROUTING -t nat -i eth0 -p tcp --dport 80
> -j DNAT --to 192.168.0.1:80
>
> this is solving the problem
>
> let's say my web page has the following address
> www.example.org, and that it is host  [like it is ;)) ]
> in one machine on my lan with the following IP:
>
> 192.168.0.1
>
> when i write www.example.org on my web browser, it just
>  hits eth1 on my gateway/firewall and stucks there.
> maybe i'm missing something on my prerouting rules, or
> maybe my small brain just can't reach it :)

See if http://www.netfilter.org/documentation/HOWTO//NAT-HOWTO-10.html 
answers your question.

Antony.

-- 

Having been asked to provide a reference for this man,
I can confidently state that you will be very lucky indeed
if you can get him to work for you.
                                                     Please reply to the list;
                                                           please don't CC me.

