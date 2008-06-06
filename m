From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: [libnetfilter_queue] Load Balancing using multiple queues
Date: Fri, 06 Jun 2008 09:50:19 -0500
Message-ID: <48494EAB.8010305@riverviewtech.net>
References: <363599.48150.qm@web58313.mail.re3.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <363599.48150.qm@web58313.mail.re3.yahoo.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 06/06/08 06:08, Vincent Arniego wrote:
> That's actually a good suggestion, Unfortunately we can't force teach 
> our subscribers to use a proxy in their setup. They use a certain 
> equipment that uses 3G and configuring it would be like rocket 
> science to them.

Hum.  Are you dealing with clients going out to the world or the world 
coming in to your server(s) and / or service(s)?  Based on the fact that 
you are dealing with 3G clients (cellular?) and the fact that you are 
SNATing and DNATing traffic in to your application I'm thinking you are 
dealing with clients coming in to your server(s) and / or service(s).

Presuming this is the case, it is trivial to use a reverse proxy (a.k.a. 
web accelerator) to listen on the global address and redirect the 
queries internally as you would like, be it to one system or across 
multiple.

A note about Pound.  I've got a colleague that has been using Pound for 
a long time and I'm just starting to my self.  Pound is *extremely* 
small, with a striped binary at less than 90 kB with a control bin of 10 
kB (my *entire* Pound install is 128 kB, configs, boot scripts, and 
all).  Pound's config is pretty darn straight forward too.

ListenHTTP
	Address	<addy>
	Port	<port>
	Service
		BackEnd
			Address	<addy>
			Port	<port>
		End
		Emergency
			Address	<addy>
			Port	<port>
		End
	End
End

Repeat the BackEnd sections as many times as you need.  Emergency is 
optional and only used if no backends are available.

> 11K packets per second, its ingress. We are  looking at around 114 
> Mbps total traffic at the worst case scenario. And yep, its doesn't 
> look like much... yet.

It's that "yet" part that will get you.

> The application's made already, and it looks at patterns in the 
> payload to determine whether its a GET or http Response. Its working, 
> but we would like to know if there's a way to spread the traffic out 
> among multiple queues automatically.

Are you worried that the queues will get over loaded or be slowed down 
by something or that back end real servers will become over loaded and 
you have a fixed number of servers per queue and by increasing the 
number of queues you increase the number of back end servers?  Or are 
you thinking that having multiple queues on a single system will speed 
things up if the queue / application pare are the slow down?

> I was thinking of something like
> 
> iptables -A FORWARD -p tcp --dport 80 -j NFQUEUE --queue-num 0:5

*nod*

If only the perceived simple things actually were (simple) and existed 
and worked.

> something like that. This doesn't work btw.

*nod*

I guess I should ask, do you have to do the load balancing in NetFilter 
/ Queues or could you put something in between NetFilter and your Queues 
and have it do the load balancing for thus allowing you to concentrating 
on your queues?



Grant. . . .
