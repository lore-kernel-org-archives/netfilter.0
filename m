From: Helge Weissig <helgew@grajagan.org>
Subject: Re: protocol 50 unreachable
Date: Fri, 3 Dec 2004 19:03:21 -0800 (PST)
Message-ID: <Pine.LNX.4.44.0412031859170.29636-100000@gollum.grajagan.net>
References: <1102127736.3691.8.camel@hubcap.ljm.dom>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1102127736.3691.8.camel@hubcap.ljm.dom>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Netfilter Mailing List <netfilter@lists.netfilter.org>

On Fri, 3 Dec 2004 at 21:35 -0500, netfilter-bounces@lists.netfilter.org wrote:

JO> > > the ESP's however now show up in the log (these are nmap generated):
JO> > 
JO> > > Dec  3 09:07:23 gollum kernel: all mangle preroute: IN=eth0 OUT=
JO> > > MAC=00:90:27:ca:39:56:00:10:67:00:b4:3e:08:00 SRC=vpn.server.ip
JO> > > DST=ext.if.ip LEN=20 TOS=0x00 PREC=0x00 TTL=32 ID=56785 PROTO=ESP
JO> > > INCOMPLETE [0 bytes] 
JO> > 
JO> > > Dec  3 09:07:23 gollum kernel: all mangle preroute: 
JO> > > IN=eth0 OUT= MAC=00:90:27:ca:39:56:00:10:67:00:b4:3e:08:00
JO> > > SRC=vpn.server.ip DST=ext.if.ip LEN=20 TOS=0x00 PREC=0x00 TTL=32 ID=7732
JO> > > PROTO=ESP INCOMPLETE [0 bytes]
JO> 
JO> LEN=20 means the IP packet is only 20 bytes--which would lead one to
JO> believe that the packet contains only an IP header and no data.  which
JO> is probably all nmap is generating.  not sure what more you would expect
JO> from such a test.

would this match the following log rule though?

$IPTABLES -A PREROUTING -p esp -t mangle -m state --state INVALID -j LOG

I am seeing log entries from that that say "INCOMPLETE" (which would make 
sense). FWIW, I was aware of the nmap limitation in this case, but could 
not test it with the VPN connection yet today... stay tuned!

h.


