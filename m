From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Adding a flag to a packet
Date: Tue, 30 Mar 2004 21:50:40 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403302150.40632.Antony@Soft-Solutions.co.uk>
References: <20040328155231.32b07799@darna.vectec.net> <200403302124.18451.Antony@Soft-Solutions.co.uk> <20040330163510.4bddd065@darna.vectec.net>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040330163510.4bddd065@darna.vectec.net>
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
To: netfilter@lists.netfilter.org

On Tuesday 30 March 2004 9:35 pm, Cody Harris wrote:

> So estentally (SP), i want to  create a "patch" between to physical
> networks transparently. So as far as the internet network computers
> (192.168.*.*) are concerned, they're phsically attached. The 192.168.0.*
> system is actually a different physical site then 192.168.1.*. Just when
> one sends to the other, it's altered to send accross the net and re-wrote
> at the other end and it continues on it's marry way.

Okay.   You want a VPN (I use http://www.freeswan.org), a simple IP tunnel 
(http://www.tldp.org/HOWTO/Adv-Routing-HOWTO/lartc.tunnel.ip-ip.html), or 
else some clever DNAT rules one end, and SNAT rules the other.

Regards,

Antony.

