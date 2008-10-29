From: Thomas Jacob <jacob@internet24.de>
Subject: Re: libpcap (tcpdump) and netfilter (iptables)
Date: Wed, 29 Oct 2008 16:11:25 +0100
Message-ID: <1225293085.13500.5.camel@enterprise.ims-firmen.de>
References: <49086324.9060900@laposte.net>
	 <6a7a31ab262da35cf57c6c465226e977@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <6a7a31ab262da35cf57c6c465226e977@localhost>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Wed, 2008-10-29 at 15:00 +0100, Julien Vehent wrote:
> Hi,
> 
> On Wed, 29 Oct 2008 14:20:36 +0100, Pierre LEBRECH
> <pierre.lebrech@laposte.net> wrote:
> > Hi,
> > 
> > It seems that even if I drop some INPUT packets with iptables, tcpdump
> > still sees these packets arriving on the ethernet interface.
> > 
> > Could anybody explain me a bit about this?
> 
> The pcap driver catch the packet before it's processed by netfilter. 
> This is a known issue that has even been used in a rootkit PoC to
> communicate with the rootkit before the firewall drops the packet.

You may call it a "known issue", I'd called a very useful
and desirable feature for debugging network packet filters.

If you want to protect your machine against this issue, you
could simply disable  packet sockets, couldn't you?

