From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: RE: vpn masquerading
Date: Sat, 21 Jan 2006 17:38:02 -0500 (EST)
Message-ID: <Pine.LNX.4.60.0601211737180.2731@darkstar.sysinfo.com>
References: <001401c61d3f$a2f7c5d0$0101000a@sterenborg.info>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <001401c61d3f$a2f7c5d0$0101000a@sterenborg.info>
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
To: Rob Sterenborg <rob@sterenborg.info>
Cc: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Thu, 19 Jan 2006, Rob Sterenborg wrote:

>> -> ->  * TODO: - finish support for multiple calls within one session
>> -> ->  *     (needs expect reservations in newnat)
>> -> ->  *   - testing of incoming PPTP calls
>>
>> thank you, I  will try, but what confused me is that
>> inside pptp netfilter patch source code:
>
> Maybe some leftover from ancient times ? I don't know.
> All I know is that I just connected 2 pptp clients in my LAN to a corp
> pptp server, so it must be working.. ;-)
>


They may try contacting the module/kernel patch maintainer for 
clarification.


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

iD8DBQFD0rfNst+vzJSwZikRAocYAJ9nysMllo++fKuBPbusyJB+oAJ/HQCfYY7d
EMEZhkPV/0MbjvUFt0oioxc=
=6wu6
-----END PGP SIGNATURE-----

