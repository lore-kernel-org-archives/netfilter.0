From: Bo Yang <struggle@mail.nankai.edu.cn>
Subject: Re: Traffic Accounting on Small System and User Limits.
Date: Fri, 29 Sep 2006 12:55:44 +0800
Message-ID: <359505980.29170@mail.nankai.edu.cn>
References: <359501767.17840@mail.nankai.edu.cn>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Message-ID: <451CA750.7050209@mail.nankai.edu.cn>
In-Reply-To: <359501767.17840@mail.nankai.edu.cn>
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
Content-Type: text/plain; charset="us-ascii"
Cc: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1
 
Don Gould :
> This is a requirement for a small system I'm building for a local
> motel to be able to give internet access away free to their
> customers.
>
> I have looked in to a bunch of different stuff but don't know the
> best way to go.  I know this might not even be the right list to
> ask on, so please be kind. :)
>
> OPEN SOURCE GPL PLEASE - I have already done some work on some
> systems to get me what I want...  all the work I'm doing is on open
>  source stuff and is/will be made available back to the community,
> so, if you have a need for this work as well but can't help, then
> please feel free to drop me a line and I'll keep you informed.
>
> 1. I want to keep a record of the amount of data each user uses
> over a given amount of time.  I know the users IP number and their
> MAC address.  I modified DNSMasq [1] to tell me this each time the
> user issues a DHCP request.
If you just want to get how many bytes a user used in a given range of
time , iptalbes can do it very nicely !
iptables -t filter -A forword  -s {your user ip}
>
> 2.  It is proposed that each MAC will be given 50mb of data to use.
>  After this the user/MAC will have to be authorised to have more.
You can use iptables quota module to accomplish this .
>
> The servers I'm using will run Debian Saige and are only small - p2
>  or 3 with ~30 to 64mb ram and 2 - 3gb hard disk.  Each server only
>  has to look after < 50 clients and in most cases wouldn't get more
>  than 10 using it at a time.
Oh , bad  hardware  ~
 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (MingW32)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org
 
iD8DBQFFHKdP7tZp58UCwyMRAtsFAKC7PQ2zlFtdbwtTAtuPOcRe345auwCaA8aj
rKiCK4X1fDgjZT6euB0b7nQ=
=g8nB
-----END PGP SIGNATURE-----


