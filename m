From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: how to construct rule to match multiple non-sequential ipv4 addresses
Date: Fri, 18 Oct 2002 17:36:39 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200210181636.g9IGamL28805@vulcan.rissington.net>
References: <Pine.LNX.4.44.0210180916130.26320-100000@home.apu.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0210180916130.26320-100000@home.apu.edu>
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

On Friday 18 October 2002 5:22 pm, Chris Len wrote:

> Is there any way to accomplish something like the following?
> iptables -t filter -A INPUT -s (!192.168.0.2 || !192.168.0.3) -j DROP

Er, yes...

iptables -t filter -A INPUT -j DROP

    :-)

Your request says "If the source address is not .2, or is not .3, then drop". 
All addresses are "not .2" except for .2, and that is "not .3" therefore all 
addresses match :-)

If, however (as I suspect) you meant to ask "if the address is not .2 and is 
not .3, then drop", try something like this:

iptables -N mychain
iptables -A INPUT -j mychain
iptables -A mychain -s 192.168.0.2 -j RETURN
iptables -A mychain -s 192.168.0.3 -j RETURN
iptables -A mychain -j DROP

This creates a user-defined chain called mychain, the INPUT chain calls the 
user-defined chain, where packets with source address 192.168.0.2 return to 
the INPUT chain and continue processing, as do packets with source address 
192.168.0.3, all other packets get DROPped.

Antony.

-- 

You can spend the whole of your life trying to be popular,
but at the end of the day the size of the crowd at your funeral
will be largely dictated by the weather.

 - Frank Skinner

