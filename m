From: eduardg@mat.upc.es
Subject: Re: Can iptables do this?
Date: Mon, 20 May 2002 19:05:32 +0200 (CEST)
Sender: netfilter-admin@lists.samba.org
Message-ID: <1021914332.3ce92cdc59eba@wmail-mat.upc.es>
References: <OF48E1B4A6.4F38281F-ONC1256BBF.004241A8-C1256BBF.004241D4@upc.es> <200205201336.OAA14181@slate.rockstone.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <200205201336.OAA14181@slate.rockstone.co.uk>
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
To: Antony@Soft-Solutions.co.uk, netfilter@lists.samba.org

Hi, first of all thank you for your time

Missatge citat per: Antony Stone <Antony@Soft-Solutions.co.uk>:

> On Monday 20 May 2002 1:03 pm, Eduardo GARCIA wrote:
> 
> > For example my network is 1.2.3.0 and I want that a host with an IP
> address
> > 10.9.8.7 can navigate. First of all, the host will send arp request to
> find
> > the MAC of its DNS server (I'll have to redirect it to my DNS), then
> it
> > will look for its default gateway, etc (I can't work with mobile IP
> nor
> > change any host configuration).
> >
> > Not any host is allowed to do this, only hosts with known MACs.

Here comes (I belive) iptables



> 
> Sounds like you want BOOTP / DHCP ?

No, this way the network configuration dynamically changes.


> 
> I don't quite see where IPtables comes into this.... ?


I have to translate the ip of the host, but the problem comes when the host 
tries to find its DNS, it first has to send an ARP request that must be 
responsed by somebody on my network. Is possible to mangle an arp request to 
change dest ip?


> 
> 
> 
> Antony.
> 
> 

