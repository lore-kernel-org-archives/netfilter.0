From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: netfilter_queue: how to obtain address info from queued packet
Date: Tue, 23 Jan 2007 11:31:55 +0100
Message-ID: <1169548315.4178.61.camel@anduril.intranet.cartel-securite.net>
References: <45B5DD80.70809@siemens.com> <45B5DF09.6030001@freemail.hu>
	<45B5E0DC.2020703@siemens.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <45B5E0DC.2020703@siemens.com>
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
To: Michal Martinek <michal.martinek@siemens.com>
Cc: netfilter@lists.netfilter.org

Le mardi 23 janvier 2007 =E0 11:18 +0100, Michal Martinek a =E9crit :
> > Do you know the STRING module ?
> I'm afraid not. Can you give me some explanation (or link)?

http://www.google.com/search?q=3Dnetfilter+string

By the way, string match is completely irrelevant to your question as it
would allow you to match a given packet with a fixed already known
value, not to extract a value you don't know from the packet.

What you want to achieve is a conntrack helper. You can have a look at
existing ones, such as ip_conntrack_ftp, ip_conntack_irc, etc. You could
also use QUEUE target to do the job in userland.


--=20
http://sid.rstack.org/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

