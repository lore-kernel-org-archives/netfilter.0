From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: Re: Firewall Configuration Question...  Is this possible?
Date: Mon, 1 Aug 2005 13:13:25 -0400 (EDT)
Message-ID: <Pine.LNX.4.60.0508011308200.3645@darkstar.sysinfo.com>
References: <1122684637.8190bfctim@linux.a-f.k12.mi.us>
	<42ED1E7A.4030301@gmx.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42ED1E7A.4030301@gmx.co.uk>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: /dev/rob0 <rob0@gmx.co.uk>
Cc: netfilter <netfilter@lists.netfilter.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Sun, 31 Jul 2005, /dev/rob0 wrote:

> Timothy Patterson wrote:
>> I currently have NAT set using masquerading to allow internet access
>> from all of our internal computers on the network.  My problem is that I 
>> am also trying to run Apache on the box that is doing the NAT
>> translation rules.  Is it possible to run a web server on the same box 
>> that is performing the translations?
>
> Of course.
>
>> If so, could someone give me a quick example on how to accomplish
>
> Restrict SNAT by interface. Only do it for clients on the LAN.
>
>> this?  I've tried googling for this, but I have not found any pertinent 
>> results.
>
> The NAT HOWTO?
>

doable, but not adised, a firewall should be single purpose, most servers 
should be single purpose where possible.  But then this is not often the 
case.  But a firewall certainly should be a single purpose system much 
like a router is, they do similair work anyways.

putting a web servers on the firewall makes the firewall and the whole 
internal network subject to any issues that the web services now face, 
plus you now have to allow naother set of ports/protocols directly to the 
system and not merely passingby or through it.  A web server would 
preferably run on a system in the dmz, andf not heavily traffices can run 
well on an old cheap pc.

To state this in anohter way;  just because something is possible does not 
mean it should be done, or the prefered way of doing things.

Thanks,

Ron DuFresne
- -- 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         admin & senior security consultant:  sysinfo.com
                         http://sysinfo.com
Key fingerprint = 9401 4B13 B918 164C 647A  E838 B2DF AFCC 94B0 6629

...We waste time looking for the perfect lover
instead of creating the perfect love.

                 -Tom Robbins <Still Life With Woodpecker>
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFC7lg4st+vzJSwZikRAsk4AJ44/FggWHAp2k4mUCTZMo65fJUlYQCgt7by
0ogLObSUx2jCPWSydRUVZ3A=
=6ovs
-----END PGP SIGNATURE-----

