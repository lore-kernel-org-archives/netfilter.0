From: John <futurasci@gmail.com>
Subject: Re: Strange ip_conntrack values
Date: Sun, 18 Jul 2004 13:28:32 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <ef83df6b0407180428f43532d@mail.gmail.com>
References: <ef83df6b040718033163810a15@mail.gmail.com> <200407181146.30331.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200407181146.30331.Antony@Soft-Solutions.co.uk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

> I agree this is strange, because the default TIME_WAIT timeout value is 2
> minutes (you haven't increased this, have you?), therefore this would sug=
gest
> that nearly 24000 connections through your firewall were completed during=
 the
> past two minutes...   This seems unlikely, especially in light of the num=
ber
> (883) you have in progress right now.

yes it's still =E0 2 min

> If you "grep TIME_WAIT /proc/net/ip_conntrack | more", do you see nearly =
all
> entries with the same source and/or destination address?   If so, investi=
gate
> that machine.....

unfortunately not ...

> If not, I suggest a network sniffer (eg: ethereal) or some netfilter LOGg=
ing
> rules to see if you can identify what all this traffic is.

how can I do that ? could u help me achieving this ? I've installed
tcpdump and logged all connections between 4AM and 6AM but it's not
easy to find something ...

could it come from the firewall ?

thanks for your help

