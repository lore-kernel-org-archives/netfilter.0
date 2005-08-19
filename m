From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: Enable Loopback confuse
Date: Fri, 19 Aug 2005 08:18:26 -0500
Message-ID: <200508190818.26391.rob0@gmx.co.uk>
References: <BAY22-F13F52A0BB552F1A3EF3365A6B50@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <BAY22-F13F52A0BB552F1A3EF3365A6B50@phx.gbl>
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

On Friday 2005-August-19 05:41, nattapon viroonsri wrote:
> When i enable loopback i just use 2 line below and everything work
> fine iptables -A INPUT -i lo -j ACCEPT
> iptables -A OUTPUT -o lo -j ACCEPT

Correct, unless earlier rules do something to prevent these rules from 
being evaluated.

> But i see many example around then have also included this line
>  below to enable loopback
> iptables -A FORWARD -o lo - j ACCEPT ?

They are wrong. FORWARD rules are checked when *both* the source and 
destination IP's are not local. Normal loopback traffic can never hit 
the FORWARD chain.

> So can i omit this line ?
> or what kind of packet that match this rule ?

Yes. None. It's possibly true that specially-crafted packets and silly 
routing could be employed, but this is not a real-world situation.

filter table            IP address
built-in chains         source          destination
----------------        ------          -----------
INPUT                   n/a             local
OUTPUT                  local           not local
FORWARD                 not local       not local

Each packet is checked against the rules in only one of the built-in 
chains, *except* loopback traffic, which hits OUTPUT going out, and 
then INPUT coming in.
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

