From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: Re: iptables crashes server?
Date: Tue, 5 Apr 2005 12:34:59 -0400 (EDT)
Message-ID: <Pine.LNX.4.60.0504051232040.11158@darkstar.sysinfo.com>
References: <4250F7E0.3070203@uplink-verein.ch>
	<1403218a05040404475c810345@mail.gmail.com>
	<42523486.7000107@uplink-verein.ch>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42523486.7000107@uplink-verein.ch>
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
To: Moritz Gartenmeister <moritz@uplink-verein.ch>
Cc: netfilter <netfilter@lists.netfilter.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Tue, 5 Apr 2005, Moritz Gartenmeister wrote:

> i checked the memory usage a little more in detail:
>
> the free ram is decreasing.
> the active use of ram is increasing.
>
> ergo, something is filling up my ram. i run apache, irc-proxy, snort and 
> argus besides iptables.
>
> for me, there seems something buggy in the kernelspace of iptables.
>
> but, if i am the only one with this problem, it's maybe not.
>

There are two things you might do to deal with memory over consumption 
issues;

Add more RAM to the system

or off load some of the services to other systems rather then directly 
running them all on the firewall server.  And this is likely the better 
way to deal with the problem in my mind.  firewalls afterall are 
traditionally a single purpose system.


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
Key fingerprint = 9401 4B13 B918 164C 647A  E838 B2DF AFCC 94B0 6629
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFCUr43st+vzJSwZikRAhB5AJsFNxy0VUPQDPbgV2g4vS/NWl+mZgCcDUui
kJNnt/dXPVl48WVqY/4CZP8=
=hgsV
-----END PGP SIGNATURE-----

