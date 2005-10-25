From: =?ISO-8859-1?Q?J=F6rg_Harmuth?= <harmuth@mnemon.de>
Subject: Re: Forwarding to another ip:port based on source
Date: Tue, 25 Oct 2005 12:07:24 +0200
Message-ID: <435E03DC.90900@mnemon.de>
References: <200510240628.j9O6Skw3002058@linux.tonyspencer.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200510240628.j9O6Skw3002058@linux.tonyspencer.co.uk>
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
To: netfilter@lists.netfilter.org

Tony Spencer wrote:
> Hi 
> 
> Is it possible to have an IPTables rule that will forward any packets on a
> given port to another ip address and port based on where the packet came
> from?

Yes

> For example if I have a server on IP 192.168.0.1 and any requests into that
> server on port 80 from a source IP of 192.168.1.10 and want to force those
> packets to our squid server 192.168.0.11 on port 3128. But only for the IP
> 192.168.1.10, all other requests to the server on port 80 should stay local?

Use -s option like this:

-t nat -A PREROUTING -p tcp --dort 80 -s 192.168.1.10 \
    -j DNAT --to 192.168.0.11:3128

Probably you will have to SNAT too. Watch with tcpdump.

HTH,

Joerg


