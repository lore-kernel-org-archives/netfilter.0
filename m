From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Masquerade (Newbie)
Date: Sun, 9 Jun 2002 17:21:51 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206091621.g59GLrA06315@Networker.rockstone.co.uk>
References: <200206091647.32562.richard.downing@bcs.org.uk> <200206091556.g59FuIA04902@Networker.rockstone.co.uk> <200206091704.08650.richard.downing@bcs.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <200206091704.08650.richard.downing@bcs.org.uk>
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

On Sunday 09 June 2002 5:04 pm, Richard A Downing wrote:

> > > If I command: iptables -t nat -A POSTROUTING -o ppp0 -j
> > > SNAT --to 62.255.122.217 then this happens:
> > >
> > > iptables -t nat --list
> > > Chain POSTROUTING (policy ACCEPT)
> > > target     prot opt source               destination
> > > SNAT       all  --  anywhere             anywhere
> > >   to:192.168.1.0
> >
> > What is the local address of ppp0 at the time you did this  ?

> A route -n gave:
>
> Kernel IP routing table
> Destination     Gateway         Genmask         Flags Iface
> 62.255.122.217  0.0.0.0         255.255.255.255 UH  ppp0
> 192.168.1.0     0.0.0.0           255.255.255.0     U    eth0
> 0.0.0.0         62.255.122.217  0.0.0.0              UG   ppp0

(Excuse my reformatting of that to avoid line breaks)

It looks to me like 62.255.122.217 is the address at the remote end of your 
ppp link, not the local end.

What does the output of ifconfig ppp0 tell you ?

I think you're trying to tell netfilter to SNAT to an address which is not on 
the interface.   I don't know what it's supposed to do if you try this.

By the way, is ppp0 a serial interface (eg modem), or is it associated with 
eth0 somehow ?   I wonder why netfilter used the address of eth0 to 
masquerade behind....


Antony.

