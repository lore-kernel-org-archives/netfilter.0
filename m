From: Djalma Fadel Junior <fadel@ferasoft.com.br>
Subject: Re: Transparant proxy
Date: Tue, 8 Jun 2004 20:59:56 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040608205956.3e3c3e47@localhost>
References: <40BF3E60.2060206@efn.uncor.edu>
	<1157.172.16.131.133.1086337464.squirrel@mail.suarapembaruan.co.id>
	<40C02017.5030304@unav.es>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40C02017.5030304@unav.es>
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

On Fri, 04 Jun 2004 09:09:11 +0200
Emilio Casbas <ecasbas@unav.es> wrote:

> david@suarapembaruan.co.id wrote:
> 
> >Dear all,
> >can anybody tell me how to set rules in iptables if i want to use
> >transparant proxy.
> >
> iptables -t nat -A prerouting -i eth0 -p tcp --dport 80 -j REDIRECT 
> --to-port 3128
> 

but, if the user sets manually another proxy in his browser, he doesn't get in this rule and all ACLs in proxy are inutil.

how could redirect that connections through my proxy?


thanks in advance,

D. Fadel Jr.

