From: primero <primero@fastwebnet.it>
Subject: Re: DNATed packet not hitting FORWARD chain
Date: Tue, 23 Nov 2004 10:29:21 +0100
Message-ID: <41A302F1.5020102@hdr-roma.it>
References: <9FB9C39FACF4034BB4AC7F89F2AEB0AB0159373A@win2k.aries.dpmg.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <9FB9C39FACF4034BB4AC7F89F2AEB0AB0159373A@win2k.aries.dpmg.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: James <newsjn@dpmg.com>
Cc: netfilter@lists.netfilter.org

James wrote:

>Hi,
>
>I'm having some trouble getting DNAT to work properly.  I have a gateway
>machine that has two different connections to the Internet, on eth1 and
>eth2.  I'm trying to allow inbound port 1723 to be forwarded to an internal
>PPTP server through both interfaces.  It works on eth2, but not eth1.
>Here's what I've got:
>
>  
>
Hi
I would try to check if packets arrives on .165 by tcpdump on this host.
just to see if DNATTING and FORWARDING is done correctly, and it should
be based on rules u showed us.

Then i would ask how do you deal with routing packets on your gw. I
mean, if u receive the connection on eth2 and you DNAT and forward to
.167 , the returning packets from .167 should be routed to the eth2 and
exit the gw from that interface. The same for eth1 and .165

What about you routing settings on the gw? maybe u use eth2 as default
route interface and also the packets that come back from .165 exits and
are routed by eth2. this way you'll never get the SNAT rule associated
to the previous DNAT rule matched and applied .

BTW this is just an idea ;)

bye
primero


