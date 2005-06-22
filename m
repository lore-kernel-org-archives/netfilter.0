From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: Re: Defeating NMAP Null scans (and Nessus scans).
Date: Wed, 22 Jun 2005 16:47:19 -0400 (EDT)
Message-ID: <Pine.LNX.4.60.0506221645490.22256@darkstar.sysinfo.com>
References: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAAsvh50JgMeE+wdUqpg8SwJMKAAAAQAAAA0VU7kwJQ1kSCxnmqi2LTiQEAAAAA@ziemba.net>
	<Pine.LNX.4.61.0506221442160.25356@yvahk01.tjqt.qr>
	<Pine.LNX.4.60.0506221245590.21678@darkstar.sysinfo.com>
	<Pine.LNX.4.61.0506221845160.21055@yvahk01.tjqt.qr>
	<42B9C979.9080701@riverviewtech.net>
	<Pine.NEB.4.62.0506222034050.9177@ukato.freeshell.org>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.NEB.4.62.0506222034050.9177@ukato.freeshell.org>
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
To: Alexey Toptygin <alexeyt@freeshell.org>
Cc: netfilter@lists.netfilter.org, "Taylor, Grant" <gtaylor@riverviewtech.net>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Wed, 22 Jun 2005, Alexey Toptygin wrote:

> On Wed, 22 Jun 2005, Taylor, Grant wrote:
>
>> # Drop any Null scan packets.
>> iptables -t filter -A FORWARD -i $INet -o $LAN -p tcp --tcp-flags ALL NONE 
>> -j DROP
>> 
>> # We could put any matches for any other type of scan that we wanted to 
>> here too.
>> 
>> 
>> # Allow any stateful traffic back in.
>> iptables -t filter -A FORWARD -i $INet -o $LAN -m state --state 
>> ESTABLISHED,RELATED -j ACCEPT
>
> TCP packets without flags are possible during a normal TCP connection, you 
> don't want to drop them. --state ESTABLISHED,RELATED would never let in NULL 
> scans anyway, because a NULL scan won't establish a valid TCP connection 
> before it sends flagless packets.
>

I was under the impression and perhaps again I'm wrong in my 
understanding, tht once  a connection was established all packets had at 
least the ack flags set<?>.



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

iD8DBQFCuc5est+vzJSwZikRAnQVAJ9nurjYu+VWpnz3QJshOAcFdumGtQCeNwAP
qo0xSiG4TW0WanW41fEonHI=
=B1GT
-----END PGP SIGNATURE-----

