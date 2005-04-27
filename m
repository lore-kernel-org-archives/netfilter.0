From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: Re: where list of **reserved address**??? (IP addresses can *drop*)
Date: Wed, 27 Apr 2005 13:33:52 -0400 (EDT)
Message-ID: <Pine.LNX.4.60.0504271331080.9550@darkstar.sysinfo.com>
References: <1114539542.3856.12.camel@seberino.spawar.navy.mil>
	<426FB150.2060708@riverviewtech.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <426FB150.2060708@riverviewtech.net>
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
To: "Taylor, Grant" <gtaylor@riverviewtech.net>
Cc: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1



The only real reason to have to have a bogon listing of rules in a 
firewall are those firewalls that tend to be permissive.  Firewalls with 
default deny policies should not have to deal with keeping an up-to-date 
listing of the bogons, nor all the clutter and added overhead of rules to 
disallow these addresses.

Thanks,

Ron DuFresne

On Wed, 27 Apr 2005, Taylor, Grant wrote:

>> where list of **reserved address**??? (IP address can *drop*)
>> 
>> I had a list but I keep having to remove IP addresses from it....either 
>> list keeps changing or my list is crap....
>
> As has been previously stated (in replies to your message) IANA has a list of 
> reserved IP addresses (http://www.iana.org/assignments/ipv4-address-space) 
> which will periodically change.  So I wrote a small script (see below) that 
> will lynx --dump the page and run and MD5 sum of it and dump it in to a file. 
> Periodically (when ever I feel like having Cron run it) the script will run 
> and compare the page on the web's MD5 sum to what I knew about.  If the MD5 
> sum is different it will email me and let me know.
>
> Also you should look at RFC 3330 as it has a LOT of information (as do most 
> RFCs) about network addresses that should be allowed to pass.
>
>
>
> Grant. . . .
>
>
>
> #!/bin/bash
>
> NewMD5Sum=`lynx --dump http://www.iana.org/assignments/ipv4-address-space | 
> md5sum | cut -f1 -d\ `
> OldMD5Sum=`md5sum ~gtaylor/docs/ipv4-address-space | cut -f1 -d\ `
>
> if [ ${NewMD5Sum} != ${OldMD5Sum:=null} ]; then
>   lynx --dump http://www.iana.org/assignments/ipv4-address-space > 
> ~gtaylor/docs/ipv4-address-space
>   cat ~gtaylor/docs/ipv4-address-space | mail -s "New IPv4 Address Space 
> info from IANA (`ct`)" gtaylor@riverviewtech.net
> fi
>
> Note:  ct is a small script that I wrote to give me a formated date output 
> and is inconsequential in this matter.
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
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFCb80Fst+vzJSwZikRAt/7AJ95D/jKUw/mT399nIQqcc9y7eUFiACfT2Jb
YDA9moXlco2uUH9FVTMY+gI=
=M1bD
-----END PGP SIGNATURE-----

