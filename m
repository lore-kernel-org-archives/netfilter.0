From: Lopsch <lopsch@lopsch.com>
Subject: Re: semi OT: default route
Date: Wed, 20 Oct 2004 20:53:17 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <4176B41D.7000208@lopsch.com>
References: <7C9884991ADAE0479C14F10C858BCDF591E388@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <7C9884991ADAE0479C14F10C858BCDF591E388@alderaan.smgtec.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Netfilter-Mailinglist <netfilter@lists.netfilter.org>

Daniel Chemko schrieb:
>routed might help here. Right?
>Can anyone with 2 ISP setup please check the load balance thing?
>I vaguely remember seeing something about multiple default routes
>in early chapters of TCP/IP Illustrated Vol. 1 (I am not at all sure).

Quote from LARTC-Howto Chapter 4:

4.2.2. Load balancing

The second question is how to balance traffic going out over the two 
providers. This is actually not hard if you already have set up split 
access as above.

Instead of choosing one of the two providers as your default route, you 
now set up the default route to be a multipath route. In the default 
kernel this will balance routes over the two providers. It is done as 
follows (once more building on the example in the section on split-access):

ip route add default scope global nexthop via $P1 dev $IF1 weight 1 \
nexthop via $P2 dev $IF2 weight 1
	

This will balance the routes over both providers. The weight parameters 
can be tweaked to favor one provider over the other.

Note that balancing will not be perfect, as it is route based, and 
routes are cached. This means that routes to often-used sites will 
always be over the same provider.

Furthermore, if you really want to do this, you probably also want to 
look at Julian Anastasov's patches at http://www.ssi.bg/~ja/#routes , 
Julian's route patch page. They will make things nicer to work with.

Explaining the variables:
$Pi ist the IP of the Provider Gateway to which the interface $IFi is 
connected.

I think a combination of IPTables and IPRoute2 will get best effects 
like described before.


