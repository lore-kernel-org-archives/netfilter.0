From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: Re: Possibility to lock iptables rules.
Date: Wed, 20 Apr 2005 17:02:41 -0400 (EDT)
Message-ID: <Pine.LNX.4.60.0504201659070.28995@darkstar.sysinfo.com>
References: <1113994155.31280.29.camel@localhost.localdomain>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1113994155.31280.29.camel@localhost.localdomain>
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
To: Anders Fugmann <afu@fugmann.net>
Cc: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1



Which is the number  one reason that a network's firewall should serve no 
other purpose then that, firewalling the network, and not allow outside 
nor most inside systems/users to connect to it, only those managing it.

Even immutable flgs can be undone on a server that is hacked and root 
gained.  And what you are requesting requires their be no modules on the 
system, everything has to be compiled directly into the kernel, including 
all the modules that iptables now deppends upon and uses.  You'd be much 
better off and safer to just not let the average user beable to connect to 
and enter the firewall.

Thanks,

Ron DuFresne

On Wed, 20 Apr 2005, Anders Fugmann wrote:

> Hi,
>
> I would like to request a very simple feature: The possibility to lock
> all iptable rules in the kernel, making them immutable.
>
> This would be usefull on machines which act both as a firewall and as a
> server. The problem today if an unwanted guest manages to break into the
> machine running the firewall and becomes root, the person can easilly
> change the rules, compromising the network guarded by the hacked
> firewall.
>
> If it was somehow possible to lock the rules once setup, the attacker
> would be unable to modify the rules, the network guarded by the firewall
> would not (pending on how the firewall was setup) not be compromised,
> even if an attacker gained access to the firewall itself.
>
> I was thinking something in the lines of:
>
> iptables --lock [--action <PANIC|LOG>],
>
> where 'action' would specify how the machine should react if anyone was
> to try and modify the rules. PANIC would cause the system to panic. LOG
> would simple make the kernel log the attempt and then ignore the
> request.
>
> The only way to unlock the tables would be to reboot the machine. I know
> that this system if not 100% foolproof, as the attacker could install a
> custom kernel, and then reboot the machine, but it would cirtanly make
> at lot harder for most attackers
>
> I really hope that this feature could be implemented. I know that is is
> not excatly trivial to implement as the address of the bit signifying
> that the tables are lock would need to be hidden to avoid the attacker
> to simply write a zero the the specific address to unlock the tables.
>
> Regards
> Anders Fugmann
>
> P.s.
> Please CC me on replys, as I'm not on the list.
>
>
>
>
>
>
>
>
>

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

iD8DBQFCZsN3st+vzJSwZikRAkGTAJ4v81r7y2w63YXg1vpgaoD1rOdRsACcCtbs
OWz5cGs/6Uonm6GAIdccz1k=
=B9FP
-----END PGP SIGNATURE-----

