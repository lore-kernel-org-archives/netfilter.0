From: Jason Opperisano <opie@817west.com>
Subject: Re: I dont know how to forward port 80
Date: Mon, 14 Feb 2005 17:32:50 -0500
Message-ID: <1108420370.4338.23.camel@hubcap.ljm.dom>
References: <420B54E3.8040900@google.com>
	<1108128247.4489.45.camel@hubcap.ljm.dom>
	<1108297731.10876.28.camel@nostromo.bgsecm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1108297731.10876.28.camel@nostromo.bgsecm.com>
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

On Sun, 2005-02-13 at 07:28, Jose Maria Lopez Hernandez wrote:
> El vie, 11-02-2005 a las 08:24 -0500, Jason Opperisano escribi=C3=B3:
> >   # allow input packets that are part of an established connection
> >   iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
> >=20
> >   # allow HTTP requests in
> >   iptables -A INPUT -p tcp --syn --dport 80 -j ACCEPT
>=20
> Sorry, I've seen in some of your answers that you never use
> -m state --state NEW. Could you tell me why?=20

for the sake of clarity.  when someone asks, "how do i allow http into
my machine" it seems clearer to say:

  iptables -A INPUT -p tcp --syn --dport 80 -j ACCEPT

rather than:

  iptables -A INPUT -m state --state NEW -p tcp --syn \
    --sport 1024:65535 --dport 80 -j ACCEPT

you're not going to make me add a disclaimer to all my posts that says
"any rules are included to clarify a point of discussion.  do not use
the rules posted without understanding the full security implications of
such an act.  firewall rules lasting more than four hours require
medical attention."

> I am updating
> my firewall and I'm very confused with this, because you
> seem to know everything about Netfilter and iptables,

heh heh--thanks, i needed a laugh.

>  and
> I am using the NEW state in all my rules. Should I do it
> or should I not?=20

i do.

> And by the way, should I use the --syn
> flag?

i do.

-j

--
"I'm not a bad guy! I work hard, and I love my kids. So why should
 I spend half my Sunday hearing about how I'm going to Hell?"
	--The Simpsons


