From: Jason Opperisano <opie@817west.com>
Subject: Re: On vanilla Fedora 3, can't do a transparent proxy (-j REDIRECT)
Date: Mon, 2 May 2005 16:57:42 -0400
Message-ID: <20050502205742.GA12530@bender.817west.com>
References: <df31c4040505021142197fdcdc@mail.gmail.com>
	<20050502185147.GA12120@bender.817west.com>
	<df31c404050502120435134f8@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <df31c404050502120435134f8@mail.gmail.com>
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

On Mon, May 02, 2005 at 03:04:20PM -0400, John G. Norman wrote:
> tcp        0      0 :::8080                     :::*                        LIST

k--so the cheap -n- easy stab was that nothing was listening on TCP port
8080.

here's how i would go about checking this...first--use the REDIRECT
method, as it's the "normal" way to do transparent proxying.  next:

even though your firewall is wide-open, create a rule like:

  iptables -A INPUT -i $INSIDE_IF -p tcp --dport 8080 -j ACCEPT

with the REDIRECT rule and the ACCEPT rule in place, generate some HTTP
traffic from a client behind the firewall.

using "iptables -t nat -vnxL" is the REDIRECT rule getting hits?

if not--HTTP traffic is never making it to this gateway.

using "iptables -vnxL" is the ACCEPT rule getting hits?

if not--there's something wrong with your REDIRECT rule (most likely the
inbound interface).  if it is--packets should be making it to the squid
proxy--is squid setup for transparent proxying?

HTH...

-j

--
"Brian: Whose leg do I have to hump to get a dry martini around here?"
        --Family Guy

