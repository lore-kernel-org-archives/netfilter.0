From: Stephen Jones <hivemynd@hivemynd.net>
Subject: Re: Tuning NAT timeout values
Date: Sun, 26 Feb 2006 13:29:05 -0600
Message-ID: <44020181.4030605@hivemynd.net>
References: <43EA2AA5.3080401@arcoscom.com> <43FE1589.10205@hivemynd.net>
	<d27cd2010602260356n640eeb22g@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <d27cd2010602260356n640eeb22g@mail.gmail.com>
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
To: ludi <myhapwcforever@gmail.com>
Cc: netfilter@lists.netfilter.org

ludi wrote:
> it maybe help you.
> /usr/src/linux/net/ipv4/netfilter/ip_conntrack_proto_udp.c
> #define UDP_TIMEOUT (30*HZ)
> #define UDP_STREAM_TIMEOUT (180*HZ)
> To change these values you can set up the udp timeout values.
> 
> tcp
> 
> /usr/src/linux/net/ipv4/netfilter/ip_conntrack_proto_tcp.c:
> 
> 
> static unsigned long tcp_timeouts[]
> = { 30 MINS, /* TCP_CONNTRACK_NONE, */
> 5 DAYS, /* TCP_CONNTRACK_ESTABLISHED, */
> 2 MINS, /* TCP_CONNTRACK_SYN_SENT, */
> 60 SECS, /* TCP_CONNTRACK_SYN_RECV, */
> 2 MINS, /* TCP_CONNTRACK_FIN_WAIT, */
> 2 MINS, /* TCP_CONNTRACK_TIME_WAIT, */
> 10 SECS, /* TCP_CONNTRACK_CLOSE, */
> 60 SECS, /* TCP_CONNTRACK_CLOSE_WAIT, */
> 30 SECS, /* TCP_CONNTRACK_LAST_ACK, */
> 2 MINS, /* TCP_CONNTRACK_LISTEN, */
> };
> I only find these , but I am not sure whether it work.

Thanks for your reply ludi!  I saw those in the source code also, but I 
was hoping it would be safe to change them with something like this:

echo ### > /proc/sys/net/ipv4/netfilter/ip_conntrack_generic_timeout

Where the ### is the desired value in seconds. Having to recompile 
sources everytime paramaters like this need to be changed would be 
inconvenient, to say the least. If that is the only way, then so be it. 
Thanks again for your reply!

SJ

