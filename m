From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: Forwarding a port on the LAN
Date: Sun, 6 Jul 2003 02:12:12 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030706061212.GA12152@cannon.eng.us.uu.net>
References: <1335069572.1057466520812.JavaMail.Administrator@pumbaa>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1335069572.1057466520812.JavaMail.Administrator@pumbaa>
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
To: Internet Protocol version Six <inet6@mail.be>
Cc: netfilter@lists.netfilter.org

Just follow the packet flow and you'll see what's happening.

192.168.0.3:whatever sends SYN to 192.168.0.1:1600

the packet gets DNAT'ed and becomes:

192.168.0.3:whatever sends SYN to 192.168.0.2:23

192.168.0.2:23 sends the SYN,ACK to 192.168.0.3:whatever which sits on the
same LAN and does not go through the router to get corrected to its original
state. You need to SNAT the LAN communication to the router's IP to ensure
the return path back to the router.

This is a VFAQ and needs to be explained in the basic Nat HOW-TO of netfilter,
if it's already not there...

Ramin

On Sun, Jul 06, 2003 at 06:42:00AM +0200, Internet Protocol version Six wrote:

> I want to forward a connection to the router (192.168.0.1:1600) to 192.168.0.2:23 which from the Internet works fine, however if I connect from a LAN machine (192.168.0.3) to the router on port 1600 I get a "Connection timed out". I use the following rule:
> 
> iptables -I PREROUTING -t nat -p tcp --dport 1600 -j DNAT --to 192.168.0.2:23
> 
> I don't see anything wrong with this, or am I forgetting something?
> 
> wkg,
> 
> -----------------------------------------------------
> Mail.be, WebMail and Virtual Office
> http://www.mail.be
> 

