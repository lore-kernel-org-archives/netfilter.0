From: mailinglists@belfin.ch
Subject: RE: next topic:  --limit and --burst-limit
Date: Thu, 31 Oct 2002 15:47:44 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <31347F3CE518D6118ACB00A0246AD0560B23F6@mx.snizek.ch>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: 'Cedric Blancher' <blancher@cartel-securite.fr>
Cc: netfilter mailing list <netfilter@lists.netfilter.org>

> >   from one tutorial, here's the lines that deal with 
> > syn-flooding protection:
> > 
> >   iptables -N syn-flood
> >   iptables -A INPUT -i $IFACE -p tcp --syn -j syn-flood
> >   iptables -A syn-flood -m limit --limit 1/s --limit-burst 
> 4 -j RETURN
> >   iptables -A syn-flood -j DROP

I've just been playing with that, too.

Well, I couldn't stop scans like
nmap -sS -P0 -T Insane ip.address -p 21,22,25,80

However, 'nmap -sS -P0 -T Polite ip.address' works fine with this --limit
specification above.

How am I going to stop something like that?



Thanks,
philipp

