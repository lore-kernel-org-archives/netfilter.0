From: Chris Andrew <candrew@oxspring.com>
Subject: Re: bad ftp speeds through nat
Date: 23 Nov 2004 15:34:18 +0000
Message-ID: <1101224058.22074.17.camel@candrew.oxspring.com>
References: <0e7301c4d0c1$74ba04b0$49caa8c0@caris.priv>
	<0e7801c4d0c2$9dc80220$49caa8c0@caris.priv>
	<20041122184124.GA31191@bender.817west.com>
	<0e8e01c4d0c6$a2725380$49caa8c0@caris.priv>
Reply-To: candrew@oxspring.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <0e8e01c4d0c6$a2725380$49caa8c0@caris.priv>
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
To: netfilter@lists.netfilter.org
Cc: peter.marshall@caris.com

On Mon, 2004-11-22 at 19:08, Peter Marshall wrote:
> here is the output from the netstat -ni ...
> 
> [root@radium root]# netstat -ni
> Kernel Interface table
> Iface     MTU Met   RX-OK RX-ERR RX-DRP RX-OVR   TX-OK TX-ERR TX-DRP TX-OVR
> Flg
> eth0       1500   064374866      0      0      169244643      0      0
> 0 BMRU
> eth0:1     1500   0  698461      0      0      0  674916      0           0
> BMRU
> eth1       1500   067829304      0      0    26760844194      0      0
> 0 BMRU
> eth1:1     1500   0  698461      0      0      0  674916      0      0
> 0 BMRU
> eth2       1500   0  698461      0      0      0  674916      0      0
> 0 BMRU
> lo        16436   0      54      0      0      0      54      0      0
> 0 LRU
> 
> and no my firewall is not a P-75  ... :)  it is a PIII 850 with 512 MB RAM.

I'm presuming the speeds are poor from your LAN:

Are the transfer speeds OK if you FTP from the firewall?

How do you address the FTP server from your LAN, are you doing any
DNAT/SNAT, or simply routing?

Are transfer speeds always poor from the LAN regardless of which PC
initiates the FTP connection?

What does mii-tool & the above netstat tell you on:
  (a) the ftp server
  (b) the firewall
  (c) LAN workstation

In an attempt to diagnose a failing NIC, try pulling down the speed on
either or both of the NICs on the firewall DMZ interface and FTP server,
using:
mii-tool -F 10baseT-FD eth0

See man mii-tool for available speeds/duplex, etc.

Regards,
Chris


