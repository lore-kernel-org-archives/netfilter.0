From: Bo Yang <struggle@mail.nankai.edu.cn>
Subject: Re: Raw sockets send/receive through NAT
Date: Thu, 28 Sep 2006 21:48:46 +0800
Message-ID: <359451564.54666@mail.nankai.edu.cn>
References: <359177289.20658@mail.nankai.edu.cn>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Message-ID: <451BD2BE.7010106@mail.nankai.edu.cn>
In-Reply-To: <359177289.20658@mail.nankai.edu.cn>
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
Cc: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1
 
Jon Wilson:
> Hi,
>
> I have a requirement to NAT packets sent using raw sockets (
> socket(AF_INET, SOCK_RAW, IPPROTO_TCP/ICMP) ).  The machine I'm using
> has a single interface with a 192.168.x.x address and I want to send a
> packet from this machine with a 10.x.x.x source address (hence raw
> sockets) and have the 10.x.x.x address NAT'd to the 192.168.x.x address.
> I'm using POSTROUTING MASQUERADE'ing on eth0.  I've got a couple of
> questions:
why do you do that ? Just for fun or something else ?
>
> 1.  How do I receive the returned (raw) packets *after* they have
> traversed the NAT i.e. in the 10.x.x.x IP space?  If I use libpcap for
> example, I get the 192.168.x.x IP space packet but what I need is the
> packet post-NAT with the 10.x.x.x IP address.
You can just send the package , and wait for the response package ,
the kernel netfilter will do
other things for you .
I think postrouting and prerouting will affect your package in a
transparent way .
>
> 2.  I've found the NAT works on 2.6.15 (FC5) but doesn't on 2.4.22
> (RH9).  Unfortunately I need to use the 2.4.22 kernel, at least for now.
>
> Does anyone know at what point in the kernel releases this functionality
> changed?  And ... clutching and straws ... the reason(s) for the change
> - was it just a bug or is there some deeper story?
>
> How would I go about patching 2.4.22 to give me the raw sockets NAT that
> I need (not something I even know where to start...)?
I am sorry , I don't know the differences between the versions !
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (MingW32)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org
 
iD8DBQFFG9K+7tZp58UCwyMRArlFAJ0SyfgUOizusamXN8vV6PsRL6UknACgyvgT
GRNpPDOSydaBdKXB9Tbgoyo=
=L/mr
-----END PGP SIGNATURE-----


