From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: netfilter resets TCP conversation that was DNATed from the local machine to another
Date: Sun, 29 Jun 2003 22:01:52 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030630020152.GA27602@cannon.eng.us.uu.net>
References: <3EFD10A2.6020807@adsl-209-204-165-151.sonic.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <3EFD10A2.6020807@adsl-209-204-165-151.sonic.net>
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
To: Michael <freeware@adsl-209-204-165-151.sonic.net>
Cc: netfilter@lists.netfilter.org

On Fri, Jun 27, 2003 at 08:50:58PM -0700, Michael wrote:

> Dear netfilter gods,
> 
> I have a configuration, so:
> 
> /------------\ .0.2     .{0,1}.1 /----------\ 1.2.3.4  (          )
> | Web server |-----+-------------| firewall |---------(  Internet  )
> \------------/     |        eth0 |  Squid   | eth1     (          )
>                    |             \----------/
> /---------\ .1.2   |
> | browser |--------/
> \---------/
> 
> - The 192.168.{0,1}. subnets run on the same wire.
> - Port 80 on the public i/f is DNATed to the internal Web server.
> 
> The firewall is running Squid to proxy for 192.168.1. clients, and it 
> works fine *except* when the target server resolves to a public IP on 
> eth1.  When that happens, I see the client-to-Squid communication go OK, 
> then Squid send a SYN (from .0.1) to .0.2:80, .0.2 sends a SYN ACK,... 
> but then netfilter spontaneously issues a RST to .0.2:80 from another 
> port (i.e., not the one that Squid was using)!

No idea why this RST is being sent (might have to do with your rule set or
more possibly the internals of squid) but the fact that you say the RST
sending port is not the same as the initiating SYN port should not break
anything. Can you confirm this?

Ramin

> I have no reject-with-tcp-reset lines in my tables.
> 
> What up?
> 
> 
> Squid really doesn't belong on a firewall, but I'm curious to resolve 
> this mystery first.
> 

