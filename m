From: Wakko Warner <wakko@animx.eu.org>
Subject: Re: Change Source
Date: Mon, 30 Oct 2006 12:38:07 -0500
Message-ID: <20061030173807.GA16619@animx.eu.org>
References: <45462A20.3040504@gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <45462A20.3040504@gmail.com>
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
To: Nathaniel Hall <nathaniel.d.hall@gmail.com>
Cc: netfilter@lists.netfilter.org

Nathaniel Hall wrote:
> Is there any way to change the source address of an outbound ICMP packet?
> 
> Here is why I am asking.  Instead of dropping packets I reject them with ICMP host unreachable
> packets.  If I were to try to initiate a connection to my firewalls outside IP I would get a host
> unreachable from the same IP address as the firewall.  I would like to be able to change this
> address to be the gateway at my ISP.  That will lesson the chances of recon and mess with a few
> heads.  Is there any way?

I did this once, but for some reason it won't work with my current machine
(Using an older kernel if that matters).

Background: I have a range of IPs.  I route the ones I am using to the
proper interface and anything else gets icmp-network-unreachable.  To do
this I just did:
iptables -I FORWARD -i internetif -o internetif -j REJECT ...

In the nat/POSTROUTING change I look for icmp-network-unreachable and -j
SNAT it to the address I want.  Unfortunately, it does this for all
icmp-network-unreachable.  I know of no way, other than u32 patch, to
determin what the original connection was.

Be aware that your provider may not allow you to spoof the ip address and
just drop the packets that you altered.

-- 
 Lab tests show that use of micro$oft causes cancer in lab animals
 Got Gas???

