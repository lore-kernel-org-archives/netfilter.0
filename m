From: Joel Newkirk <netfilter@newkirk.us>
Subject: RE: transparent tcp proxy
Date: 27 May 2003 02:24:31 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1054016670.1847.213.camel@alpha.newkirk.us>
References: <09B04A55822EFF4DA48D2E0BB2941D4A019241@wardrive.citadelcomputer.com.au>
	 <1053938722.17259.6.camel@stilmant>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1053938722.17259.6.camel@stilmant>
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
To: ml-netfilter@adtech.be
Cc: netfilter@lists.netfilter.org

On Mon, 2003-05-26 at 04:45, Michael Stilmant wrote:
> On Sat, 2003-05-24 at 04:05, George Vieira wrote:
> > Hmm. I don't think bridging copies the packets MAC address over. it just copies the packet data with it's source and destination IPs.
> > 
> > Can I ask what the mac address is used for, or needed for? Is it for some authenticity reasons?
> 
> No, I don't need ti used the MAC Address. And actually my 
> iptables filter work pretty well. But, with this, 
> the MAC address of the source host change for each connection
> 
> 
>                      10.0.0.225
>                      +--------+
>                      |   B    |
>    +-----+           |        |          +-----+
>    |  A  +-----------[ebtables]----------|  C  |
>    +-----+           +--------+          +-----+
>    10.0.0.3                             10.0.0.32     
> 
> 
> Rappel:
> when C send not filtered packet to A, A see the C MAC address with IP
> 10.0.0.32. when B send filtered TCP/IP packet to A with IP address 
> 10.0.0.32 A see the B MAC address. This work but it's not acceptable.
> the A MAC-IP association table will change setup all the time. 
> 
> 
> Michael
> 

You'd need to handle this outside of iptables/ebtables, but it could be 
done.  If the MAC of C would be static (IE only one machine there) then 
this is pretty trivial.

If there are potentially several machines represented by 'C' then you'd 
have to have a script or program that periodically checks the MAC on  
traffic coming from C.  If you log a packet from C to A and examine the 
log entry, it includes the MAC for C...

May 27 02:09:20 janus kernel: IPT:Unhandled input from LAN:IN=eth1 OUT= 
MAC=00:02:e3:11:c2:47:00:10:7a:4e:10:3b:08:00 SRC=192.168.0.17 
DST=192.168.1.1 LEN=28 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=ICMP TYPE=8 
CODE=0 ID=9744 SEQ=0

In the above log entry the "00:02:e3:11:c2:47" is the MAC of the local
ethernet interface on the machine that logged this, my home gateway/
firewall.  "00:10:7a:4e:10:3b" is the MAC of the wireless compactflash 
card in my Zaurus.  The packet traversed a Netgear wireless AP/Router
between the two points.

You could construct a script to be run periodically by cron that would
insert a LOG rule with a distinct --log-prefix, then monitor the rule
listing (iptables -v -n -L FORWARD | grep SRC=a.b.c.d | grep "prefix")
and waits for the packet count to rise above 0, then deletes the log
rule and greps the log entry itself and extracts the MAC from it.

The problem I foresee you having is that you will need to bring the
interface down (IIRC) to change the MAC... Bridge and all...

j



