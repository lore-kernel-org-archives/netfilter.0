From: "Ferry van Steen" <ferry.van.steen@infopart.nl>
Subject: RE: Hosts.Deny Question??
Date: Thu, 12 Sep 2002 14:48:00 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000001c25a5a$a0b3f560$1be02a0a@infopart.nl>
References: <9AB58396B028D411B2110050040C7AD801910D75@pc213-104.indigo.ie>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <9AB58396B028D411B2110050040C7AD801910D75@pc213-104.indigo.ie>
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
To: 'Niall Murphy' <nmurphy@viking.ie>
Cc: netfilter@lists.netfilter.org

1. Wrong mailinglist
2. Not enough info (what SMTP server are you running)
3. I don't know of any SMTP server that supports TCP Wrappers (which is
hosts.deny/allow)
4. Only option probably is running your smtp server from inetd and
running it in TCP Wrappers there
5. Why on earth would you want to block IP's to your mailserver
6. If you don't know how to turn off relaying go to your favorite SMTP
server's mailing list
7. You could always deny those IP's by firewall rules, which is, what
this mailinglist is all about.
8. Well uh, I'm out :-)

Kind regards,

Ferry van Steen
InfoPart Automatisering B.V.
Beeksestraat 24
4841 GC Prinsenbeek
The Netherlands
Phone: +31 (0)76 - 5 44 04 11
Fax: +31 (0)76 - 5 41 83 51
Mobile: +31 (0)6 - 28 46 47 45
E-Mail (business): ferry.van.steen@infopart.nl
E-Mail (private): freaky@bananateam.nl
MSN Messenger: freaky@freaky2000.dyndns.org
ICQ (UIN (seldom used)): 191458

Insert your favorite yada yada yada my opinions don't (necessarily)
represent the ones of my company nor do my actions yada yada yada
disclaimer.

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Niall Murphy
Sent: donderdag 12 september 2002 13:38
To: netfilter@lists.netfilter.org
Subject: Hosts.Deny Question??

Hi All,
i want to use hosts.deny to block emails and ip's to my email
server..sounds
easy but i cant seem to get it to work
do i just need to add the emails or ip's to the host.deny and then add a
rule to my script
could some one please explain and maybe give me the rule
thanx in advance
niall



