From: "Peter Marshall" <peter.marshall@caris.com>
Subject: Re: bad ftp speeds through nat
Date: Mon, 22 Nov 2004 15:08:21 -0400
Message-ID: <0e8e01c4d0c6$a2725380$49caa8c0@caris.priv>
References: <0e7301c4d0c1$74ba04b0$49caa8c0@caris.priv><0e7801c4d0c2$9dc80220$49caa8c0@caris.priv>
	<20041122184124.GA31191@bender.817west.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
To: Jason Opperisano <opie@817west.com>, netfilter <netfilter@lists.netfilter.org>

here is the output from the netstat -ni ...

[root@radium root]# netstat -ni
Kernel Interface table
Iface     MTU Met   RX-OK RX-ERR RX-DRP RX-OVR   TX-OK TX-ERR TX-DRP TX-OVR
Flg
eth0       1500   064374866      0      0      169244643      0      0
0 BMRU
eth0:1     1500   0  698461      0      0      0  674916      0           0
BMRU
eth1       1500   067829304      0      0    26760844194      0      0
0 BMRU
eth1:1     1500   0  698461      0      0      0  674916      0      0
0 BMRU
eth2       1500   0  698461      0      0      0  674916      0      0
0 BMRU
lo        16436   0      54      0      0      0      54      0      0
0 LRU

and no my firewall is not a P-75  ... :)  it is a PIII 850 with 512 MB RAM.



Peter


----- Original Message ----- 
From: "Jason Opperisano" <opie@817west.com>
To: "netfilter" <netfilter@lists.netfilter.org>
Sent: Monday, November 22, 2004 2:41 PM
Subject: Re: bad ftp speeds through nat


On Mon, Nov 22, 2004 at 02:39:36PM -0400, Peter Marshall wrote:
> It looks like it is slow with any type of file transfer through the
firewall
> .. not just ftp ...

does "netstat -ni" on the firewall show any interface errors?  any
possibility of a speed/duplex mismatch between the firewall's interfaces
and the switches it's connected to (mii-tool/ethtool can help here)?

is your firewall a P-75 that might not be capable of filtering more than
300 Kbps (semi joking...)?

-j

--
"This has purple stuff inside - purple is a fruit."
        --The Simpsons


