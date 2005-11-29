From: Dave Strydom <strydom.dave@gmail.com>
Subject: Re: Is using a blacklist in iptables a good strategy?
Date: Tue, 29 Nov 2005 10:29:39 +0200
Message-ID: <fc38b710511290029i4a813e4fxdb80e5c957cb1bc2@mail.gmail.com>
References: <1133252475.20357.5.camel@sonoda.bioscene.co.jp>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1133252475.20357.5.camel@sonoda.bioscene.co.jp>
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
To: netfilter@leangen.net
Cc: netfilter@lists.netfilter.org

yes there is:

http://people.netfilter.org/peejix/geoip/howto/geoip-HOWTO-2.html

it's a geoip patch for iptables, allows you to block entire countries,
or you can allow connections from only certain countries.

Dave

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

On 11/29/05, David Leangen <netfilter@leangen.net> wrote:
>
> Hello,
>
> I don't know why, but I'm getting a little fed up with break-in attempts
> happening every single day.
>
> Do I just have to accept this as a fact of life?
>
>
> I started keeping a list of IP addresses that I'm just going to
> blacklist, but this does not seem like a maintainable solution. For now,
> I'm just adding lines like so:
>
>   ...
>   -A INPUT -s xxx.xxx.xxx.xxx -j BLACKLIST
>   ...
>   -A BLACKLIST -j DROP
>   ...
>
> What is common practice?
>
>
> Is it possible to blacklist any packets that come from a server from a
> given country?
>
>
> Thanks for the advice!
> Dave
>
>
>
>

