From: Dax Kelson <dax@gurulabs.com>
Subject: Re: Is dropping all ICMP traffic valid?
Date: 12 Nov 2002 17:36:12 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1037147772.25372.6.camel@aramis>
References: <1037143537.8023.4.camel@trent.nin>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1037143537.8023.4.camel@trent.nin>
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
To: alex <alex@bennee.com>
Cc: netfilter@lists.netfilter.org

On Tue, 2002-11-12 at 16:25, alex wrote:
> I'm still trying to figure out why I'm losing connection on my
> portforwarded webserver. One thing I have noticed is the gateway is
> dropping ICMP packets back to the webserver:
> 
> Nov 12 23:01:16 gateway kernel: [Dropped to-lan]IN= OUT=eth0
> SRC=192.168.1.250 DST=192.168.1.110 LEN=576 TOS=0x00 PREC=0xC0 TTL=64
> ID=13411 PROTO=ICMP TYPE=3 CODE=4 [SRC=192.168.1.110 DST=213.155.151.41
> LEN=1500 TOS=0x00 PREC=0x00 TTL=63 ID=8806 DF PROTO=TCP SPT=80 DPT=4776
> WINDOW=7504 RES=0x00 ACK URGP=0 ] MTU=1478 
> 
> which seem to be related to the web connection. I thought ICMP packets
> were not needed for general operation, and even if they where they would
> be covered by the nat and FORWARD tables not being dropped on the local
> process OUTPUT chain.
> 
> Any ideas?

Yes. This is a classic beginner/expert mistake.

ICMP *is* needed for general operation, specifically ICMP Type 3, Code
4.

This is needed for proper MTU path discovery (PMTU). Go google and learn
about this.

If you are doing stateful filtering, then "RELATED" will automatically
match those ICMP packets. For example as the first rule in your INPUT,
or OUTPUT, and/or FORWARD chain (depending on how you have stuff
configured) have:

iptables -A INPUT/FORWARD/OUTPUT -m state --state ESTABLISHED,RELATED -j
ACCEPT




