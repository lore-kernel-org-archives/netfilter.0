From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: TCP_CONNTRACK_ESTABLISHED 5days
Date: Mon, 02 May 2005 11:05:30 -0500
Message-ID: <42764FCA.9070405@riverviewtech.net>
References: <42762C02.8060300@danbbs.dk>
	<427634ED.1030204@danbbs.dk>	<427639CD.6080107@riverviewtech.net>
	<42764CF2.9060503@danbbs.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42764CF2.9060503@danbbs.dk>
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
To: netfilter <netfilter@lists.netfilter.org>

> Hmm, dunno if various distros set tcp_fin_timeout differently.
> With 2.6.10, it's 60 secs (not a distro kernel, and I didn't set this).
> Are you saying that Mouritz' 10mins will in some (distro?) cases violate
>   ip_conntrack_tcp_timeout_established >= tcp_fin_timeout * 2 ?

No, not at all.  I'm merely stating that I see no reason to have ip_conntrack_tcp_timeout_established any higher than tcp_fin_timeout safe for some small head room.  Seeing as how the time was for 5 days, I see no reason to hold it open for twice the tcp_fin_timeout period for safe head room.  Any thing beyond tcp_fin_timeout and your local TCP stack will have closed the connection any way.  As soon as I type this I start wondering about systems behind a firewall.  Hmm...  Something to think about.

> Anyway, /usr/src/linux/Documentation/filesystems/proc.txt says
> 
> tcp_fin_timeout
> ---------------
> The length of time in seconds it takes to receive a final FIN before the 
> socket is always closed.  This is strictly a violation of the TCP
> specification, but required to prevent denial-of-service attacks.
> 
> 
> I'm having trouble understanding the 'strictly a violation' part.
> Is it a (iana) crime to define tcp_fin_timeout?

I have not (recently) read (enough) of the TCP specification to know for sure what is in violation, but I would be willing to bet that a TCP ""conversation is to remain in the open state (Syn, Syn-Ack, Ack-Ack...) state until both sides close the connection gracefully or see a reset.  Thus if we artificially close the connection we are violating the TCP specification by doing such.  Seeing as how this is usually not a problem...  This is sort of like what the TARPIT target is targeting.  TARPIT will take a TCP connection to the established state and release all resources but not honor a close of the connection.  This failure to close the connection causes the sending system to get stuck in the TARPIT (hens the name) until it is willing to forcefully close the connection from it's end via  timeout.



Grant. . . .

