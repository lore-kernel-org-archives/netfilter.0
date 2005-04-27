From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: Re: where list of **reserved address**??? (IP addresses can *drop*)
Date: Wed, 27 Apr 2005 17:22:43 -0400 (EDT)
Message-ID: <Pine.LNX.4.60.0504271714230.10408@darkstar.sysinfo.com>
References: <1114539542.3856.12.camel@seberino.spawar.navy.mil>
	<426FB150.2060708@riverviewtech.net>
	<Pine.LNX.4.60.0504271331080.9550@darkstar.sysinfo.com>
	<20050427181849.GA23747@bender.817west.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050427181849.GA23747@bender.817west.com>
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

On Wed, 27 Apr 2005, Jason Opperisano wrote:

> On Wed, Apr 27, 2005 at 01:33:52PM -0400, R. DuFresne wrote:
>> The only real reason to have to have a bogon listing of rules in a
>> firewall are those firewalls that tend to be permissive.  Firewalls with
>> default deny policies should not have to deal with keeping an up-to-date
>> listing of the bogons, nor all the clutter and added overhead of rules to
>> disallow these addresses.
>
> that's an odd view.  the most common reason i see for people wanting to
> filter "bogons" is when you make services available to "any" in your DMZ
> (web, mail, dns, etc), and you want to filter out bogus src IP's as they
> are obviously spoofed and the sender is up to no good.  <rant>of course
> none of this would be necessary if f**king ISP's would just perform some
> f**king egress filtering, but i digress...</rant>.


agreed on the egess filtering and most reasons I've seen for not doing 
egrees on netwokr borders are bogus.  But again a dmz firewall tends to 
be more permissive then a default deny policy, so does not alter my stance 
on this.  DMZ tend to be 'danger zones' anyways, and have to be 
permissive...

>
> as to the security benefit this provides--i'd guess it's pretty
> negligible.  i've run firewalls that filter out the unassigned and
> reserved address spaces, and they do not get a lot of hits.  if i was
> going to spoof my src IP, i wouldn't use an unassigned or reserved block,
> i'd probably use another entity i didn't like...
>
> oh and PS--if you wanna do this--use a list (or write your own script)
> that summarizes the netblocks down, so you have ~40 rules instead of
> 100+.
>

What I was trying to get across, and this might be what you sir are also 
saying, is the resources for all the inactive bogons can really add to a 
rulebase, the traversal of that rulebase and the resources that it takes 
to maintain it in processing power, time and memory, let alone keeping the 
list up-to-date, not to mention the latency that parsing a huge rulebase 
can have on connectivity...

Of course, I'm talking permititer firewalling, sure perhaps their are 
reasons to have especially complicated rule sets internally, to prevent 
employee's from doing things they should not or only permitting finace 
folks to get to finace servers and such, but, some of the things folks are 
doing at their perimiters are not only messy, but, downright near to 
dangerous in the maintainance of the schemes trying to be employed.

But, please, excuse my rants, I've been fighting battles all day with 
vendors lacking clues and clients being absurd, all part of the daily 
<smile>...

My best to you and yours sir <and list>,

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

iD8DBQFCcAKost+vzJSwZikRAhZ3AJ9h2qesncsduTc83B+DJMu4lX8HRgCfaTd+
CPyaITCpTVV17h5fNzkkkTc=
=Pv3J
-----END PGP SIGNATURE-----

