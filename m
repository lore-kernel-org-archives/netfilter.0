From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: RE: ..prevention, was: syn DDoS attack solution
Date: Tue, 12 Jun 2007 18:44:38 -0400 (EDT)
Message-ID: <Pine.LNX.4.64.0706121843540.18235@darkstar.sysinfo.com>
References: <5C9E8CCEEB81ED498AC0C3B0054704F302A83EDE@webmail.latis.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <5C9E8CCEEB81ED498AC0C3B0054704F302A83EDE@webmail.latis.com>
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
To: Martin McKeay <mmckeay@stillsecure.com>
Cc: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1


With references to updating the continually changing bogon IP's, and how 
to add rules for those changes?

Thanks,

Ron DuFresne


On Tue, 12 Jun 2007, Martin McKeay wrote:

> As promised, I wrote a blog entry on the blocking the bogon IP's and
> included the full set of Iptables rules.
> http://cobia.typepad.com/cobia_community_blog/how_to_use_cobia/index.htm
> l
>
> Thanks,
>
> Martin
>
>
> Martin McKeay, CISSP, GSNA
> Cobia Product Evangelist
> StillSecure
> martin@stillsecure.com
> 707-495-7926
> http://www.cobiablog.com
>
> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org
> [mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Martin
> McKeay
> Sent: Thursday, June 07, 2007 12:42 PM
> To: netfilter@lists.netfilter.org
> Subject: RE: ..prevention, was: syn DDoS attack solution
>
> I writing a blog post about the rules for blocking the bogon IP's
> (unused IP networks) using the firewall module of our Cobia,  I was
> considering including the equivalent iptables rules.  Would this be of
> interest to anyone?
>
>
> Martin McKeay, CISSP, GSNA
> Cobia Product Evangelist
> StillSecure
> martin@stillsecure.com
> 707-495-7926
> http://www.cobiablog.com
>
> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org
> [mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Steven M
> Campbell
> Sent: Tuesday, June 05, 2007 9:41 AM
> To: Arnt Karlsen
> Cc: netfilter@lists.netfilter.org
> Subject: Re: ..prevention, was: syn DDoS attack solution
>
> Arnt Karlsen wrote:
>> On Tue, 05 Jun 2007 10:16:40 -0400, Steven wrote in message
>> <46657048.4040600@SCampbell.net>:
>>
>>
>>> And, most important for folks here, do egress filtering on your
>>> firewall!    Help prevent zombie machines on your own networks from
>>> being a problem, you can't stop your end users from bringing
>>> infections into your network but you can control their spread.
>>>
>>
>> ..what tricks _are_ out there?  Set up some kinda p0f deamon and cut
>> 'n tarpit any and all Wintendo network traffic attempts?
>> Or even feed them LROS thru ActiveX if they need firm hints?
>>
>>
>
> Not really very tricky, limit outbound traffic to what is needed.   Do
> all of your workstations need UDP ports outbound?  Smtp?    For a lot of
>
> sites the average workstations internet requirements are very small,
> especially if proxys are used for SMTP,HTTP,FTP, etc.  Just by blocking
> most of the end users from direct internet access (or at least to a
> small set of outbound protocol/ports) we render those machines pretty
> useless to the bad guys.
>
> It does, however, become very tricky if it's not done up front.  It's
> really really tough to figure out what the requirements are if anyone
> could historically do anything they wanted.    It's far better to
> seriously restrict things up front and put in the exceptions as you find
>
> them.   Sites that have historically allowed all outbound traffic are a
> two fold problem, it's hard to fix and they are exactly the sorts of
> sites the bad guys like to use.
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
Version: GnuPG v1.4.5 (GNU/Linux)

iD8DBQFGbyHYst+vzJSwZikRAsrtAKCEycOkf9ZeXynCnUDfAn5g+OoLpACfc+pZ
f1EvxxUjYYdHtR9Qo1+SMsc=
=xmHn
-----END PGP SIGNATURE-----

