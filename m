From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: Re: blocking irc + botnets
Date: Tue, 2 Aug 2005 14:36:41 -0400 (EDT)
Message-ID: <Pine.LNX.4.60.0508021432180.6731@darkstar.sysinfo.com>
References: <bc5becf6050802084137a7ad69@mail.gmail.com>
	<42EFA58B.6000207@lopsch.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42EFA58B.6000207@lopsch.com>
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
To: Daniel Lopes <lopsch@lopsch.com>
Cc: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Tue, 2 Aug 2005, Daniel Lopes wrote:

> hbeaumont hbeaumont schrieb:
>> Can anyone help me with the proper method to block outgoing requests to 
>> botnets + irc?
>> 
>> Or point me in the direction of searchable list archives (I could only 
>> find the non-searchable archives) or other FAQ that answers this?
>> 
>> Problem:
>> 
>> We have servers that could get infected via poorly wrote user scripts. I 
>> want to prevent these servers from being used as part of botnets or 
>> general connections to IRC (most scripts I run across seem to try to 
>> connect to IRC). I want to take the best preventative measures I can in 
>> case one of the machines would become infected
>> or otherwise compromised.
>> 
>> Also, interested in any other popular method of stopping general outgoing 
>> DOS attacks (rate limiting UDP perhaps? I'm not real up on the techniques 
>> used by the DOS'ers).
>> 
>> I'm interested in the recommended rules to add to prevent this type of 
>> thing should it occur. Thanks.
>> 
>> 
> You should block the appropriate IRC portrange. Additionally you could mark 
> IRC packets with l7 matching and then drop them afterwards. I think this will 
> filter pretty much of the IRC traffic, perhaps all.
>

Which will catch the joe-average and below schmoozers.  but will fail on 
newer threats coming up the pipes and those aimed off te traditional IRC 
servers/nets.  This is a case for a well tuned IDS and monitoring your 
layered security stratdgy.  Emphasis on *wel tuned* IDS systems are not a 
drop and play thing, and most tend to be poorly tuned, maintianed and 
monitored.  But taking the advice that others have provided will at least 
place you in a positon to stop most common trojans.

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

iD8DBQFC7708st+vzJSwZikRAkYVAKCBzDbeo/mRQPSVk+0+HdoCCElkRACdG9g7
sUG3pMVp5DgJ/nW4EwmOyOs=
=YuCO
-----END PGP SIGNATURE-----

