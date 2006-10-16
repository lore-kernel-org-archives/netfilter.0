From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: Re: how to write different ip sources on a single rule
Date: Mon, 16 Oct 2006 16:35:08 -0400 (EDT)
Message-ID: <Pine.LNX.4.64.0610161634240.2583@darkstar.sysinfo.com>
References: <OF19100943.C82981C2-ONC22571F7.00439BBB-C22571F7.004445A5@gunessigorta.com.tr>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <OF19100943.C82981C2-ONC22571F7.00439BBB-C22571F7.004445A5@gunessigorta.com.tr>
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
Cc: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Thu, 28 Sep 2006, Burak Ozgoren wrote:

>> On Thu, September 28, 2006 13:35, Burak Ozgoren wrote:
>>> Hi,
>>>
>>>
>>> I know i can write source ip within a ip range or with a network mask.
> For
>>> example: 192.168.0.5-192.168.0.15 or 192.168.0.0/24
>>>
>>>
>>> Can i write it for single ip. Like 192.168.0.5 and 192.168.0.9
>>
>> You can use the second notation (192.168.0.0/24), but for the first you
> need
>> the iprange match.
>>
>>
> http://www.netfilter.org/projects/patch-o-matic/pom-base.html#pom-base-iprange
>>
>>
>>
>> Grts,
>> Rob
>>
>
> I know about range, and mask but need a rule like for example:
>
> Accept port 22 connections from 192.168.0.5, 10.10.60.163, 212.12.X.X
>
> Now i am writing 3 different rules for these.



Well, yes and no, it depends upon how you write you iptable script, is it 
a flat file of rule, rule, rule... or a more dynamic script.  Yeppers a 
iptable script can contain most any bash-ish convention, like:

gdhosts="192.168.0.5 10.10.60.163 212.12.X.X"

for h in gdhosts do
...

This will result in 3 rules, but certainly has the ability to grow and 
shrink as needed, and is likely far easier to read, especially with some 
comments in the script to keep you in the original mindset...


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

iD8DBQFFM+z/st+vzJSwZikRAsbuAKC1vp75R+ddUWPohkx6kgzzxlLthwCglMrW
sFQVBYsZN1EvpgVMl3k4tlQ=
=SrvL
-----END PGP SIGNATURE-----

