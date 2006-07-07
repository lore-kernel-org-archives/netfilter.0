From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: Re: Rsync PortRedirection
Date: Fri, 7 Jul 2006 16:21:22 -0400 (EDT)
Message-ID: <Pine.LNX.4.64.0607071619110.6870@darkstar.sysinfo.com>
References: <52837e3e0607030633k5320f2f2rc9b8564c9fe5d10e@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <52837e3e0607030633k5320f2f2rc9b8564c9fe5d10e@mail.gmail.com>
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
To: Bruno Nunes <nunesb@gmail.com>
Cc: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Mon, 3 Jul 2006, Bruno Nunes wrote:

> Hi,
>  How can i use rsync beetwen 2 computers in diferents networks? I
> put an addicional ip address in the router to host this forward that i
> will call _ip2
>
> Computer A = 139.82.xxx.xx1
> Computer B = 192.168.1.4
> router_ip2 = 139.82.xxx.xx2
>
> router_ip2 and computer A are onde the same network
> router is on both networks, of course
>
> rsync uses port 873 i guess
>
> this is what i want to run:
> rsync -razvp localhost:/home/ 139.82.xxx.xx2::backup/daily
>
> 139.82.xxx.xxx -> router -> 192.168.1.4 : 873
>
> i tried:
> iptables -t nat -A PREROUTING -d 139.82.xxx.xx2 -i eth0 -p tcp --dport
> 873 -j DNAT --to 192.168.1.4
> ...but didnt work
>
> thanks
>

If ssh works in your networking rules, rsync can run on the ssh port, I 
think, if I recall from research a few years back it;s the -e switch to 
rsync.

yep;

     -e, --rsh=COMMAND           specify the remote shell


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
Version: GnuPG v1.4.4 (GNU/Linux)

iD8DBQFErsJGst+vzJSwZikRAqd7AJ96NwQttDCZLK9sskMfvUkM8yx07wCgiwNn
rihnV59OyZty+Gqj3Do9+xE=
=rJtY
-----END PGP SIGNATURE-----

