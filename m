From: Chris Wilson <chris@netservers.co.uk>
Subject: Re: nfs
Date: Tue, 5 Aug 2003 10:49:44 +0100 (BST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0308051046520.21531-100000@localhost>
References: <1060074177.2848.3.camel@rincewind>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1060074177.2848.3.camel@rincewind>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rob Verduijn <rverduij@dds.nl>
Cc: sr@gimp.org, netfilter@lists.netfilter.org

Hi Rob,

> My second question would be what the IP table rule settings would be on
> the server :)

> > udp/2049: nfs
> > tcp/2049: nfs, if you're using nfs over tcp, nfs v3 and up
> > udp/111: portmap/sunrpc
> > tcp/111: portmap/sunrpc
> > udp/<rpc.statd>
> > tcp/<rpc.statd>

  iptables -A FORWARD -s <source> -d <dest> -p udp --dport 2049 -j ACCEPT
  iptables -A FORWARD -s <source> -d <dest> -p tcp --dport 2049 -j ACCEPT
  iptables -A FORWARD -s <source> -d <dest> -p udp --dport 111  -j ACCEPT

Et cetera, for each connection which needs to be allowed, from the list 
which Sven gave you.

> > First, since NFS uses RPCs you need to know what ports rpc.mountd,
> > rpc.statd and maybe rpc.lockd are running on. If you have influence over
> > the server, try setting the ports explictly (invoke the daemons with the
> > -p flag. Works with statd and mountd, lockd is a bit more tricky). 

You can disable locking on the client by mounting with the "-o nolock" 
flag, which removes the need to fix a port for lockd or allow connections 
to it.

Cheers, Chris.
-- 
   ___ __     _
 / __// / ,__(_)_  | Chris Wilson -- UNIX Firewall Lead Developer |
/ (_ / ,\/ _/ /_ \ | NetServers.co.uk http://www.netservers.co.uk |
\ _//_/_/_//_/___/ | 21 Signet Court, Cambridge, UK. 01223 576516 |



