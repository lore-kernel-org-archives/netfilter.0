From: Kiran Kumar <immidi_kiran@yahoo.com>
Subject: Re: local connections getting natted
Date: Tue, 3 Feb 2004 19:26:16 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040204032616.95551.qmail@web14007.mail.yahoo.com>
References: <200402031107.16864.clister@uah.es>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200402031107.16864.clister@uah.es>
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
Content-Transfer-Encoding: 7bit
To: clister <clister@uah.es>, netfilter@lists.netfilter.org

--- clister <clister@uah.es> wrote:
> i have a this setup on nat table.
> 
> Chain POSTROUTING (policy ACCEPT 20 packets, 1192
> bytes)
>  pkts bytes target     prot opt in     out    
> source               
> destination
>  185K 8942K SNAT       all  --  *      eth0   
> 0.0.0.0/0            0.0.0.0/0          
> to:1.2.3.4

> Connections coming from eth1 (internal network
> 10.10.10.x) to eth0 (external) 
> get natted to to 1.2.3.4 , it's correct for me but
> whenever i try to connect 
> from this box to inet i get natted also to 1.2.3.4. 

  Yes, you have specified 0.0.0.0/0 which is
'anywhere'. Packets coming in from anywhere will be
satisfying this match. So local packets get natted as
well. I think you should change your iptable rule to
include -i eth1

> 
> I thought this happened only if you create such rule
> on NAT::ouput so local 
> connections get natted prior to go out of the box.

  Sorry, did not get what you mean by this.

> 
> Should i change this to:
> -t nat -A POSTROUTING -i eth1 -o eth0 -j SNAT
> --to-destination:1.2.3.4 to 
> avoid local packets getting natted?

Right.

> 
> and last question:
> All packets leaving routing code (local, forwarded)
> pass througth POSTROUTING 
> chain at nat table or only forwarded packets?

Not sure about this.

=====
Regards,
Kiran Kumar Immidi

__________________________________
Do you Yahoo!?
Yahoo! SiteBuilder - Free web site building tool. Try it!
http://webhosting.yahoo.com/ps/sb/

