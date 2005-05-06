From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: Re: SSH Brute force attacks
Date: Fri, 6 May 2005 15:29:40 -0400 (EDT)
Message-ID: <Pine.LNX.4.60.0505061518060.32457@darkstar.sysinfo.com>
References: <427B93EE.3030905@eccotours.dyndns.org>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <427B93EE.3030905@eccotours.dyndns.org>
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



use sshd_config to do the most here for you, set this;

PasswordGuesses                 1

That will slow auto scripts and kiddies down.  The default here is 3.  you 
might also, since sshd is tcpd capable, restrict sshd to only allow 
logings from specific addresses and users, and tcpd logs this all nicely 
for one as well.

Thanks,

Ron DuFresne


On Fri, 6 May 2005, Brent Clark wrote:

> Hi All
>
> One one of my hosted boxes, my logwatch scripts continuously pipe out my ssh 
> and auth log of unsuccessful dictionary attacks
>
> I came across this link : http://blog.andrew.net.au/2005/02/17/
>
> And seen that it would help me slow (in hope) that malious person done.
>
> Would anyone care to comment / share tips etc on what I have below
>
> iptables -A INPUT -p tcp --dport 22 -m state --state NEW -m recent --set 
> --name SSH
> iptables -A INPUT -p tcp --dport 22 -m state --state NEW -j SSH_WHITELIST
> iptables -A SSH_WHITELIST -s $MYIPADDRESS -m recent --remove --name SSH -j 
> ACCEPT
> iptables -A INPUT -p tcp --dport 22 -m state --state NEW -m recent --update 
> --seconds 60 --hitcount 4 --rttl --name SSH -j LOG --log-prefix "SSH BRUTE"
> iptables -A INPUT -p tcp --dport 22 -m state --state NEW -m recent --update 
> --seconds 60 --hitcount 4 --rttl --name SSH -j DROP
>
> Kind Regards
> Brent Clark
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

iD8DBQFCe8Wnst+vzJSwZikRAjNyAKDG4YSEHKO3TG0PbrKS7apsUMoM8wCfeyHo
vRw5TCVAqSLN9CZSzbAT3Hs=
=ylIV
-----END PGP SIGNATURE-----

