From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: Iptables bug?!
Date: Fri, 21 Feb 2003 01:39:31 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200302210139.31884.netfilter@newkirk.us>
References: <20030220220143.4515.qmail@web10302.mail.yahoo.com>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030220220143.4515.qmail@web10302.mail.yahoo.com>
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
To: Fabrizio Di Meo <fabriziodimeo@yahoo.it>, netfilter@lists.netfilter.org

On Thursday 20 February 2003 05:01 pm, Fabrizio Di Meo wrote:
> Hi,
>
>  I'm using suse 7.3 and iptables v1.2.2.
>
> Performing a prerouting operation like the folowing one:
>
> iptables -t nat -A PREROUTING -p tcp --dport 139 -i ppp0 -j DNAT --to
> 192.168.1.5:139
>
> I got an anomaly because even though it's really working fine it goes
> on to forward the packets when removed by this:
>
> iptables -t nat -D PREROUTING -p tcp --dport 139 -i ppp0 -j DNAT --to
> 192.168.1.5:139
>
> I couldn't explain that such iptables' behaviour....is here anyone who
> can?

Very likely connection tracking still has 'live' connections, and it is=20
allowing them to continue.  If the connection is already ESTABLISHED=20
then NAT will normally continue to function for that connection even if=20
the rule that initiated it is removed.

j


