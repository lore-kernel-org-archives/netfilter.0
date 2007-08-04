From: "Elvir Kuric" <omasnjak@gmail.com>
Subject: Re: Iptables rules processing
Date: Sat, 4 Aug 2007 22:37:52 +0200
Message-ID: <1814bfe70708041337n59bfc528n9cc3665f33bbd55d@mail.gmail.com>
References: <20070803161302.GB7815@sid.toystory.lan>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=A4zaqBgRuTeJ/qy/UXqWUXvcghmfD+35Vbx7MkNfhkMZ+PqJJ9beKu/m0GLK/Q6sG+qrb2frCFF9a9OsJUMfRjAvg+lRJiY2+7O1WNtcETI9E3jOawmYvtIUt7NGTufeYdiUNDwb6kneH3nAaoPirQmqepZubjhWWDjfV9Q5CMs=
In-Reply-To: <20070803161302.GB7815@sid.toystory.lan>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

Hi all,

in iptables like in many other firewall/access list  ( like in Cisco )
programs firewall rules are checked one by one, so in many cases is
problem if we do not care about specific requests and forget to
include all neccesary in firewall rules.

According to me, best place for all related to iptables is this
mailing list and next web location

http://iptables-tutorial.frozentux.net/iptables-tutorial.html

Best wishes


Elvir Kuric



On 8/3/07, Franck Joncourt <franck.joncourt@wanadoo.fr> wrote:
> Hi,
>
> Assuming we have the next two rules in our ruleset :
>
> iptables -A INPUT -s 192.168.10.14 -p tcp --dport 80 -j ACCEPT
> iptables -A INPUT -s 192.168.10.14 -p tcp --dport 443 -j ACCEPT
>
> I was wondering whether rules are processed one by one.
> In the two rules above, we have to check the source address
> 192.168.10.14, so I think this is done for the first one, and then for
> the second one. I am not quite sure ; Can anyone confirm that ?
>
> --
> Franck Joncourt
> http://www.debian.org - http://smhteam.info/wiki/
> GPG server : pgpkeys.mit.edu
> Fingerprint : C10E D1D0 EF70 0A2A CACF 9A3C C490 534E 75C0 89FE
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.6 (GNU/Linux)
>
> iD8DBQFGs1QOxJBTTnXAif4RAmR0AJ9v7hd+KU7PNzrb5O7hnTQwdVGEvQCgziNX
> NBHg4yEhbaFKlArhH722UE4=
> =capX
> -----END PGP SIGNATURE-----
>
>

