From: Ramin Alidousti <ramin@cannon.eng.us.uu.net>
Subject: Re: OUTPUT and PREROUTING
Date: Sun, 8 Sep 2002 01:54:49 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020908055449.GA15060@cannon.eng.us.uu.net>
References: <Pine.GSO.4.44.0209061904040.12257-100000@wezen.cis.ksu.edu> <Pine.LNX.4.44.0209080015550.7110-100000@triton.neptune.on.ca>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0209080015550.7110-100000@triton.neptune.on.ca>
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
To: Steve Mickeler <steve@neptune.ca>
Cc: Rengakrishnan Subramanian <subbu@cis.ksu.edu>, netfilter@lists.netfilter.org

On Sun, Sep 08, 2002 at 12:30:53AM -0400, Steve Mickeler wrote:

> 
> Logically looking at it, how would you expect A to suddenly start talking
> to B without talking to C ?
> 
> A initiates a connection with C, using iptables you could do a redirect
> which would send the packets to B but they will always have to be resent
> from C.
> 
> How is C suppose to tell A to send the rest of the data to B ?
> 
> This would be at the application layer, and currently only HTTP is able to
> handle a redirect via sending the redirect message over HTTP to the client
> browser at A which then will start to talk to B for the rest of that HTTP
> session.
> 
> If you are doing this for redundancy of C and B, then you could run vrrp
> or something else between C and B so that if one fails, then the other
> becomes active. This would create a new variable, D, which would be the
> floating IP between B and C, so that A will never know about B or C it
> will want to go to D which, depending on the active server would be B or
> C.
> 
> Get it ?

Basically, vrrp is not meant for the endpoints, so you shouldn't run
applications on them. It's just a helpful solution for the redundant
routers. If you have a TCP connection with D (which resides on host
B at the initiation of the connection) then suddenly B becomes unavailable
and C takes this IP (D) over, that's where that connection breaks.
The subsequent connections would be made to C, of course.

Ramin


