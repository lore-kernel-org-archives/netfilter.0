From: Igor Popov <igor@garant.koenig.ru>
Subject: Re: REDIRECT to localhost
Date: Tue, 17 Aug 2004 13:02:30 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200408171302.30699.igor@garant.koenig.ru>
References: <20040816082400.5165.qmail@flock1.newmail.ru> <1092654950.27598.13.camel@tarkus>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1092654950.27598.13.camel@tarkus>
Content-Disposition: inline
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
To: tedkaz@optonline.net
Cc: netfilter@lists.netfilter.org


> > Hi All,
> > I have server, that connects my localnet to inet, clients connects to me
> > via PPPoE (ppp[1-9]). I want to run squid on localhost and I want my
> > clients to connect to it.
> >
> > Can somebody help me with redirect rules?
> >
> >
> >
> > Igor Popov <igorpopov@newmail.ru>
> > icq 241601876


> iptables -t nat -A PREROUTING -i "name of interface" -p tcp -m tcp --
> dport 80 -j REDIRECT --to-ports 3129
>
> If your default policy is to DROP all INPUT/FORWARD as is it should be.
>
>
> iptables -A INPUT -i "name of interface" -p tcp -m tcp --dport 80 -j
> ACCEPT
>


As I know, REDIRECT target redirects to the same iface, but on another port. I 
can run squid on ppp iface, because it is created dynamically and I don't 
want it to listen on all addresses. I have tried to use REDIRECT and DNAT, 
but without any success.  Now I have created alias for eth0 with ip that lies 
in the same subnet as ppp[1-9] and run squid on it.
May be my problem in antispoofing filter?


-- 
"You have been in Afghanistan, I perceive."
		-- Sir Arthur Conan Doyle, "A Study in Scarlet"


