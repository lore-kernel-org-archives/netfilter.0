From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: Re: HUP
Date: Wed, 16 Mar 2005 16:18:56 -0500 (EST)
Message-ID: <Pine.LNX.4.60.0503161616530.19696@darkstar.sysinfo.com>
References: <42383F7C.2040300@eccotours.dyndns.org>
Mime-Version: 1.0
In-Reply-To: <42383F7C.2040300@eccotours.dyndns.org>
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
To: Brent Clark <bclark@eccotours.dyndns.org>
Cc: iptables <netfilter@lists.netfilter.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Wed, 16 Mar 2005, Brent Clark wrote:

> Hi
>
> I performed a netstat-nat on my fw.
>
> And there is a entry that I dont like.
>
> This is my employer working from home, probally left the remote desktop 
> session open.
>
> tcp   host81-153-16-165.range81-153.btcen:3191 
> resmanager.eccotours.local:3389          ESTABLISHED
>
> anyone know how I can just this kill this NATTED connection.
>

silly boy, yer trying to make this out to be something much more difficult 
then it is, cause you are forgetting admin basics.  ps -auxwww|grep bash. 
Yer trying to find the login shell and kill that process.

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

iD8DBQFCOKLEst+vzJSwZikRAjPrAJ4zPEKuc9FE3tCZPFMdIhc+RqQmxgCgi8rm
CH18qN4NpHZtO8dber05foE=
=g4tg
-----END PGP SIGNATURE-----

