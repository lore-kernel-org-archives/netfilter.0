From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Memory leaks in ip_conntrack?
Date: Tue, 11 Nov 2003 00:12:58 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311110013.hAB0D1j17251@agate.rockstone.co.uk>
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

> On November 10, 2003 03:10 pm, Kishore Dharmavaram wrote:
>
> 	Kishore:
>
> 	what is set in /proc/sys/net/ipv4/tcp_wmem?
>
> 	I suspect that what is STOPPing the network is there ..
> 	cat /proc/sys/net/ipv4/tcp_wmem -- on my system the max is ...
> 	!! 131072 !!
>
> 	Maybe you've maxed your memory allocation for TCP?

People may find /usr/src/linux/Documentation/networking/ip-sysctl.txt helpful 
in understanding this and other entries in /proc/sys/net/ipv4

Antony.

-- 

Programming is a Dark Art, and it will always be. The programmer is
fighting against the two most destructive forces in the universe:
entropy and human stupidity. They're not things you can always
overcome with a "methodology" or on a schedule.
 - Damian Conway, Perl God
                                                     Please reply to the list;
                                                           please don't CC me.

