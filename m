From: George Vieira <GeorgeV@citadelcomputer.com.au>
Subject: RE: NetBIOS browsing across subnets
Date: Fri, 5 Jul 2002 08:51:16 +1000
Sender: netfilter-admin@lists.samba.org
Message-ID: <200FAA488DE0D41194F10010B597610D2BA22F@JUPITER>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.samba.org

Best put a Samba server on the firewall and broadcast to both networks using
the `remote announce =` option..
Make this machine the master browser for both networks and you should be
fine, I do with with VPN users and it works like a dream until you put a PDC
into the network which continously complains and wants to be the master.. he
he.. linux beats it hands down on every election..

thanks,
George Vieira
Systems Manager
Citadel Computer Systems P/L
http://www.citadelcomputer.com.au



-----Original Message-----
From: Antony Stone [mailto:Antony@Soft-Solutions.co.uk]
Sent: Friday, 05 July 2002 6:46 AM
To: netfilter@lists.samba.org
Subject: Re: NetBIOS browsing across subnets


On Thursday 04 July 2002 9:44 pm, John Jones wrote:

> I have a need to allow NetBIOS/Network Neighborhood browsing across a
> firewall between one internal LAN segment (192.168.0.0/23) to another
> (192.168.10.0/24).  The two networks are on interfaces eth2 and eth3,
> respectively, off of the corporate firewall.

As far as I am aware you cannot do Network Neighbourhood browsing across a 
router - it works by using broadcast packets, so unless you bridge your 
networks together you will not be able to browse one side from the other.

You can certainly make Windows / SMB / NetBios connections from one network 
to another, but only if you know in advance the IP address/es of the 
machine/s you want to connect to.

If anyone knows a way of supporting Windows browsing across a router, please

speak up :-)

 

Antony.

