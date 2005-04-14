From: Jason Opperisano <opie@817west.com>
Subject: Re: Problem with DNAT from localhost to LAN via loopback
Date: Thu, 14 Apr 2005 16:19:28 -0400
Message-ID: <20050414201928.GA2726@bender.817west.com>
References: <1113492519.425e8c27488ab@imp1-q.free.fr>
	<20050414171847.GA2040@bender.817west.com>
	<001d01c5412c$b6fda5d0$0926a8c0@HECTISIE>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <001d01c5412c$b6fda5d0$0926a8c0@HECTISIE>
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

On Thu, Apr 14, 2005 at 10:01:14PM +0200, Charles Delorme wrote:
> Thank you for that tip. Are there any side effects for this compilation
> directive ?

not that i'm aware of.  i suppose if you want to split hairs, you're
forcing locally-generated packets to traverse an additional netfilter
hook.  dunno that i would be concerned about that though.

> I'm not sure to understand what kind of rule I need to add in the OUTPUT
> chain. Should I copy the kind of rule I have in the PREROUTING table ?

probably.  something like:

  iptables -t nat -A OUTPUT -p tcp -d $EXT_IP --dport 3739 \
    -j DNAT --to-destination 192.168.38.9:3739

the result being that when the firewall tries to connect to its own
external IP on TCP port 3739, the connection gets DNAT-ed to the 38.9
machine--which i *think* is what you were after.

-j

--
"Stewie: Careful! You're washing a baby's scalp, not scrubbing the vomit
 out of a Christmas dress, you stupid holiday drunk."
        --Family Guy

