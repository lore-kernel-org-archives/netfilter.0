From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: okay, I admit confusion here;
Date: Fri, 13 May 2005 17:31:06 -0400 (EDT)
Message-ID: <Pine.LNX.4.60.0505131725190.2601@darkstar.sysinfo.com>
References: <427B93EE.3030905@eccotours.dyndns.org>
	<427C4EA3.5090501@riverviewtech.net>
	<4281FC1A.8090000@eccotours.dyndns.org>
	<42824D1E.7040508@riverviewtech.net>
	<42825732.8010206@verisignlabs.com>
	<428259CE.3080708@riverviewtech.net>
	<42825D48.2060003@verisignlabs.com>
	<20050511203452.GA13902@bender.817west.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050511203452.GA13902@bender.817west.com>
ReSent-To: netfilter@lists.netfilter.org
ReSent-Message-ID: <Pine.LNX.4.60.0505131743300.2518@darkstar.sysinfo.com>
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
Cc: igor@portbridge.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1


I have moved from a p-p-p dialup serivce to a rr business class service 
<and learned to hate verizion>.  Anyways, rr brings in a router, and 
gives me the /28 block <router takes an address>.  how do I setup  eht0 
and eth1 to share the same block?  Is this a case for interface bridging 
and ip2route?



router  <->   eth1 <external>   <->   eth0 <internal, connects to the home
      							hub/switch>


router = xxx.xxx.xxx.17

eth1 = xxx.xxx.xxx.18

eth0 = xxx.xxx.xxx.19


Rest of the home net gets IP's 20-30


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

iD8DBQFChRyfst+vzJSwZikRAqknAJ90TrPyC6SULCWlisOkEzDCkGV3VwCcDpb/
DEk9BSElkhK3zulClwzKAcA=
=KHwY
-----END PGP SIGNATURE-----

