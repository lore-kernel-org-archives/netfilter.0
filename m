From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: tcp & udp timeout hardcoding
Date: Mon, 17 Nov 2003 16:30:05 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311171630.hAHGU8j22270@agate.rockstone.co.uk>
References: <20031117144208.GA22431@nest.8d.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031117144208.GA22431@nest.8d.com>
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

On Monday 17 November 2003 2:42 pm, xavier wrote:

> Hello,
>
> I saw in the 2.4.22 kernel source :
>
> /usr/src/linux/net/ipv4/netfilter/ip_conntrack_proto_tcp.c
> static unsigned long tcp_timeouts[]
> = { 30 MINS,    /*      TCP_CONNTRACK_NONE,     */
>     5 DAYS,     /*      TCP_CONNTRACK_ESTABLISHED,      */
>     2 MINS,     /*      TCP_CONNTRACK_SYN_SENT, */
>     60 SECS,    /*      TCP_CONNTRACK_SYN_RECV, */
>     2 MINS,     /*      TCP_CONNTRACK_FIN_WAIT, */
>     2 MINS,     /*      TCP_CONNTRACK_TIME_WAIT,        */
>     10 SECS,    /*      TCP_CONNTRACK_CLOSE,    */
>     60 SECS,    /*      TCP_CONNTRACK_CLOSE_WAIT,       */
>     30 SECS,    /*      TCP_CONNTRACK_LAST_ACK, */
>     2 MINS,     /*      TCP_CONNTRACK_LISTEN,   */
> };
>
> Is there any plan to be able to set thoses values throught /proc ?
>
> in some cases a 5 days timeout on tcp connexions may be too long...

These are the standard values according to the TCP RFCs.   You can change 
them on your machine if you like, but it involves a kernel recompile (or a 
netfilter module recompile, if you use modules).

Note that you can adjust these sort of timings for the normal Linux TCP/IP 
stack by writing to various things in /proc/sys/net/ipv4, but this doesn't 
affect the netfilter connection racking table timeouts.

See /usr/src/linux/Documentation/networking/ip-sysctl.txt for more details.

Bear in mind that fiddling with this sort of stuff can break your network 
connectivity and/or compatibility.

Regards,

Antony.

-- 

The first ninety percent of an engineering project takes ninety percent
of the time, and the last ten percent takes the remaining ninety percent.

                                                     Please reply to the list;
                                                           please don't CC me.

