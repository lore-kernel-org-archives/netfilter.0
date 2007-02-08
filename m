From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: Re: a whitelist for outgoing syn port 80, 443 traffic for hosting
Date: Thu, 8 Feb 2007 13:15:56 -0500 (EST)
Message-ID: <Pine.LNX.4.64.0702081313520.12171@darkstar.sysinfo.com>
References: <45CA0B2A.7010704@pacific.net> <45CA1D0E.2040603@yahoo.co.uk>
	<45CA23D0.5050702@pacific.net> <45CA356A.3000706@yahoo.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <45CA356A.3000706@yahoo.co.uk>
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
To: franck <joncourt_franck@yahoo.co.uk>
Cc: Mail List - Netfilter <netfilter@lists.netfilter.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Wed, 7 Feb 2007, franck wrote:

> --[PinePGP]--------------------------------------------------[begin]--
> Ken A wrote:
>>>>> Is anyone aware of a whitelist of hostnames of port 80,443 OUTGOING
>>>>> traffic that should be considered 'normal' in a hosting environment?
>>>>> ie: SYN traffic to ups.com, authorize.net, technorati, for ecommerce,
>>>>> blogging, etc..
>>>>>
>>>>> Categorizing traffic as good/bad is useful in this day of many php
>>>>> remote file include bugs.
>>>>>
>>>>> Thanks,
>>
>> Maybe this is what you are looking for :
>>
>> http://someonewhocares.org/hosts/zero/
>>
>>> Thanks, but I'm looking for a whitelist for a fairly wide range of web
>>> applications, not a blacklist. There are plenty of good blacklists out
>>> there. surbl.org, uribl.com , etc. :-)
>>> Ken
>
>
> As a matter of fact, I thought something you can put in a blacklist
> could be useful, because it cannot be in the whitelist you are looking
> for. But, thinking about it again, it is quite clear I would prefer a
> small whitelist rather than a very huge blacklist.
>


Would this not require that one beable to conclude that such "whitelist" 
ensures tha the hosts in it are "secure"  have never been compromised, and 
never will be compromised?  If this is what is sought, such a list would 
be impossible to build.  It is not possible to ensure the integrity of a 
system over time, only at a point in time to the dregree the server was 
audited to.

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
Version: GnuPG v1.4.5 (GNU/Linux)

iD8DBQFFy2jgst+vzJSwZikRArgyAJ0blUDEGgoTI6vGNoyotjWtYP13ZwCg3RTQ
i0D6I67rY0LBwLmpl5D3JpU=
=YnJ0
-----END PGP SIGNATURE-----

