From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: can iptables do this?
Date: Thu, 13 Jun 2002 18:25:41 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206131726.SAA08720@slate.rockstone.co.uk>
References: <Pine.LNX.4.44.0205211422380.4011-100000@space.comunit.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <Pine.LNX.4.44.0205211422380.4011-100000@space.comunit.de>
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
To: netfilter@lists.samba.org

On Tuesday 21 May 2002 1:27 pm, Sven Koch wrote:

> On Tue, 21 May 2002, Antony Stone wrote:
> > On Tuesday 21 May 2002 10:47 am, Eduardo GARCIA wrote:
> > > For example my network is 1.2.3.0 and I want that a host with an IP
> > > from any unknown network (i. e. 10.9.8.7) can navigate.
> >
> > No way.   You can't create a network which will allow a host with some
> > arbitrary preset IP address (and gateway, and DNS...) to come along an
> > plug into - for two reasons:
>
> You can, at least one commercial device does right that - see
> www.nomadix.com for ther usg (universal subscriber gateway).
>
> It seems to be some kind of "answer to every arp request" combined with
> nat - won't be easy, but it should be doable with iptables and some
> home-grown programs.

I still maintain that this method won't work for all cases (although I could 
see that it might cover the majority of IP addresses).

Suppose, for example, that I work for Hewlett-Packard, who have a Class A 
network on address 15.0.0.0/255.0.0.0

Then my PC will have an address somewhere in this range (remember we're not 
using DHCP here, so I must have a static address), and it will consider all 
other addresses in this range as local, not to be routed through a gateway.

Then if I take this machine and plug it into the network described above, and 
I assume that it handles all the arp requests very cleverly, it's still going 
to allow me to access anything on the Internet except my 'own' local network, 
15.0.0.0/255.0.0.0, which is actually quite a likely one for me to want to 
contact whilst I'm out and about.....

The reason I think I won't be able to access my 'own' network is because my 
machine will expect to find 15.x.y.z servers locally, not through any router, 
therefore it's going to look for machines on the local net, not through the 
gateway it magically discovers through all this arp nonsense....

Anybody explain where my reasoning falls down so this crazy scheme *can* 
actually work ?

 

Antony.

