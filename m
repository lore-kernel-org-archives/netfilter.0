From: George Vieira <GeorgeV@citadelcomputer.com.au>
Subject: RE: Unable to apply pptp patch
Date: Wed, 3 Jul 2002 19:29:32 +1000
Sender: netfilter-admin@lists.samba.org
Message-ID: <200FAA488DE0D41194F10010B597610D2BA1F9@JUPITER>
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
To: 'Antony Stone' <Antony@Soft-Solutions.co.uk>, netfilter@lists.samba.org

Yeah I've compiled kernels over and over again.. just this time it's a sh$@
and I get CRC on reboots..

and this is a big network so I can't reboot it too often...

-----Original Message-----
From: Antony Stone [mailto:Antony@Soft-Solutions.co.uk]
Sent: Wednesday, 03 July 2002 7:26 PM
To: netfilter@lists.samba.org
Subject: Re: Unable to apply pptp patch


On Wednesday 03 July 2002 10:18 am, George Vieira wrote:

> Yes limitation is to all versions and it's not a netfilter problem.. it's
> the design of PPTP which was microsoft big stuff up from memory. The
design
> didn't allow multiple connections from the same source..
> Use a Linux to Linux VPN and you can route the whole network back and
> forth....
>
> Also PPTP isn't the best VPN but is widely used due to the Micro$oft
> support for it..
>
> I'd rather use IPSEC if I can only just compile my damn kernel right for
> once.. (it's been a while)..

FreeS/WAN isn't difficult - it just takes a while, and you have to follow
the 
instructions carefully.   I think the guides and documentation on 
http://www.freeswan.org are very good, though.

 

Antony.

