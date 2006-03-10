From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: Rule to limit outbound packets?
Date: Fri, 10 Mar 2006 14:09:10 +0100 (CET)
Message-ID: <63409.193.173.147.3.1141996150.squirrel@webmail.sterenborg.info>
References: <fedfc260603092039y3b7fabfagf86b4310abab5696@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <fedfc260603092039y3b7fabfagf86b4310abab5696@mail.gmail.com>
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

On Fri, March 10, 2006 05:39, Eduardo Fern=E1ndez wrote:
> Hi!
>
> I admin a linux router at a uni dorm, the internet link is adsl (low
> upstream bw) so I to write a rule that limits (mostly outbound) p2p
> traffic. I'm trying something like this:
>
> iptables -A FORWARD -m limit --limit 200/s --limit-burst 200 -p tcp
> --syn --dport 4662 -j ACCEPT
> iptables -A FORWARD -p tcp --syn --dport 4662 -j REJECT
>
> or
>
> iptables -A FORWARD -o $IFOUT -m limit --limit 100/s --limit-burst
> 1000 -p tcp --syn --dport 4662 -j ACCEPT
> iptables -A FORWARD -o $IFOUT -p tcp --syn --dport 4662 -j REJECT
>
> but it doesn't seem to work. I can't use hashlimit because I only can
> use 2.4 (any patch to use hashlimit in 2.4?).

Perhaps you'd better use the p2p patch because it's easy to circumvent --=
dport
4662.

http://www.netfilter.org/projects/patch-o-matic/pom-extra.html#pom-extra-=
ipp2p


Gr,
Rob



