From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: tcpdump behavior not getting all packets in promisc mode
Date: Tue, 4 Jun 2002 02:43:27 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206040143.g541hTA04989@Networker.rockstone.co.uk>
References: <005301c20b66$c36a2b80$6301a8c0@JJONES1>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <005301c20b66$c36a2b80$6301a8c0@JJONES1>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Iptables <netfilter@lists.samba.org>

On Tuesday 04 June 2002 2:25 am, John Jones wrote:

> Sorry, on re-read, that was ambiguous.  The Intel card uses the
> EEPRO100.  Not sure what driver the SMC uses (never used one myself), it
> may use the Tulip driver?

SMC have produced a number of different cards with different chipsets on 
them.   I've seen at least three different types - with the Tulip chipset, an 
SMC-branded RTL8139 clone, and something else I don't remember right now.

Best way to find out is either plug the card in and look at /proc/pci to see 
if it says anything useful, or if not boot from a "network install" floppy 
which will include drivers for most things you're likely to see.   I use 
Slackware net.i boot image for this, and it knows what most things are.


Antony.

