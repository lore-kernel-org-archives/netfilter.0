From: Ishwar Rattan <ishwar@pali.cps.cmich.edu>
Subject: Re: Bridge rule info?
Date: Sat, 14 Jan 2006 17:47:09 -0500 (EST)
Message-ID: <Pine.LNX.4.56.0601141744080.28763@pali.cps.cmich.edu>
References: <Pine.LNX.4.56.0601141648560.28674@pali.cps.cmich.edu>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.56.0601141648560.28674@pali.cps.cmich.edu>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I realize that I am a little confused about bridging.
Before the bridge, I was running firewall on interface eth0
After the bridge (br0) is up, eth0 and tun0 are bridged to it
- does it mean that br0 is now the interface to run firewall on?

-ishwar

On Sat, 14 Jan 2006, Ishwar Rattan wrote:

>
> I have a debian based Linux box connected to dept LAN
> with iptables running. I am interested in eth0 and tun0
> bridge (br0) on this box. If I remove the firewall first and
> then set up the bridge, it works as promised. If the firewall
> is brought up the bridge stops. So, I am looking for a
> way for bridge and firewall to work together.
>
> Any ideas?
> -ishwar
>
>

