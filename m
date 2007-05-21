From: Martijn Lievaart <m@rtij.nl>
Subject: Re: using packet filtering to discover TCP end-to-end latency
Date: Mon, 21 May 2007 19:25:05 +0200
Message-ID: <4651D5F1.2080701@rtij.nl>
References: <C4794891-5098-4238-BC18-2D54D2CB9859@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <C4794891-5098-4238-BC18-2D54D2CB9859@gmail.com>
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
To: Rohit Grover <rgrover1@gmail.com>
Cc: netfilter@lists.netfilter.org

Rohit Grover wrote:
> Hello,
>
> I need to discover the TCP end-to-end latency between web clients and 
> servers transparently (i.e. without altering the clients or the 
> servers in any way). I have squid running as a proxy server on a linux 
> box, sitting between the clients and the servers. I can have the 
> clients change their proxy settings to have requests pass through 
> squid. Squid can measure latencies between itself and the web servers. 
> The problem is to measure the network latency when squid tries to 
> forward the server responses back to clients.
>
> Can packet filtering help me with this? Can I, for example, filter for 
> the client ACK of the last bit of data sent from squid back to the 
> client?
>
> Also, I still need to device a solution to measure network latency 
> experienced by the client's SYN sent to the squid box. Any ideas?
>

I would hire a packeteer for this. Expensive, but is perfect for this 
job. Otherwise, capture with wireshark (formerly Ethereal), export to 
csv, write a small program. (I don't think wireshark has a plugin for 
exactly this).

I would NOT do this with packet filtering unless I need (near) realtime 
analysis. And even then.

HTH,
M4


