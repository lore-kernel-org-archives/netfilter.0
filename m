From: Ard van Breemen <ard@kwaak.net>
Subject: Re: arp replies from two adapters of same type in a machine
Date: Fri, 24 Feb 2006 15:57:08 +0100
Message-ID: <20060224145708.GD17756@kwaak.net>
References: <1140623158.6987.59.camel@triumph>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1140623158.6987.59.camel@triumph>
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
To: Adhiraj <adhiraj@linsyssoft.com>
Cc: netfilter@lists.netfilter.org

Hi,
On Wed, Feb 22, 2006 at 09:15:58PM +0530, Adhiraj wrote:
> I have two RTL-8139 network adapters in a machine, they have these IP
> addresses:
> eth1: 192.168.20.1
> eth2: 192.168.21.1
> 
> When I take tcpdump on these interfaces and ping to 192.168.21.1 from
> 192.168.21.50, I see that both the adapters reply to ARP requst sent by
> 192.168.21.50 machine:

I will rephrase what you have:
You have a machine with the ip addresses 192.168.20.1 and
192.168.21.1 configured in the ip stack.
You have 2 nics in the machine which the following routing:
192.168.20.0/24 dev eth1 with default source ip 192.168.20.1
192.168.21.0/24 dev eth2 with default source ip 192.168.21.1
Both nics are on the same network.

Both eth1 and eth2 get an ARP (l2) for 192.168.21.1 (l3), which
according to rfc's should be replied to no matter the source ip.

> Ideally eth1 should not reply to the ARP request.

It should.

If you don't like this behaviour you should use rp-filter for
arp, or use lvs patches to hide the ip address.

PS: this is has nothing to do with proxy-arp. Proxy-arp means you
answer for addresses you can route to. Not for addresses you
already have.

-- 
begin  LOVE-LETTER-FOR-YOU.txt.vbs
I am a signature virus. Distribute me until the bitter
end

