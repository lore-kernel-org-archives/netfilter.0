From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: Redirecting to more than 1 port.
Date: Wed, 19 Feb 2003 19:19:08 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200302191919.08655.netfilter@newkirk.us>
References: <200302191723.h1JHNAq26668@mailgate.mailbox.co.za>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200302191723.h1JHNAq26668@mailgate.mailbox.co.za>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Warren P <warrenp@websurfer.co.za>, netfilter@lists.netfilter.org

On Wednesday 19 February 2003 12:23 pm, Warren P wrote:
> hi
>
> I want to run 2 instances of SQUID (Transparent Proxy). Currently I'm
> running only one instance of squid and my IPTABLE is as follows:
>
> iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j REDIRECT
> --to-port 3128
>
> My 2nd instance of Squid will run one port 8080, will the following
> configuration be correct:
>
> iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j REDIRECT
> --to-port 3128:8080

I don't think this isn't valid construction for a rule.  "--to-port=20
3128-8080" would be valid, but would map over that entire range of port=20
numbers.   You will probably only get this working the way you want it=20
if you use sequential ports.

Why would you want two squids running on one machine handling the same=20
traffic?

> If not, can you please advice.
> _______________________________________________________________
>  http://www.webmail.co.za the South-African free email service
>
>   NetWiseGurus.Com Portal - Your Own Internet Business Today!


