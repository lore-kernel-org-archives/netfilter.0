From: "Brad Morgan" <B-Morgan@concentric.net>
Subject: RE: SSH and NAT
Date: Mon, 24 Mar 2003 13:27:54 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <NABBJOOEOFODEALNMJAJCEFEHOAA.B-Morgan@concentric.net>
References: <20030324182922.GF8391@netinertia.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030324182922.GF8391@netinertia.co.uk>
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
To: James O'Gorman <james@netinertia.co.uk>, netfilter@lists.netfilter.org

> I'm having a slight problem with SSH and NAT. I've got an ADSL
> connection with a single static IP, and I'd like to be able to SSH to
> any of my boxes within my network, but without having to use separate
> ports to do it. Is this possible?
>
> My setup is:
> 
> Internet -> ZyXEL ADSL router (192.168.0.1) -> Debian Server
> (192.168.0.2) -> box1 (0.3) / box2 (0.4)

I assume you mean from the Internet.  If that's the case, then the
answer is no.  Your box1 and box2 are in a private address space which
by definition, isn't routed to the outside world.  What your router
sees is packets with resolved IP addresses.  There are no names in
the packets at this point.  You only have one public IP address.

You have two choices.  One you've mentioned which is to use separate
ports for each machine which are then DNATed from the server to the
right box.  The second is to use ssh twice, once from the outside to
the Debian server, and then from there to the box of your choice.

Regards,

Brad Morgan




