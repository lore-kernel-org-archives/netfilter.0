From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: port translation
Date: Sun, 11 Jan 2004 13:03:51 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401111303.51859.Antony@Soft-Solutions.co.uk>
References: <4001239D.7010904@yahoo.fr> <1073825033.761.1.camel@elendil.intranet.cartel-securite.net> <40014750.5000300@yahoo.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40014750.5000300@yahoo.fr>
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

On Sunday 11 January 2004 12:53 pm, Romain Moyne wrote:

> Ok. I begin to understand... Now I have corrected my rules :
> iptables -t nat -A POSTROUTING -j SNAT -o ppp0 --to-source
> My_ip_on_internet

That looks better.

> But now I have a new problem : My router, my http server and my
> workstation are connected with a hub.
>
>                       ppp0
>               eth0
> INTERNET--------------------192.168.0.1(router)
> ---------------------------192.168.0.3 (http server)
>   192.168.0.2 (workstation)
>
> I can't access to my webserver with my workstation and it very painful....

Are you trying to access the webserver by IP address or by hostname?

If by IP address, make sure it is the private (real) address.

If by hostname, make sure your DNS correctly resolves internal queries to the 
internal address and external queries to the external address.

The correct solution to this problem, of course, is that you should have your 
web server on a separate ("DMZ") interface, because it is accessible from 
both the internal and external networks, and should be kept separate from 
both, for both security and routing reasons.

Regards,

Antony.

-- 
Most people are aware that the Universe is big.

 - Paul Davies, Professor of Theoretical Physics

                                                     Please reply to the list;
                                                           please don't CC me.


