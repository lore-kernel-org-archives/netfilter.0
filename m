From: Steven M Campbell <Netfilter@SCampbell.net>
Subject: Re: Dynamic DNS
Date: Wed, 09 Mar 2005 15:58:14 -0500
Message-ID: <422F6366.5000500@SCampbell.net>
References: <20050309062542.GA27660@gw.home.tux-labor.de>
	<422F5F90.6080005@SCampbell.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: netfilter@lists.netfilter.org

Steven M Campbell wrote:

> Sebastian Docktor wrote:
>
>> Hi,
>>
>> I want to allow a Dynamic DNS Client to Access the SSH-Server on my=20
>> Firewall. But I don't want to open SSH for all IPs,
>> Is it possible that iptables always looks up the ip address from the=20
>> hostname, so that only the ip has access which is registrated under
>> the dyndns?
>>
>>
>>
>
> IMO, it's a very bad idea to lower the security of iptables firewall=20
> by making it dependent on DNS for any portion of authorization=20
> certification. DNS isn't exactly known for it's stellar security :)=20
> Allow me to suggest an alternate path. Use RSA keyfiles and disallow=20
> ssh password authentication, this way you can leave the port open but=20
> user's without public keys installed on the server cannot gain access.=20
> Generally speaking DNS should have nothing to do with anyone's=20
> firewall because DNS would then become the weak link in the security=20
> chain and SSH has methods that are better applied to these needs.
>
>
A quick look at the sshd_config man pages reveals

AllowUsers
This keyword can be followed by a list of user name patterns, separated=20
by spaces. If specified, login is
allowed only for user names that match one of the patterns. =E2=80=98*=E2=
=80=99 and =E2=80=98?=E2=80=99=20
can be used as wildcards in the pat=E2=80=90
terns. Only user names are valid; a numerical user ID is not recognized.=20
By default, login is allowed for
all users. If the pattern takes the form USER@HOST then USER and HOST=20
are separately checked, restricting
logins to particular users from particular hosts.

Sorry for straying off the topic folks, I think you might care to take=20
this route.

