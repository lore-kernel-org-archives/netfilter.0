From: Michael <freeware@adsl-209-204-165-151.sonic.net>
Subject: netfilter resets TCP conversation that was DNATed from the local
 machine to another
Date: Fri, 27 Jun 2003 20:50:58 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3EFD10A2.6020807@adsl-209-204-165-151.sonic.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Dear netfilter gods,

I have a configuration, so:

/------------\ .0.2     .{0,1}.1 /----------\ 1.2.3.4  (          )
| Web server |-----+-------------| firewall |---------(  Internet  )
\------------/     |        eth0 |  Squid   | eth1     (          )
                    |             \----------/
/---------\ .1.2   |
| browser |--------/
\---------/

- The 192.168.{0,1}. subnets run on the same wire.
- Port 80 on the public i/f is DNATed to the internal Web server.

The firewall is running Squid to proxy for 192.168.1. clients, and it 
works fine *except* when the target server resolves to a public IP on 
eth1.  When that happens, I see the client-to-Squid communication go OK, 
then Squid send a SYN (from .0.1) to .0.2:80, .0.2 sends a SYN ACK,... 
but then netfilter spontaneously issues a RST to .0.2:80 from another 
port (i.e., not the one that Squid was using)!  I have no 
reject-with-tcp-reset lines in my tables.

What up?


Squid really doesn't belong on a firewall, but I'm curious to resolve 
this mystery first.


