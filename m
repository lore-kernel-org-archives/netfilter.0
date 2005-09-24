From: Filip Sneppe <filip.sneppe@gmail.com>
Subject: Re: redirect port 80 to 8080 for single PC
Date: Sat, 24 Sep 2005 13:34:41 +0200
Message-ID: <9151ac2a0509240434647df2b@mail.gmail.com>
References: <20050924105950.69207.qmail@web36108.mail.mud.yahoo.com>
Reply-To: Filip Sneppe <filip.sneppe@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050924105950.69207.qmail@web36108.mail.mud.yahoo.com>
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
To: "LinuxMurah.com" <linux_murah@yahoo.com>
Cc: netfilter@lists.netfilter.org

Hi,

On 9/24/05, LinuxMurah.com <linux_murah@yahoo.com> wrote:
>
> now how to redirect this port 80 request from local
> user to SQUID proxy server with port 8080.
>
> I've try transparant proxy:
>
> iptables -t nat -A PREROUTING -i eth1 -p tcp -dport 80
> -j REDIRECT --to-port 8080
>
> but still failure, I mean all user still can access
> internet without proxy.
>
Well, if the rule should work for local users, then
you should use "-A OUTPUT" instead of "-A PREROUTING".
Also, the input interface will not work with "-A OUTPUT",
so if you want to specify an interface, add the outgoing
interface with "-o eth0". That should do the trick.

Regards,
Filip

