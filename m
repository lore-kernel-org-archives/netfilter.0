From: Jason Opperisano <opie@817west.com>
Subject: Re: protocol 50 unreachable
Date: Thu, 2 Dec 2004 12:25:31 -0500
Message-ID: <20041202172531.GA5363@bender.817west.com>
References: <1101964546.2025.149.camel@localhost>
	<Pine.LNX.4.44.0412012128370.22471-100000@gollum.grajagan.net>
	<20041202151447.GA4749@bender.817west.com>
	<CACE583C-4474-11D9-A63B-0003939B51C0@grajagan.org>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <CACE583C-4474-11D9-A63B-0003939B51C0@grajagan.org>
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
To: Netfilter Mailing List <netfilter@lists.netfilter.org>

On Thu, Dec 02, 2004 at 07:13:59AM -0800, Helge Weissig wrote:
> Jason,
> 
> 	my ESP packets do not go from the external interface to the internal 
> one and vice versa. The connection to the VPN server works when I hook 
> up directly with no changes other than the IP of the client. I cannot 
> see how this would be a problem with the VPN network at all.
> 
> h.

looking at your logs--all your ESP packets are from client->server.
you don't have a single ESP packet from server->client.  so when you
say, "my ESP packets do not go from the external interface..." you are
ignoring the fact that there are no ESP packets ever getting to your
external interface.

which brings me back to what i said several replies ago:

  your VPN server is discarding the ESP packets from your client as a
  result of the mangling of your intermediate NAT device.

either make the VPN server more tolerant, or use NAT-T on your client.

-j

--
"Ah, good ol' trustworthy beer. My love for you will never die."
        --The Simpsons

