From: PayalR <payal@hotpop.com>
Subject: Re: are these enough now?
Date: Fri, 4 Oct 2002 16:55:41 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <5707.72010037235$1033730999@news.gmane.org>
References: <200210041218.26636@.> <200210040947.g949lgL10535@vulcan.rissington.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200210040947.g949lgL10535@vulcan.rissington.net>
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
To: netfilter@lists.netfilter.org

Hi all,
Thanks a lot for the mails.
> 161 - snmp - are you managing this system from elsewhere, or is this
> machine the snmp monitor ?   UDP 161 only needs to be inbound if this
> machine is being monitored from elsewhere
Well, I don't know anyting about SNMP thing. But the guys at the server f=
arm=20
suggested I make some changes as told by them in my snmpd.conf, so that t=
hey=20
say I there will be able to monitor my machine. I guess so I am just a cl=
ient=20
SNMP. So, which ports to keep open?

> > Also, nmap shows that 2002/udp globe is open. Shall I close it?
> machine already has the Slapper worm on it, since that opens UDP port 2=
002
well, my machine had a slapper worm. I removed the .bugtraq file from /tm=
p.=20
Now still the port is open. This is very important to me. How do I close =
the=20
port???? nmap report says,
2002/udp   open        globe
How do I know where and what is globe? How do I shut it?

> I would recommend setting your OUTPUT chain to ESTABLISHED,RELATED and =
then
do you mean similar to INPUT rule i.e using -m and all?

> add any rules for traffic which is supposed to originate on your server
> (such as DNS queries).

Thanks a lot and eagerly waiting for the mails.
Bye and thanks.
-Payal

