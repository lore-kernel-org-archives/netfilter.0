From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: LOG per IP basis
Date: Thu, 8 Apr 2004 12:16:40 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404081216.40625.Antony@Soft-Solutions.co.uk>
References: <000a01c41d59$3f9bda90$da0da8c0@pisic>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000a01c41d59$3f9bda90$da0da8c0@pisic>
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

On Thursday 08 April 2004 12:04 pm, Danila Octavian wrote:

> Hello,
>
> This is my first post to the list after many months, but i'm running out of
> time with my problem.
>
> Anyone can tell me how to log separately trafic to the outside world of my
> machines that are behind a masquerading firewall ?
>
> my setup : internet --- ETXIP fw INTIP --- 192.168.13.0/24.
>
> for example i want to be able to measure how much traffic is doing
> 192.168.13.222 (for example) to the outside world but not to my extip or
> intip.

Put a rule in a mangle table which matches your packets - no need for a target 
(the POSTROUTING chain would probably be best - then you only count traffic 
which left the machine - ie: didn't get filtered out), and use "iptables -L 
-t mangle -nvx" to get the packet/byte counts.

Regards,

Antony.

-- 
There are only 10 types of people in the world:
those who understand binary notation,
and those who don't.

                                                     Please reply to the list;
                                                           please don't CC me.


