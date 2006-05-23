From: bjorn@ruberg.no (=?iso-8859-1?q?Bj=F8rn?=)
Subject: Re: authenentication
Date: Tue, 23 May 2006 13:54:47 +0200
Message-ID: <uizr72l7y7s.fsf@false.linpro.no>
References: <008c01c67e58$0a9c38f0$0301a8c0@david9d3eac8c1>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <008c01c67e58$0a9c38f0$0301a8c0@david9d3eac8c1> (David
	theobald's message of "Tue, 23 May 2006 22:59:56 +1200")
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
To: David theobald <davidtheo@gmail.com>
Cc: netfilter@lists.netfilter.org

"David theobald" <davidtheo@gmail.com> writes:

> I am trying to do the following can anyone help
>
> I want my wireless network to use the proxy on my sever proxy cashe in
> order to access http and ftp however I want them to use user-based
> authenentication on the proxy how do I do this I am using squid on the
> sever proxy Cashe firewall
>
> I am trying to do this in IPTABLES can anyone please help
>
> David

You need to separate your thoughts. Your requirements involve
different mechanisms and should be handled as such. Iptables alone
will not solve your problem.

First of all, create iptables rules that only allows traffic to your
proxy for the computers on your wireless network. Depending on your
infrastructure, you may also need to allow traffic to DNS and e-mail
servers, etc.

When that works, configure your proxy for user based authentication.

Finally, configure the computers on your wireless network to use the
proxy. Do not try to introduce transparent proxying, at least not
until this basic functionality is in place.

Important: Configure iptables to log traffic that is denied, so that
you are able to debug when something does not work as expected.

Read the netfilter-howto on
http://www.netfilter.org/documentation/HOWTO/packet-filtering-HOWTO.html
and also use http://www.linuxguruz.com/iptables/ for references and
good ideas.

Good luck!

--
Bj=F8rn



