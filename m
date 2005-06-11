From: Jason Opperisano <opie@817west.com>
Subject: Re: IMCP not returning
Date: Sat, 11 Jun 2005 16:24:12 -0400
Message-ID: <20050611202412.GA10262@bender.817west.com>
References: <1118504253.18567.1.camel@debianbox>
	<20050611155825.GA9624@bender.817west.com>
	<20050611160818.GA9697@bender.817west.com>
	<1118507389.18567.3.camel@debianbox>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1118507389.18567.3.camel@debianbox>
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

On Sat, Jun 11, 2005 at 07:29:49PM +0300, Sadus . wrote:
> This is what i'm getting:
> 
> debian:~# ip route get locationIP
> locationIP dev eth1  src HostIP     
> 	cache  mtu 1500 advmss 1460 hoplimit 64

that's not a complete entry, unless $locationIP is on the same layer 3
subnet as $HostIP.

like this output from my machine on 10.1.1.0/24 with IP 10.1.1.223:

$ ip route get 10.1.1.1
10.1.1.1 dev eth0  src 10.1.1.223
    cache  mtu 1500 advmss 1460 fragtimeout 64

a route get for an IP address not on the local segment would have a "via
$gateway_IP" part to it:

$ ip route get 4.2.2.2
4.2.2.2 via 10.1.1.1 dev eth0  src 10.1.1.223
    cache  mtu 1500 advmss 1460 fragtimeout 64

since you're not providing any actual IP information, i can't actually
help you, but if $locationIP is not on the same layer 3 subnet as
$HostIP, or is not *directly* reachable on eth1, someone has added a
faulty route to that box along the lines of this:

  ip route add $locationIP dev eth1

instead of:

  ip route add $locationIP via $gateway_IP

good luck figuring it out--you have all the tools at your hands now.

-j

--
"Peter: YEAH. I'm also addicted to boobies."
        --Family Guy

