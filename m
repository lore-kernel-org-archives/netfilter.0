From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: On vanilla Fedora 3, can't do a transparent proxy (-j REDIRECT)
Date: Mon, 02 May 2005 16:55:06 -0500
Message-ID: <4276A1BA.9040603@riverviewtech.net>
References: <df31c4040505021142197fdcdc@mail.gmail.com>	<df31c40405050213556ddc65b2@mail.gmail.com>	<20050502210104.GB12530@bender.817west.com>	<200505021812.37561.ramoni@databras.com.br>
	<df31c404050502141865ca509c@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <df31c404050502141865ca509c@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Thank you Ramoni, you beat me to the punch.  The PREROUTING chain is for packets inbound and forwarding through the host (I believe), not packets that are generated on the box and will be going out to the world.  For packets generated on the box and going out to the world the OUTPUT chain is what you want to add your rules to.

IMHO there is nothing wrong with testing from the box that is doing the (trans)proxying it's self, you just have to be aware that it will follow different rules than the rest of the network.  The same applies for IPSec VPNs via (Free|Open)SWAN.  I personally always start testing from the firewall it's self via pings, but I include the "-I" parameter to tell ping what IP to use thus emulating traffic that will be coming in from the LAN vs just going out via the WAN.  IMHO this is better in the long run to know how to do as you can do some preliminary testing via SSH connections with out having to have any access to a client system.  Thus you should know how to do the testing from the firewall it's self.



Grant. . . .

