From: Martin Josefsson <gandalf@wlug.westbo.se>
Subject: Re: Netfilter and SCTP
Date: 30 Apr 2003 16:24:42 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1051712682.8215.135.camel@tux.rsn.bth.se>
References: <Law8-F94rhYQYx3G5aY000150f0@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Law8-F94rhYQYx3G5aY000150f0@hotmail.com>
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
To: Cyrille Colin <shishico@hotmail.com>
Cc: Netfilter <netfilter@lists.netfilter.org>

On Wed, 2003-04-30 at 14:50, Cyrille Colin wrote:
> Hi,
> 
> I would like to know how Netfilter's translator deals with SCTP / IP packets 
> (Stream Control Transmission Protocol, IP protocol 132).
> 
> similarly to UDP, it should be able to translate the source adress in the IP 
> header, and the source port in the SCTP common header, if needed. And 
> recompute SCTP and IP headers checksums.
> 
> is this currently supported ? if not how Netfilter behave when receiving 
> such a packet ??
> 
> any help on this would be very much appreciated... seems that NAT boxes do 
> not like SCTP very much...

iptables doesn't have support for SCTP yet, noone has sent a patch for
it :)

-- 
/Martin

