From: Jason Opperisano <opie@817west.com>
Subject: Re: dhcp server is working but there are no rules allowing it
	using a drop policy
Date: Tue, 08 Mar 2005 10:01:10 -0500
Message-ID: <1110294069.4670.2.camel@hubcap.ljm.dom>
References: <422D8F3E.9000806@rhcs.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <422D8F3E.9000806@rhcs.de>
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

On Tue, 2005-03-08 at 06:40, richard hauswald wrote:
> Hi all,
> my problem is a verry strange one, so i think i did a configuration 
> failure. But i can't find him.
> i made a listung of my iptables rules using the -L parameter and finaly 
> a tcpdump wich should show you, that dhcp is working - well i couldnt 
> post hte windowsxp bubble wich says that i got a wunderfull wlan 
> connection...
> 
> -------------------------------------

<--snip-->

most DHCP implementations these days operate (read:  generate and
receive packets) at the BPF layer, which is below where netfilter hooks
into the IP stack; therefore your iptables rules never see the packets.

-j

--
"I bet Einstein turned himself all sorts of colors before he invented
 the light bulb."
	--The Simpsons


