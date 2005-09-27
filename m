From: Edmundo Carmona <eantoranz@gmail.com>
Subject: Re: Iptables for webmail access
Date: Tue, 27 Sep 2005 12:45:48 -0400
Message-ID: <65aa6af9050927094547a513b7@mail.gmail.com>
References: <01ef01c5c382$b9666ef0$0b0c0a0a@Alejandro>
	<65aa6af90509270945451b637e@mail.gmail.com>
Reply-To: Edmundo Carmona <eantoranz@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <65aa6af90509270945451b637e@mail.gmail.com>
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
To: netfilter@lists.netfilter.org

are you allowing traffic on the lookback interface in input?

iptables -A INPUT -i lo -j ACCEPT

Remember traffic to localhost will go through OUTPUT, and then will reach I=
NPUT.

On 9/27/05, Alejandro Cabrera Obed <sisdis@tournet.com.ar> wrote:
> Hi people,
>
> I have a Linux machine with a webmail server  (smtp+imap+http), and I hav=
e a
> iptables script in order to protect the host.
>
> By default I deny all the traffic. Then, I enable all new connections
> (--syn) from every hosts (-s 0/0) to ports 25, 80 and 143.
>
> But whern a try to log in via web, I can enter the webmail interface and =
I
> get a message teling "IMAP timeout".
>
> The connection from the webmail to the imap server is from eth0 to eth0, =
I
> suposse Im forgetting something like this.....
>
> Can you help me with a iptables rule in order to connect to my imap serve=
r
> from the webmail interface, both in a unique machine ???
>
> Thanks a lot,
>
>
> Alejandro
>
>
>

