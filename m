From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: Firewall.routing configuration problems
Date: Thu, 20 Oct 2005 14:17:13 -0500
Message-ID: <200510201417.13180.rob0@gmx.co.uk>
References: <003c01c5d595$00853360$e7544381@SANNPJLTABLET>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <003c01c5d595$00853360$e7544381@SANNPJLTABLET>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Thursday 2005-October-20 11:40, Paul Lewis wrote:
> iptables -t nat -A POSTROUTING -s 192.168.0.0/24 -j MASQUERADE -o
> eth3

Are you thinking that the "-o eth3" will modify the behaviour of the 
MASQUERADE target? It will not. It merely modifies which packets match 
the rule. The above matches packets with source address 192.168.0.0/24 
which are routed out device eth3.

See also SNAT, which is more appropriate with static IP addresses. 
MASQUERADE is for home users and dynamic IP addresses.

IIUC your issue, which I might not because I didn't spend much time on 
it, it's routing. You need to have routes for your conference guests. 
Furthermore as has been suggested here to me (and I concur) you should 
start unlearning route(8) and ifconfig(8) and start learning ip(8) from 
iproute2, which is far more powerful and capable.
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

