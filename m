From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Is dropping all ICMP traffic valid?
Date: Wed, 13 Nov 2002 01:01:17 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021113010119.NUVS26478.mta05-svc.ntlworld.com@there>
References: <1037143537.8023.4.camel@trent.nin>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
To: netfilter@lists.netfilter.org

On Tuesday 12 November 2002 11:25 pm, alex wrote:

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

ICMP type 3 code 4 is Source Quench - not very common these days, but 
important to let through if you run systems which use it.

Source Quench basically means "Hold it !   I can't keep up !   Slow Down!!!", 
and is used by a machine on a slow link to tell a machine on a fast link to 
stop sending data so quickly.

I recommend you let it through.

I also notice the MTU (maximum transmission unit) on this log entry is 1478 - 
you might want to check whether you've got problems with the MSS (maximum 
segment size) being larger than this, causing some packets to get fragmented, 
or even worse, discarded.

Look up "clamp mss to mtu" for more details on this.

Antony.

-- 

If you want to be happy for an hour, get drunk.
If you want to be happy for a year, get married.
If you want to be happy for a lifetime, get a garden.

