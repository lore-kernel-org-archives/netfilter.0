From: <hamals@infinito.it>
Subject: Re: web server in DMZ
Date: Tue, 28 Sep 2004 16:44:36 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <web-6491079@infinito.it>
References: <web-6416739@infinito.it>
	<1096381048.2330.47.camel@wolfpack.ljm.dom>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1096381048.2330.47.camel@wolfpack.ljm.dom>
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
To: netfilter@lists.netfilter.org

On Tue, 28 Sep 2004 10:17:29 -0400
  Jason Opperisano <opie@817west.com> wrote:

> 
> are you asking how to connect to the web server from the 
>inside by its
> public IP address?

yes

>if so, you just need another DNAT 
>rule, probably:
> 
>  iptables -t nat -A PREROUTING -i $INSIDE_IF -p tcp -d 
>$WWW_PUB_IP \
>    --dport 80 -j DNAT --to-destination 192.168.1.10
> 
> -j
> 
> -- 
> Jason Opperisano <opie@817west.com>
> 
> 

well I think this is a very good solution, but I can't 
understand the following:

hosts in my LAN go in internet with a snat using x.x.x.50 
ip address, and everythings is working; my web server is 
accessible from outside, then why my inside hosts can't 
access to him (with x.x.x.50 IP)? my hosts should see my 
web server like any web server on the net....right?
what is wrong in this concept?



_______________________________________
Connessione ed e-mail gratuita da 10 mb
consultabile tramite web e tramite pop.
www.infinito.it vieni a scoprire tutti 
i nostri servizi!

http://www.infinito.it/xmail


