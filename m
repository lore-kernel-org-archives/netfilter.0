From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Bandwidth Monitor
Date: Sat, 8 May 2004 11:53:19 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405081153.19812.Antony@Soft-Solutions.co.uk>
References: <006001c434da$7c6400e0$36b4fea9@SABNANIS>
Reply-To: Netfilter <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <006001c434da$7c6400e0$36b4fea9@SABNANIS>
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
To: Netfilter <netfilter@lists.netfilter.org>

On Saturday 08 May 2004 9:57 am, Harry wrote:

> Hi All,
> I have a DSL connection which has a bandwidth capacity of 3GB a
> month...having said that I have 16 machines hooked up on the network with a
> linux server, is there a away to capture/monitor the total consumption of
> bandwidth utilised per machine or server basis.

I would recommend iptraf, ntop or ipac.

Try http://www.topology.org/comms/netmon.html for some ideas.

If you really want to do it with netfilter, try some rules like this:

iptables -A POSTROUTING -t mangle -d a.b.c.d
iptables -A PREROUTING -t mangle -s a.b.c.d

Repeat for every machine on your network, changing a.b.c.d in each pair of 
rules to match the IP address of that machine.

Note there is no target for these rules - this is deliberate (and correct).

When you want to know how many bytes have gone to & come from each machine:

iptables -L -t mangle -nvx

When you want to reset the counters to zero (midnight on 1st of each month?):

iptables -Z

Regards,

Antony.

-- 
Ramdisk is not an installation procedure.

                                                     Please reply to the list;
                                                           please don't CC me.


