From: Jason Opperisano <opie@817west.com>
Subject: Re: Logging the whole packet
Date: Tue, 23 Nov 2004 17:12:06 -0500
Message-ID: <20041123221206.GA3476@bender.817west.com>
References: <41A3B0A4.9020906@vt.edu>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <41A3B0A4.9020906@vt.edu>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Tue, Nov 23, 2004 at 04:50:28PM -0500, Brad Tilley wrote:
> Is it possible to log the packet body and not just the header?
> 
> Currently I have this line in my iptables start-up file:
> 
> /sbin/iptables -I INPUT -p tcp -s ! 128.173.120.79 -d 128.173.120.79  -j 
> LOG --log-prefix="Packet_Filter:"
> 
> And it generates log entries such as this:
> 
> Nov 23 16:44:28 athop1 kernel: Packet_Filter:IN=eth0 OUT= 
> MAC=00:30:6e:5e:a2:0c:00:d0:01:ab:44:00:08:00 SRC=64.81.214.131 
> DST=128.173.120.79 LEN=48 TOS=0x00 PREC=0x00 TTL=110 ID=29621 DF 
> PROTO=TCP SPT=60366 DPT=445 WINDOW=16384 RES=0x00 SYN URGP=0
> 
> I'd like to capture the packet body as well. I'm new to packet logging 
> so forgive me if I'm over looking the obvious.

AFAIK, the normal LOG target cannot actually do this.  instead, use the
ULOG target which will copy the entire packet to the userspace ulogd
daemon where you can use the ulogd_PCAP.so plugin to create a tcpdump
file of the packets you are interested in.  check out:

  http://gnumonks.org/gnumonks/projects/project_details?p_id=1

for more details about ulogd.

HTH...

-j

--
"Television! Teacher, mother, secret lover."
        --The Simpsons

