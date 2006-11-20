From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: Re: ipset: how to run non-root
Date: Mon, 20 Nov 2006 19:52:22 +0000 (UTC)
Message-ID: <Pine.LNX.4.64.0611201951120.15481@darkstar.sysinfo.com>
References: <455F8DE9.8060105@mailinator.com>
	<20061119001541.GA13056@outback.rfc2324.org>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20061119001541.GA13056@outback.rfc2324.org>
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
To: Maximilian Wilhelm <max@rfc2324.org>
Cc: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Sun, 19 Nov 2006, Maximilian Wilhelm wrote:

> Am Samstag, den 18 November hub Mike Wright folgendes in die Tasten:
>
> Hi!
>
>> I'm trying to use ipset from a php script on an apache server.
>
>> ipset requires root user in order to execute, but the webserver is
>> running as apache.  suexec is not a possibility because it won't execute
>> programs with root permissions.  It is possible to have a cron job
>> perform the task but that introduces a time delay.
>
>> I've tried changing ownership of ipset to apache:apache but that didn't
>> work.  Still received the "must be root" warning.
>
>> I looked into the source of ipset.c but it seems like the socket() call
>> must be done as root, and I don't know how to hack around that.
>
>> Does anybody know how I might accomplish this?
>
> I never used ipset, but you could use a generic trick:
> Set the owner of the ipset binary back to root and set the suid bit
> which will result in the ability for everyone who can execute the
> binary to do this "as root".
>
> You might want to think about an execution restriction (e.g. via the group)
> to prevent people who should no fiddle with ipset from doing so.
>
> I hope you have some access control via your web application...
>

better advice would be to leave the bits alone and think of perhaps 
allowing sudo access if really required, but it should be seriously 
considered from a security context.

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

iD4DBQFFYgd5st+vzJSwZikRAmNSAJdv1VMRX0tZq2kX4i+i+ayXCxQFAJ9VkarI
C8T2g8d7mh/WbHBmquX9jA==
=ibec
-----END PGP SIGNATURE-----

