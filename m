From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: Log Analyser
Date: Wed, 2 Jul 2003 08:03:22 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A15BEAF@wardrive.citadelcomputer.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: Leandro <leandro@mail.webway.com.br>, netfilter@lists.netfilter.org

I rule a special chain called `-N MRTG` and store all my counters in =
there. Then I wrote my own PHP script to go through the list and gather =
the counted packets for each rule and place them into MySQL every 5 =
minutes.
I then have a crontab every 5 minutes which runs MRTG and has targets =
which run my script to gather the counters..

The advantage is that reboots don't effect the counts, Monthly counts =
can be archived and reset and all sort of little things...

Oh also, I use RRDTool to graph the targets every 5 minutes too. It's a =
fiddley setup and it's not a C++ binary program but esy to make changes =
though...

Does this help you with what you need?

Thanks,
____________________________________________
George Vieira
Systems Manager
georgev@citadelcomputer.com.au

Citadel Computer Systems Pty Ltd
http://www.citadelcomputer.com.au
=20

-----Original Message-----
From: Leandro [mailto:leandro@mail.webway.com.br]
Sent: Wednesday, July 02, 2003 4:31 AM
To: netfilter@lists.netfilter.org
Subject: Log Analyser


Hi,

Does anyone know a tool that show logs from Iptables in a HTML Report?

I=B4m using Iptables Log Analyser, but I have found many errors when I =
was
working with a more powerfull server.

This tool works like this:

1 - It=B4s configured iptables log=B4s prefix
2 - A scheduled task (tail), read /var/log/messages and record these
informations in a MySQL DB
3 - An Web Interface shows the results.

But, because of the use of a powerfull machine, sometimes, the prefix =
isn=B4t
being showed correctly.

Does anyone know a solution for this?

Thanks in Advance

Leandro





