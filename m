From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: Re: Dynamic DNS
Date: Wed, 9 Mar 2005 17:51:08 -0500 (EST)
Message-ID: <Pine.LNX.4.60.0503091748430.11874@darkstar.sysinfo.com>
References: <20050309062542.GA27660@gw.home.tux-labor.de>
	<422F5F90.6080005@SCampbell.net>
Mime-Version: 1.0
In-Reply-To: <422F5F90.6080005@SCampbell.net>
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
To: Steven M Campbell <Netfilter@SCampbell.net>
Cc: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Wed, 9 Mar 2005, Steven M Campbell wrote:

> Sebastian Docktor wrote:
>
>> Hi,
>> 
>> I want to allow a Dynamic DNS Client to Access the SSH-Server on my 
>> Firewall. But I don't want to open SSH for all IPs,
>> Is it possible that iptables always looks up the ip address from the 
>> hostname, so that only the ip has access which is registrated under
>> the dyndns?
>> 
>> 
>
> IMO, it's a very bad idea to lower the security of iptables firewall by 
> making it dependent on DNS for any portion of authorization certification. 
> DNS isn't exactly known for it's stellar security :)   Allow me to suggest an 
> alternate path.  Use RSA keyfiles and disallow ssh password authentication, 
> this way you can leave the port open but user's without public keys installed 
> on the server cannot gain access.  Generally speaking DNS should have nothing 
> to do with anyone's firewall because DNS would then become the weak link in 
> the security chain and SSH has methods that are better applied to these 
> needs.
>

Ahh, but this closes one sec loophole and pens another, sshd, which has 
gotten hit with quite a few sec issues.  Keeping the sshd port closed to 
the outside except a few 'special' systems makes the likelyhood of a 
system compromise due to sshd extremely unlikely.

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

iD8DBQFCL33gst+vzJSwZikRAtEuAJ4gVtsQ/B9jJ0XQx9QDxiuC9uZKZgCdFT6z
+lEHGPgPPq0GcxqMu7Da/f0=
=8naU
-----END PGP SIGNATURE-----

