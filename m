From: Emilio Casbas <ecasbas@unav.es>
Subject: Re: Transparant proxy
Date: Fri, 04 Jun 2004 09:09:11 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40C02017.5030304@unav.es>
References: <40BF3E60.2060206@efn.uncor.edu> <1157.172.16.131.133.1086337464.squirrel@mail.suarapembaruan.co.id>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1157.172.16.131.133.1086337464.squirrel@mail.suarapembaruan.co.id>
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
To: david@suarapembaruan.co.id
Cc: netfilter@lists.netfilter.org

david@suarapembaruan.co.id wrote:

>Dear all,
>can anybody tell me how to set rules in iptables if i want to use
>transparant proxy.
>
>Thank's
>David Kandou
>
>
>
>
>  
>
iptables -t nat -A prerouting -i eth0 -p tcp --dport 80 -j REDIRECT 
--to-port 3128

This command make your kernel intercept  HTTP connections and send them
to proxy port.


Emilio C.



