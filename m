From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: request and reply/respon packets
Date: Wed, 3 Mar 2004 01:02:44 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403030059.40173.Antony@Soft-Solutions.co.uk>
References: <071f01c400b7$63cc3900$0103a8c0@indoaksesbno>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <071f01c400b7$63cc3900$0103a8c0@indoaksesbno>
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

On Wednesday 03 March 2004 12:35 am, bino-psn wrote:

> Dear All.
> Is there any way to know whter a packet is a "request" or "reply/respon"
> packets ?

I'm not sure if I understand you correctly, but let me make a few definitions 
of my own, and see if they match yours...

"Requests" come from a client to a server.   "Responses" and the reply from 
the server to the client.

Requests start with a SYN packet (I'm assuming we're talking about TCP 
connections here?), and responses start with a SYN/ACK packet.   Thereafter, 
all packets have ACK set.

So, you can detect the first packet of a request from the fact that SYN (only) 
is set, and you can detect the first packet of a response from that fact that 
SYN and ACK are set.

Does that help answer your question?

Antony.

-- 
Perfection in design is achieved not when there is nothing left to add, but 
rather when there is nothing left to take away.

 - Antoine de Saint-Exupery

                                                     Please reply to the list;
                                                           please don't CC me.


