From: Tom Marshall <tommy@home.tig-grr.com>
Subject: Re: Too scared....
Date: Mon, 10 Jun 2002 22:58:22 -0700
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020610225822.A17959@home.tig-grr.com>
References: <E17HVTU-00062d-00@pooh.kjernsmo.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <E17HVTU-00062d-00@pooh.kjernsmo.net>; from kjetil@kjernsmo.net on Mon, Jun 10, 2002 at 10:07:08PM +0200
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
To: Kjetil Kjernsmo <kjetil@kjernsmo.net>
Cc: netfilter@lists.samba.org

Try this ...

Make a script which pings some known address.  If the ping replies stop
coming back, restore the firewall to a known state from a backup copy of
your firewall script.

When you are changing your firewall rules, open up another terminal window
to the machine and run this script.

On Mon, Jun 10, 2002 at 10:07:08PM +0200, Kjetil Kjernsmo wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Hi there! 
> 
> I hope someone can take my paw and help me through the iptables setup, 
> because I'm a bit scared of the possibility of locking myself out of my 
> box... 
> 
> I'm configuring my first box (Debian Woody with a 2.4.17 kernel), and 
> I've read the "Networking Concepts HOWTO" (Hey, Rusty, that's very well 
> written for beginners!), and the "Packet Filtering HOWTO", and I think 
> I've understood the concepts, and at this point I would usually just go 
> about trying to see what works, but this time, it feels so much more 
> risky, because I'm admining my box remotely, and I really don't want to 
> lock myself out of the box. OTOH, not configuring a firewall is a lot 
> more scary. 
> 
> I've got iptables compiled in, and the iptables tool installed, so I 
> should have taken care of that part. I've seen a few scripts, but they 
> are all so different.... What I'm trying to do is really simple, I 
> think: I have only one interface (in addition to the loopback), eth0, 
> and I've got my services running on ports 22, 25, 80 and 110, so they 
> have to be open, but other than, I can drop all INPUTs. I *guess* I can 
> drop all OUTPUTs on other ports too, except for 21, perhaps, since I'm 
> installing stuff using FTP. I think I'm confused when it comes to 
> source vs. destination ports in this context. Also, I'm a bit scared 
> given the general advice "lock up everything, then open", but what 
> happens if I lock up and can't get in to open....? 
> 
> Well, I'm a bear of little brains, and I'm boldly trying to get a box 
> online and get some nice stuff on it, and help is very much 
> appreciated. 
> 
> Friendly Tiddely-pom,
> 
> Kjetil
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.0.7 (GNU/Linux)
> 
> iD8DBQE9BQb8lE/Gp2pqC7wRAlaHAJ9X3Vo5AeibTVyLMJRPkSFqLSrATQCeLa9/
> 1oQ9SLDnon3X/Yi6rZpPyF0=
> =FaLO
> -----END PGP SIGNATURE-----
> 

