From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Memory leaks in ip_conntrack?
Date: Tue, 11 Nov 2003 00:33:00 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311110033.hAB0X3j17260@agate.rockstone.co.uk>
References: <EFBADA8C200C2B418DA39734FD15475B0B204E@skat.sky.com> <200311101903.09886.Alistair@nerdnet.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200311101903.09886.Alistair@nerdnet.ca>
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

On Tuesday 11 November 2003 12:03 am, Alistair Tonner wrote:

> 	what is set in /proc/sys/net/ipv4/tcp_wmem?
>
> 	I suspect that what is STOPPing the network is there ..
> 	cat /proc/sys/net/ipv4/tcp_wmem -- on my system the max is ...
> 	!! 131072 !!
>
> 	Maybe you've maxed your memory allocation for TCP?

I can understand why you think this might be the magic number causing the 
problem, but why would Kishore be running into this limit with only 20 to 30 
connections active on the machine?

> > I believe /proc/slabinfo gives # of conntracks being used, in my tests I
> > usually find slabinfo number is same as number of entries in
> > /proc/net/ip_conntrack. But, after 18hrs or so the number in
> > /proc/slabinfo reaches maximum and box starts refusing connections,
> > /proc/net/ip_conntrack show 20 to 30 entries, I hear
> > /proc/net/ip_conntrack is unreliable and broken. Anyway, I guess I have
> > to dig into the code.

Antony.

-- 

What a waste it is to lose one's mind -- or not to have a mind.   How true 
that is.

 - Dan Quayle, vice-president of the United States of America
                                                     Please reply to the list;
                                                           please don't CC me.

