From: Gavin Hamill <gdh@acentral.co.uk>
Subject: Re: smtp
Date: Fri, 14 May 2004 13:28:49 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405141328.49497.gdh@acentral.co.uk>
References: <BAY15-F11n0swXX1sPt0005ad74@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <BAY15-F11n0swXX1sPt0005ad74@hotmail.com>
Content-Disposition: inline
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

On Friday 14 May 2004 13:07, azeem ahmad wrote:
> thanks a lot Mr. Gavin Hamill
> but i have blocked all the port 25 traffic even then the infected ip which
> is 192.168.0.105 is reciving smtp from many ip addresses from out side
> the script i run is as follow

That's fairly comprehensive - I don't think much will be getting through 
that :)

You'll be running iptables on a machine with at least 2 network cards, so you 
may wish to try tcpdump on both eth0 and eth1 - since you will still likely 
be seeing the incoming traffic from the outside listed in the 'tcpdump' 
ouput, but no replies should be happening.

Likewise, when you try on the other interface, you may see the LAN machine 
trying to send out a lot, but the connections will be failing and there 
should be nothing to worry about.

Feel free to post a small amount of 'tcpdump' output if it would help clear 
things up?

Cheers,
Gavin.

