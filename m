From: Patrick Schaaf <bof@bof.de>
Subject: Re: OK the last one: IP Accounting
Date: Sun, 23 Jun 2002 10:04:27 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020623100427.N5183@oknodo.bof.de>
References: <NFBBLDBMIDIOFPBNLEAJOEKCCHAA.yomega@wahooo.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <NFBBLDBMIDIOFPBNLEAJOEKCCHAA.yomega@wahooo.net>; from yomega@wahooo.net on Sun, Jun 23, 2002 at 09:35:58AM +0200
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: yomega <yomega@wahooo.net>
Cc: netfilter@lists.samba.org

Yo Mega,

> iptables -A httpd_accounting -p tcp --dport 80
> iptables -A INPUT -p tcp --dport 80 -j httpd_accounting
> iptables -A OUTPUT -p tcp --dport 80 -j httpd_accounting
> 
> Now I'm finished !!?

I don't think so.

> You think this is OK?

No.

> Or do I count some traffic twice?

No.

> And, of course, have i counted ALL the traffic?

No.

You now count traffic from clients to your HTTP server, as well as
packets from your server machine to OTHER HTTP servers.

In the OUTPUT chain rule, change "--dport" to "--sport", and then you
will be finished, and count both packets to and from your port 80.
In general, when going from INPUT rules to OUTPUT rules for the same
thing, switch sources and destinations.

best regards
  Patrick

