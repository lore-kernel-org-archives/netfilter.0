From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: filtering in which rules?
Date: Fri, 20 May 2005 20:28:43 -0400 (EDT)
Message-ID: <Pine.LNX.4.60.0505202018220.12153@darkstar.sysinfo.com>
References: <42889941.5060507@griffous.net>
	<4288E7F6.3030700@riverviewtech.net>
	<Pine.LNX.4.60.0505161523100.15128@darkstar.sysinfo.com>
	<Pine.LNX.4.60.0505161548000.15128@darkstar.sysinfo.com>
	<42890B63.2000603@riverviewtech.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42890B63.2000603@riverviewtech.net>
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
To: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1


Jason et. al.,


I wacthed the discusion today on leaving filtering to the filter chain and 
leave nat to nat and routing to the pre/post chains.  But, when one reads 
other documentation and it has paramaters to iptables like this;


iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT
iptables -t nat -P PREROUTING DROP
iptables -t nat -P POSTROUTING DROP


It g9ives one the impression that matters of filtering and decision making 
for a packet are not as carved in stone as implied in the discusion today. 
Jason makes some great points about complexity of rulesets and trying to 
maintain that accross a number of firewalls overtime.  But, that seems to 
implay that others have adopted complexity and feel fine with all it 
brings to the maintainace table.  Unless I'm reading the DROP defaults 
for the pre/post routing above.  So for clarification one more time, 
should one read these docs with a grain of salt and alter acordingly, 
perhaps placing a default ACCEPT in the pre/post chanins and then doing 
what filtering is required in the 'proper' filter chains for clarity? 
I direct this to Jason in particular, though Grant as well as others may 
wish to input again <cause Jason and Grant seem to know their stuff when 
it comes to iptables>.

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

iD8DBQFCjoC/st+vzJSwZikRAocaAJ9wlJa4uwnTYyYFAxeRJjEpLHqo7ACfb4dR
j/zKrKKllOtVUarUlaztXq0=
=kaXx
-----END PGP SIGNATURE-----

