From: Chris Wilson <chris@netservers.co.uk>
Subject: Re: Not quite understanding DNAT
Date: Fri, 25 Jul 2003 10:47:30 +0100 (BST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0307251045220.1760-100000@localhost>
References: <3F1FA56E.28480.E59161E@localhost>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F1FA56E.28480.E59161E@localhost>
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
To: "Coutts, Ashe (Testing Account)" <ATest@sbsdk12.org>
Cc: netfilter@lists.netfilter.org

Hi Ashe,

> I have set up a very basic firewall for our system. 
> We have 126 addresses to be used to/from the outside world (204.48.178.0/25) 
> and are using 10.x numbers on the inside.
> 
> It is working almost as I expected except for the following. The DNAT 
> connections come into the system fine but are seen as originating from the 
> eth0 interface rather than their eth0:x interface. So, when attaching to a linux 
> cpu with ssh I am needing to place the ip# for the eth0 interface in the 
> hosts.allow file rather than the much more restrictive eth0:x ip#. Can it be set 
> up so the connection is between the external eth0:x ip# and its linked internal 
> ip#?

You could try:

	route add <internal-server-10.0.0.x> dev eth0 \
		gw <address-of-eth0:x>

Using an address of your own box as the gateway of a route will cause
locally-generated traffic going down that route to come from that address,
instead of the default address on the device. This should mean that the
masquerading uses that address too, but I haven't tested it.

Cheers, Chris.
-- 
   ___ __     _
 / __// / ,__(_)_  | Chris Wilson -- UNIX Firewall Lead Developer |
/ (_ / ,\/ _/ /_ \ | NetServers.co.uk http://www.netservers.co.uk |
\ _//_/_/_//_/___/ | 21 Signet Court, Cambridge, UK. 01223 576516 |


