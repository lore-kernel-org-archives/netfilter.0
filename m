From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: Best way to put a quota on masquaraded connections.
Date: Thu, 21 Nov 2002 21:05:54 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200211212105.54935.netfilter@newkirk.us>
References: <000401c291b8$b3276a70$6601a8c0@s3ac>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000401c291b8$b3276a70$6601a8c0@s3ac>
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
To: Rowan Reid <rreid@studio3arc.com>, netfilter@lists.netfilter.org

On Thursday 21 November 2002 06:49 pm, Rowan Reid wrote:
> I have a linux Firewall, with about 20 Masq clients. I'm noticing that
> between streaming audio/video and ftp downloads users are maxing out th=
e
> connection 500K T1. I would like to put a 128K limit per connection (
> I'm assuming only 4 concorrent connections) with a total of 10
> connections at a time. To add to that list I'm also hosting a website
> for which I would like to reserve 128K. So in short I would like to 1.)
> prioritize my connections a.webserver b. e-mail trnasmitions
> c.web/ftp/streaming
> How do I even start .

http://www.linuxguruz.org/iptables/howto/2.4routing.html might be a good=20
start, the Linux 2.4 Advanced Routing HowTo.  It explains different queui=
ng=20
approaches available, and creation of routing rules with iproute2.  (amon=
g=20
other things)  You can use iptables to add mangle-prerouting rules that s=
et=20
TOS for various packet types/sources/destinations, then use some routing=20
rules and a queuing discipline to prioritize and/or limit them.

j


