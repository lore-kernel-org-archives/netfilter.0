From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: raw ICMP ports
Date: Tue, 13 Jul 2004 09:56:14 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407130956.15183.Antony@Soft-Solutions.co.uk>
References: <200407130831.i6D8Vg1m012187@ylpvm01.prodigy.net>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200407130831.i6D8Vg1m012187@ylpvm01.prodigy.net>
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

On Tuesday 13 July 2004 9:31 am, Spiro Azkoul wrote:

> I shutdown a bunch of startup services and only have specific ports open,
> and IPTABLES on top.
>
> Out of no where, the following lines appeared on my netstat as of 3 days
> ago
>
> raw   125024      0 *:icmp                  *:*                     7
> raw   126688      0 *:icmp                  *:*                     7
> raw   126688      0 *:icmp                  *:*                     7
>
> I can't exactly figure out what this is.

It suggests to me that you have decided to block (all?) ICMP packets.

The numbers 125024 etc indicate the number of packets received on the socket 
but not processed by any application.

From the netstat man page:

-----
OUTPUT
   Active Internet connections (TCP, UDP, raw)
   Proto
       The protocol (tcp, udp, raw) used by the socket.

   Recv-Q
       The count of bytes not copied by the user program connected to this 
socket.

   Send-Q
       The count of bytes not acknowledged by the remote host.
-----

Check your rules to see what ICMP you are allowing - my suspicion is that it 
isn't enough...

Regards,

Antony.

-- 
If builders made buildings the way programmers write programs, then the first 
woodpecker to come along would destroy civilisation.

                                                     Please reply to the list;
                                                           please don't CC me.


