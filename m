From: Jason Opperisano <opie@817west.com>
Subject: Re: Problem with NAT and ipsec (freeswan)
Date: Sun, 31 Oct 2004 13:47:19 -0500
Message-ID: <1099248439.3271.9.camel@hubcap.ljm.dom>
References: <Pine.LNX.4.58.0410292141120.628@lgh3812534.vittran.norrnod.se>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.58.0410292141120.628@lgh3812534.vittran.norrnod.se>
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
To: netfilter@lists.netfilter.org

On Fri, 2004-10-29 at 15:49, netfilter@lgh3812534.vittran.norrnod.se
wrote:
> I have a linux box (redhat 9.0) that I want to use for NAT and VPN tunnel.
> The netfilter setup is very simple, just this line:
> iptables -t nat -A POSTROUTING -s 192.168.167.0/24 -o eth1 -j
> SNAT --to my_external_ip
> 
> Everyting works fine and the linux box does nat for internal subnet. But
> when I start ipsec (freeswan) (service ipsec start) nat stops forwarding
> packets.
> 
> Any tips?

there's a problem with your ipsec.conf.

-j

--
"What's the point of going out, we're just going to end up back
here anyway?"
	--The Simpsons


