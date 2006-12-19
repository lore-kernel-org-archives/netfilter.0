From: Dai MIKURUBE <dmikurube@acm.org>
Subject: Re: Generating pseudo-packets with netfilter
Date: Tue, 19 Dec 2006 23:27:13 +0900
Message-ID: <4587F6C1.3070904@acm.org>
References: <4587EE1F.8050203@acm.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4587EE1F.8050203@acm.org>
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

Hi,

I make a supplementary explanation.


Finally, my purpose is to make "Pseudo 3-Way Handshake".

At first, a user process create a socket (with socket())
and make it TCP_LISTEN (with listen()).

Next, I'd like to make it's status CONNECTED without any
external computers for some reason. In order to do this,
it's necessary that the Linux Kernel believes a SYN packet
has come. So, of cource, to handle a SYN+ACK pakcet and to
reply an ACK packet are required.


If netfilter cannot generate packets out of nothing,
I think to take the following way:

1. My module call netif_receive_skb() directly to send a SYN packet.
2. Kernel replys a SYN+ACK packet,
     and my module catches it with netfilter.
3. My module DROPs the packet,
     and my module replys an ACK packet with netif_receive_skb().

But it seems to be a little hard. I'm happy if it can be done
with netfilter.

-- 
Dai MIKURUBE
    dmikurube@acm.org

