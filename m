From: "Toby DiPasquale" <codeslinger@gmail.com>
Subject: Re: Urgent help with firewall packet forwarding!!
Date: Thu, 1 Jun 2006 08:09:36 -0700
Message-ID: <876ef97a0606010809s61818978m685224532bbfc2ac@mail.gmail.com>
References: <1177.202.123.0.206.1149096265.squirrel@mx.uom.ac.mu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1177.202.123.0.206.1149096265.squirrel@mx.uom.ac.mu>
Content-Disposition: inline
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
To: "ramsurrunv@mx.uom.ac.mu" <ramsurrunv@mx.uom.ac.mu>
Cc: netfilter@lists.netfilter.org

On 5/31/06, ramsurrunv@mx.uom.ac.mu <ramsurrunv@mx.uom.ac.mu> wrote:
> 1) FW1 & FW2 are PCs with iptables firewalls on them. They verify the
> packets from PC_A and then forwards them on towards PC_D. Is there a way
> to make the firewalls forward traffic with having them do routing, that
> is, only switch the packets to the other side after inspection?
>
> 2) If I put the NICs eth0 & eth1 of the firewalls FW1 & FW2, eth1 & eth2
> of PC_B and PC_C on the same network, with ip forwarding enabled and
> rp_filter disabled, will the FORWARD Chain of the iptables forward the
> packets from PC_A to PC_D without having a look at the routing table.I
> tried to do it, but it didn't work..i don't know if it's possible or it's
> simply me making some mistakes with the routing.
>
> Any help will be most appreciated..to all of you guys, pls give me your
> comments cos I'm stuck with making this work for quite some time now :(

It sounds to me like what you want is for FW1 and FW2 to be
"bridging", not necessarily as firewalls, per se. Check out this page
for more info on using Linux to do Ethernet bridging:

http://linux-net.osdl.org/index.php/Bridge

If that's not what you want, then the only other thing you can do is
try to describe more fully what you want by first investigating this
document to see what's possible:

http://lartc.org/howto/

HTH

-- 
Toby DiPasquale
0x636f6465736c696e67657240676d61696c2e636f6d

