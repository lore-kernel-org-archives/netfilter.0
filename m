From: Maciej Soltysiak <solt@dns.toxicfilms.tv>
Subject: Re: some body hacked my system
Date: Tue, 8 Oct 2002 22:01:59 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0210082051320.23598-100000@dns.toxicfilms.tv>
References: <001e01c26edc$73aca530$8c01a8c0@sundaram>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001e01c26edc$73aca530$8c01a8c0@sundaram>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sundaram Ramasamy <sun@percipia.com>
Cc: netfilter@lists.netfilter.org

> wc3.part01.rar.gz  wc3.part07.rar.gz  wc3.part13.rar.gz  wc3.part19.rar.gz
> wc3.part02.rar.gz  wc3.part08.rar.gz  wc3.part14.rar.gz  wc3.part20.rar.gz
> wc3.part03.rar.gz  wc3.part09.rar.gz  wc3.part15.rar.gz  wc3.part21.rar.gz
> wc3.part04.rar.gz  wc3.part10.rar.gz  wc3.part16.rar.gz
> wc3.part05.rar.gz  wc3.part11.rar.gz  wc3.part17.rar.gz
> wc3.part06.rar.gz  wc3.part12.rar.gz  wc3.part18.rar.gz
>
> Is anybody knows what this file used for?
Of course. The famous, War Craft III.

> How will i block this IP Address in my firewall?
iptables -A INPUT -s <ip> -j DROP

> How will i check what else he did on my machine?
Well, maybe i did not get it right, be it looks as if someone is making
a Warez site out of your machine. The easiest way evil people exploit it
is that they use world writeable anonymous ftp servers. Check it.

If it is an intrusion, go and browse the logs, look in .bash.history,
suspicious users, processes, mc's history, again: logs. look for deleted
parts in the logs.

And download, compile and run: chkrootkit. Which looks for rootkits and
trojans in you binaries.

Good luck,
Maciej Soltysiak



