From: Jason Opperisano <opie@817west.com>
Subject: Re: Help: iptables NAT broken with pppoe
Date: Mon, 9 May 2005 10:08:51 -0400
Message-ID: <20050509140851.GA4840@bender.817west.com>
References: <1115397393l.3864l.0l@antares.localdomain>
	<427C5C41.3010407@riverviewtech.net>
	<1115496014l.3549l.0l@antares.localdomain>
	<427EFB7D.8010503@riverviewtech.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <427EFB7D.8010503@riverviewtech.net>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Mon, May 09, 2005 at 12:56:13AM -0500, Taylor, Grant wrote:
> Ok.  I've never heard or seen reference to /proc/sys/net/ipv4/ip_dynaddr 
> before and I'm not sure what its purpose is let alone that it is requried.  
> Does any one have any more information on what it is and what its purpose 
> is?

************************************************************************
$ cat /usr/src/linux-2.6.11/Documentation/networking/ip_dynaddr.txt 

  IP dynamic address hack-port v0.03
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  This stuff allows diald ONESHOT connections to get established
  by dynamically changing packet source address (and socket's if
  local procs).  It is implemented for TCP diald-box connections(1)
  and IP_MASQuerading(2).

  1)  Socket (and packet) source address is rewritten ON RETRANSMISSIONS
      while in SYN_SENT state (diald-box processes).
  2)  Out-bounded MASQueraded source address changes ON OUTPUT (when
      internal host does retransmission) until a packet from outside is
      received by the tunnel.

  This is specially helpful for auto dialup links (diald), where the
  ``actual'' outgoing address is unknown at the moment the link is going
  up. So, the *same* (local AND masqueraded) connections requests that
  bring the link up will be able to get established.

  [*] At boot, by default no address rewriting is attempted. 
  To enable:
     # echo 1 > /proc/sys/net/ipv4/ip_dynaddr
  To enable verbose mode:
     # echo 2 > /proc/sys/net/ipv4/ip_dynaddr
  To disable (default)
     # echo 0 > /proc/sys/net/ipv4/ip_dynaddr

  Enjoy!

  -- Juanjo  <jjciarla@raiz.uncu.edu.ar>
************************************************************************

-j

--
"Narrator: Remember, nothing says "good job" like a firm, open-palm
 slap on the behind."
        --Family Guy

