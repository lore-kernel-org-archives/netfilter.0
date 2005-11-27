From: Leonardo Marques <surf3r0@gmail.com>
Subject: Re: Route block CONNECT requisitions for apache
Date: Sun, 27 Nov 2005 12:37:28 -0200
Message-ID: <eb5ae9cc0511270637y4bc28d2fp348dfbf215425fe6@mail.gmail.com>
References: <eb5ae9cc0511270326k56aac640g9141e264471247a4@mail.gmail.com>
	<4389BD92.2040908@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4389BD92.2040908@gmail.com>
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
To: Lista IPTABLES <netfilter@lists.netfilter.org>

On 11/27/05, Georgi Alexandrov <georgi.alexandrov@gmail.com> wrote:
> Leonardo Marques wrote:
>
> >Hello,
> >
> >I have a apache webserver behind a iptables firewall, and some people
> >are trying to abuse from my server probably for spam. I have this
> >information on the log of the apache:
> >
> >219.80.160.238 - - [27/Nov/2005:08:56:13 -0200] "CONNECT
> >64.161.246.99:25 HTTP/1.0" 200 6446
> >
> >I have a lot of this lines, with some diferent IPs, I already blocked
> >all those IPs.
> >
> >I want create a rule that block all those type of connections, someone
> >know how can i do?
> >
> >The ideia ir more or less it:
> >
> >"everything witch comes for the htttp_port wich contain 'connect type
> >connections' must be deny or droped'"
> >
> >
> >
> What's the point in doing this? As those are no harm to your system.
> Or you like to complex your life as much as possible and then say: "oh,
> security isn't for everyone, but i'm managing somehow!"
> Perhaps you should leave those and deal with something more useful.
>

Whats the problem to search a finally solution for a problem!? I cant
understand
why you are so brave with it. I thought here is a place to discuss
about security with Iptables. :/

Whats the problem to dont have free time to be reading the apache log
and be blocking manually a lot of ips?! Whats the problem to find a
rule wich solve this problem for me?!

Exactly, i need it to be automated, to have time to do another things.

Georgi, if you dont want help... just dont say nothing, its better for
me, for you, for everybody.

> regards,
> Georgi Alexandrov
>
>

--
------------------------------
Leonardo Marques
http://www.analyx.org
------------------------------

