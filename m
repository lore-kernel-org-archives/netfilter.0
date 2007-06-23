From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: Re: filter by application name
Date: Sat, 23 Jun 2007 02:17:28 -0400 (EDT)
Message-ID: <Pine.LNX.4.64.0706230215230.10809@darkstar.sysinfo.com>
References: <467C452A.1050303@gmail.com> <467C467D.8060002@shorewall.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <467C467D.8060002@shorewall.net>
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
To: Tom Eastep <teastep@shorewall.net>
Cc: Deb ian <debian70@gmail.com>, netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Fri, 22 Jun 2007, Tom Eastep wrote:

> Deb ian wrote:
>> Hello,
>>
>> I want to build a firewall with iptable, and i need to filtre by
>> application name. I see it's possible with
>>
>> iptables -A INPUT -m owner --cmd-owner sshd
>>
>> But --cmd-owner is not integred since 2.6.15 kernel, and i'am on debian
>> etch (kernel 2.6.18).
>>
>> How can i do this, a path exist for it? Or over solution?
>
> tuxguardian.sf.net
>


Interesting.  I get the impression tuxguardian is not quite a deep 
inspection FW nor an real application proxy, but has hooks to permit and 
eny on command hashes?  I'd like to see more of their docs, not alot 
online that I saw.  Might have to go through their code if more info is 
not available...


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

iD8DBQFGfLr7st+vzJSwZikRAlVRAJ9JU/UkLbPxUP3eBdZ/3se2AiJOcACbBwPx
U5OlZ/z9rgBa58ezdVvNz10=
=baB0
-----END PGP SIGNATURE-----

