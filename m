From: "Lawrence G. Hunsicker" <lhunsicker@mchsi.com>
Subject: Re:  Forwarding and masquerading got broken
Date: Wed, 03 Dec 2003 23:43:38 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3FCEC98A.8000703@mchsi.com>
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

Michael Gale said:

Hello,

	Look the section"
--snip--
# --------( Sysctl Tuning - Recommended Parameters )--------

# Turn off IP forwarding by default
# (this will be enabled if you require masquerading)

if [ -e /proc/sys/net/ipv4/ip_forward ]; then
   echo 0 > /proc/sys/net/ipv4/ip_forward
fi
--snip--

The "echo 0" in the "/proc/sys/net/ipv4/ip_forward" is disabling 
ip_forwarding -- which is need to forward packets.

Change the "echo 0" to "echo 1"

Mike:

Thanks for the suggestion.  Note, though, that further down in the file 
there is a parallel section cating 1 to the same address to turn on 
kernel forwarding.  I have checked the actual setting after boot up by 
lessing the address, and it is indeed already set to one.  I'll check 
changing this line, but I suspect that this is not where my problem is.

Any other suggestions?


-- 
Lawrence G. Hunsicker
lhunsicker@mchsi.com


