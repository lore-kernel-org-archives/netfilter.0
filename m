From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: Re: okay, I admit confusion here;
Date: Mon, 16 May 2005 13:40:57 -0400 (EDT)
Message-ID: <Pine.LNX.4.60.0505161332480.15128@darkstar.sysinfo.com>
References: <427B93EE.3030905@eccotours.dyndns.org>
	<427C4EA3.5090501@riverviewtech.net>
	<4281FC1A.8090000@eccotours.dyndns.org>
	<42824D1E.7040508@riverviewtech.net>
	<42825732.8010206@verisignlabs.com>
	<428259CE.3080708@riverviewtech.net>
	<42825D48.2060003@verisignlabs.com>
	<20050511203452.GA13902@bender.817west.com>
	<Pine.LNX.4.60.0505131725190.2601@darkstar.sysinfo.com>
	<20050513215540.GA22122@bender.817west.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050513215540.GA22122@bender.817west.com>
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
To: Jason Opperisano <opie@817west.com>
Cc: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Fri, 13 May 2005, Jason Opperisano wrote:

> On Fri, May 13, 2005 at 05:31:06PM -0400, R. DuFresne wrote:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> I have moved from a p-p-p dialup serivce to a rr business class service
>> <and learned to hate verizion>.  Anyways, rr brings in a router, and
>> gives me the /28 block <router takes an address>.  how do I setup  eht0
>> and eth1 to share the same block?  Is this a case for interface bridging
>> and ip2route?
>>
>> router  <->   eth1 <external>   <->   eth0 <internal, connects to the home
>>
>> router = xxx.xxx.xxx.17
>>
>> eth1 = xxx.xxx.xxx.18
>>
>> eth0 = xxx.xxx.xxx.19
>>
>> Rest of the home net gets IP's 20-30
>
> sounds like a job for bridging.  how's about:
>
> router	= .17
>
> br0	= .18
>
> where br0 is a bridge device containing member ports eth0 and eth1.
>
> rest of the home net can use .19 - .30 and use .17 as their default
> gateway.  the only reason the bridging linux firewall needs an IP at all
> would be for SSH mgmt.
>

- From what I have seen of the bridging abilities and ebtables this gets 
ugly as we are reduced to layer 2 filtering and have a lack of control of 
the higher level protocols, which is basically useless here.

The only work about I note would be to bridge and then 'untransparent' the 
whole thing by putting IP's on both bridged eht cards and then filtering 
and all is reduced to eth1 and eth0 kind of rules.  All of it again ugly, 
and wasteful...

Course, others might have a better understanding of the capabilities of 
bridging and ebtables that I'm missing.  here's the setup in more detail;




                                  ______________________________
                                 |                              |
                                 |       rr router              |
                                 |                              |
                                 |      three nets off it       |
                                 |                              |
                                 |______________________________|
                                         |       |       |
                                         |       |       |
                                 ________|       |       |________
                                 |               |               |
                                 |               |               |
                         public /28      private  /24        private class 
C dhcp


                         |
                         |
                         |
                         |
                        eth1
                         |
                  darkstar.sysinfo.com
                         |
              ______________________
              |                    |
              |     home fw        |
              |                    |
              |                    |
              |____________________|
                         |
                         |
                       eth0
                         |
                 blackhole.sysinfo.com
                 mail.sysinfo.com
                 www.sysinfo.com
                    sysinfo.com
                         |
                         |



                 internal network

                 with public IP's_




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

iD8DBQFCiNs0st+vzJSwZikRAvlfAJ4xSd1NQqBv2Ups2nuC9hGqu3GNagCg2ndx
ICPAl3aB9Uo9VphwjEAk7Fo=
=WrHm
-----END PGP SIGNATURE-----

