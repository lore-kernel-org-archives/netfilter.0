From: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Subject: Re: Unwanted traffic to be FORWARD-ed is dropped by filter : ARP
 cache problem?
Date: Tue, 19 Oct 2004 08:20:22 -0500
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <41751496.6050505@pbl.ca>
References: <20041018210631.98696.qmail@web20025.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20041018210631.98696.qmail@web20025.mail.yahoo.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jordi Warmenhoven <penguinsula@yahoo.com>
Cc: netfilter@lists.netfilter.org

Jordi Warmenhoven wrote:
> Yes, seems like their ARP Proxy cache timeout is set
> really long. I wonder what would happen if I do a "-j
> REJECT --reset-with icmp-host-unreachable" on this
> particular FORWARD traffic. Would it remove the false
> entry in the ARP cache on the gateway?

I doubt.  But you might try.  Anyhow, even if you try, also use limit 
match.  Otherwise somebody might abuse you for DDOS attack.

> Not so sure there. It's mostly MS-Windows TCP 445
> connections I drop in the FORWARD chain, similar to
> the traffic I drop in the INPUT chain (which could be
> worms). I think worms prefer to really enter the box
> instead of trying to get rerouted in my FORWARD chain.

Worms are not attacking your box specifically.  They are just trying out 
random addresses.

-- 
Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
Systems Administrator                           1499 Buffalo Place
Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7

