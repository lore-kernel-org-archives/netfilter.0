From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: need to forward req between same network ip within same machine
Date: Fri, 21 Jun 2002 11:04:07 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206211004.g5LA4DU02069@vulcan.rissington.net>
References: <026701c2185c$5da22340$870110ac@samsi> <200206201313.g5KDDwU32555@vulcan.rissington.net> <002201c218dc$3cc35060$870110ac@samsi>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <002201c218dc$3cc35060$870110ac@samsi>
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
To: netfilter <netfilter@lists.samba.org>

On Friday 21 June 2002 5:17 am, Sathi wrote:

> > > For some reason i want to assign a ip address for these 2 NIC in same
> > > network say
> > >
> > > eth0: 10.10.10.1/24----------> to router
> > > eth1: 10.10.10.2/24<---------- from client
> >
> > Why do you want to do this ?
>
> I will be replacing this 10.10.10.0/24 address to public ip
> eth1 has aliase of 172.16.0.0/16 LAN address.(This will be Masquerade to
> public ip of eth0 which is working fine now)

I'm not quite sure if you're saying here that you will be changing the 
10.10.10.0/24 network range for some other address range at soem stage - in 
which case I recommend that you do it now and save yourself a lot of 
networking / routing problems.

If that's not what you're saying, then what is the relevance of the 
172.16.0.0/16 address ?   If this is another internal LAN range then you 
should use that in order to avoid the nasty network / routing problems.

Basically I am saying that you should have two different network ranges on 
the two sides of the firewall.   Is there any good reason you cannot do this ?

> I need to assign public ip address to some machine behind the firewall.

That is fine - just a few simple DNAT rules...

> > What is your router expecting to find connected to it ?   Does it expect
> > to see all 10.10.10.0/24 hosts connected on a local LAN (in which case
> > it's expecting to see arp responses for those addresses), or is it
> > expecting to see them on the other side of a router (such as your
> > firewall box) ?
>
> It is expected to see all 10.10.10.0/24 address

In that case you cannot use your firewall as a router - it will have to be 
either a bridge (which I cannot really help you with - I know it can be done 
but I have no experience of it myself), or you will have to proxy arp for all 
the 10...... addresses and put a different network range on the other side of 
the firewall (as recommended above).

 

Antony.

