From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: not loadbalancing but 2 ISPs
Date: Tue, 18 Jun 2002 09:16:55 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206180816.g5I8GwA28419@Networker.rockstone.co.uk>
References: <20020617232700.A3401@trot>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <20020617232700.A3401@trot>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

On Tuesday 18 June 2002 4:27 am, George Georgalis wrote:

> I'm going to be migrating some servers from one ISP to another at the
> same location.

You will have to consider which one of those ISPs is your default route.

Right now, your default route is via ISP 1.

Some day, your default route will be via ISP 2.

There will be some point in between when you switch default routes from ISP 1 
to ISP 2 - at that time you need to change your POSTROUTING rules as well.

> Does this scenario hold water (simplified syntax for clarity). The idea
> is for the server to respond (all the way to the client) regardless of
> whether the request went to the IP on ISP1 or ISP2.

Getting the server to *respond* will work fine.  No problems.

What's more difficult is letting the server initiate outgoing connections, 
because you have to know which source address to give it.

> nat -A POSTROUTING -s $DMZ_host01 -o $EXT_T1a -j SNAT --to-source
> $T1a_host01
> nat -A POSTROUTING -s $DMZ_host01 -o $EXT_T1b -j SNAT --to-source
> $T1b_host01

Only one of these will ever get matched - the one which corresponds to yur 
default route to the outside world, via ISP 1 or ISP 2.

> I'm concerned about those POSTROUTING
> lines, is there a workaround?

Look into iproute2 at http://defiant.coinet.com/iproute2 and see if you want 
to get involved.   I'd suggest no, if you're just migrating from one ISP to 
the other.   If you wanted to keep both running long term, it might be 
worthwhile.

> Would the system also work for high
> availability, if I could get DNS to behave?

For inbound connections, yes - you can get half your incoming connections to 
go to $EXT_T1a and half to go to $EXT_T1b.   You will have to let *all* 
outbound connections (ie ones initiated from your DMZ) go via the default 
route though.

 

Antony.

