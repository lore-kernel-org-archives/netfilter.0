From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: Re: netfilter bypassed by nessus using UDP packets with source port
 53
Date: Fri, 1 Apr 2005 13:08:32 -0500 (EST)
Message-ID: <Pine.LNX.4.60.0504011302540.24096@darkstar.sysinfo.com>
References: <424ABB78.6060105@aquitaine.cci.fr>
	<1112275621.5624.35.camel@anduril.intranet.cartel-securite.net>
	<424CF137.6050905@aquitaine.cci.fr>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <424CF137.6050905@aquitaine.cci.fr>
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
To: grumpy <mathieu.delaplace@aquitaine.cci.fr>
Cc: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1


 	[SNIP]

>> Speaking of your ruleset, what's the point of :
>> 
>> 
>>> -A INPUT -i eth0 -p tcp -m tcp --tcp-flags FIN,SYN FIN,SYN -j DROP
>> 
>> 
>> Linux treats SYN/FIN packets as SYN ones, just as it should be on any
>> RFC compliant stack.
>
> nessus told me something like that :
> "the remote host does not discard TCP SYN packet which have FIN flag
> set. This can allow an attacker to defeat your firewall rules set"
>
> According to you, this is a false positive, thanks for your correction :)
>

The advice or the porition posted to you on this might not be totally 
correct, if linux indeed does this poor stack behaviour, it is corrected 
by droppping INVALID packets, I know I tested with various tools to 
determine how well thpse drop INVALID rules work.  INVALID drops also drop 
packets whence no flags are set, like a default hping packet.  So, folks 
using INVALID drops will find some of their firewall testing tools failing 
as well.

As this can break some poorly designed apps and windows based protocols, 
it's best to log these first, then drop so one has a record of what's 
happening should something start to fail after invoking the drop INVALID 
rule.

Thanks,

Ron DuFresne
- -- 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         admin & senior security consultant:  sysinfo.com
                         http://sysinfo.com

...Love is the ultimate outlaw.  It just won't adhere to rules.
The most any of us can do is sign on as it's accomplice.  Instead
of vowing to honor and obey, maybe we should swear to aid and abet.
That would mean that security is out of the question.  The words
"make" and "stay" become inappropriate.  My love for you has no
strings attached.  I love you for free...
                         -Tom Robins <Still Life With Woodpecker>
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFCTY4lst+vzJSwZikRAjMbAKDPOldneWlk3RWnOsBYEGWlwTv12ACeKG7D
AyAYtgQvqDvbrNCSkYxo6NY=
=l0ft
-----END PGP SIGNATURE-----

