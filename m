From: Security <security@ezsm.net >
Subject: Re: HELP!!! (ip_conntrack: table full)
Date: Mon, 27 Oct 2003 16:23:17 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200310271523.20112.security@ezsm.net>
References: <web-171329066@mail01.infosat.net>
Reply-To: security@ezsm.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <web-171329066@mail01.infosat.net>
Content-Description: clearsigned data
Content-Disposition: inline
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: Text/Plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Warren,
   I would only raise the value in /proc/net/ip_conntrack a little bit at a
time till you find the lowest number that works for your situation.  Once you
have everything under control, the number shouldn't have to be too high, at
least this has been my experience.  I only raise the number when having a
"situation", and then lower it back down once things are calmed down.

And yes, I did mean to rmmod ip_conntack, when I mentioned dropping
ip_conntrack.  Although, this tends to require dropping a few other modules
as well, and also tends to require stopping iptables while you do so. (due to
some of the modules that you have to remove.)  Which is why it is not the
best solution for all situations....

NH

On Monday 27 October 2003 2:52 pm, Warren P wrote:
> hi
>
> WRT echo ## > /proc/net/ip_conntrack
>
> Considering i've got 1gig of RAM ... what is a safe value i
> can set ip_conntrack_max to? The current value is 65528
>
> Also when you refer to dropping ip_conntrack ... do mean
> like rmmod ip_conntrack.o?
>
> Regards,
> Warren P
>
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE/nX62PEfiOMhBaIMRAhApAJ9wjH7HpUP2uS54gnKX366qx1HQdgCdErQ9
RijgnV+fchqx/oJ25qpCblA=
=vyvf
-----END PGP SIGNATURE-----


