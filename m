From: "Daniel F. Chief Security Engineer -" <danielf@supportteam.net>
Subject: Re: load balancing
Date: Mon, 3 Feb 2003 10:30:53 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200302031030.53569.danielf@supportteam.net>
References: <1044280193.16953.15.camel@sander> <1044282910.16954.25.camel@sander>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1044282910.16954.25.camel@sander>
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
To: Sander Sneekes <sander@dmdsecure.com>, Netfilter Mailing List <netfilter@lists.netfilter.org>

Im going to be working on one of these later this year it's my understanding 
that you would want to use the nth patch and the state table and SNAT to 
accoplish this. 

From the nth patch.
------------------------
2) Unique rule for every packet.  This is an easy and quick
   method to produce load-balancing for both inbound and outbound.
   example:
   iptables -t nat -A POSTROUTING -o eth0 -m nth --counter 7              
--every 3 --packet 0 -j SNAT --to-source 10.0.0.5
   iptables -t nat -A POSTROUTING -o eth0 -m nth --counter 7              
--every 3 --packet 1 -j SNAT --to-source 10.0.0.6
   iptables -t nat -A POSTROUTING -o eth0 -m nth --counter 7              
--every 3 --packet 2 -j SNAT --to-source 10.0.0.7
   This example evenly splits connections between the three SNAT
   addresses.

   By using the mangle table and iproute2, you can setup complex
   load-balanced routing.
------------------------

Here's a site with good infos on the patches available.
http://www.netfilter.org/documentation/HOWTO//netfilter-extensions-HOWTO.html

Hope this helps. 

On Monday 03 February 2003 08:35, Sander Sneekes wrote:
> currently i'm using this line
>
> iptable -t nat -A PREROUTING -d X.X.X.X -p tcp --dport http -j DNAT
> --to-dest 192.168.0.100-192.168.0.111
>
> this this the job but the if i use the same client it always uses 100
> for ex.
>
> but we need to do some preformance test with 3 client's so everytime a
> client
> does a reqeust to the http server i want to get it for a different
> server.
>
> anybody ?
>
> thanks
> Sander
>
> On Mon, 2003-02-03 at 14:49, Sander Sneekes wrote:
> > Hi all,
> >
> > I need to load balance between 2 webserver
> > what is the most fastest way of doing this?
> > With iptables? if yes wich line's do i need to use
> > i have a RH 7.2 with iptables running already doing
> > al network traffic
> >
> > cheers
> > Sander

-- 
Daniel Fairchild - Chief Security Engineer | danielf@supportteam.net
The distance between nothing and infinity is always the same no matter how 
close you get to nothing.

