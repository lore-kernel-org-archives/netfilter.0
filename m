From: =?ISO-8859-1?Q?J=F6rg_Harmuth?= <harmuth@mnemon.de>
Subject: Re: Defeating NMAP Null scans (and Nessus scans).
Date: Thu, 07 Jul 2005 09:13:35 +0200
Message-ID: <42CCD61F.4000701@mnemon.de>
References: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAAsvh50JgMeE+wdUqpg8SwJMKAAAAQAAAA0VU7kwJQ1kSCxnmqi2LTiQEAAAAA@ziemba.net>	<Pine.LNX.4.61.0506221442160.25356@yvahk01.tjqt.qr>	<Pine.LNX.4.60.0506221245590.21678@darkstar.sysinfo.com>	<Pine.LNX.4.61.0506221845160.21055@yvahk01.tjqt.qr>	<Pine.LNX.4.60.0506221519210.21678@darkstar.sysinfo.com>	<Pine.LNX.4.61.0506231301530.26133@yvahk01.tjqt.qr>
	<5d2f37910507061254293f83de@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <5d2f37910507061254293f83de@mail.gmail.com>
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

curby . schrieb:

[SNIP]

> Here are some rules I've used when testing out ways to catch nmap
> scans.  If anyone knows what the SYN,RST SYN,RST match is for, please
> let me know.
> 

[SNIP]

> # Misc scan - everyone tests for this, but what scan does it match?
> $IPTABLES -t nat -A PREROUTING -p tcp --tcp-flags SYN,RST SYN,RST -j
> DROP || die 05 87
> 

"--tcp-flags SYN,RST SYN,RST" means "watch TCP flags SYN and RST and
match if out of the watched flags SYN and RST are set". Ok you knew that
already :)

According to RFC793 sending a SYN means "hey guy, I wanna talk to to
you, let's SYNchronize our sequence numbers". The only flag that is
allowed to be sent along with a SYN is ACK, and this only in the 2nd
packet of the 3-way-handshake.

Sending RST means "oohps, there's something wrong, ReSeT the connection".

So, sending SYN in conjunction with RST means, that a connection shall
be opened and aborted at the same time. This is

1.) A violation of RFC793
2.) Absolutely senseless in terms of a real connection

Thus, chances are good that someone is scanning you. Hum, cold coffee too.

nmap doesn't generate this scan, and in fact I don't know which scanner
does. But it is possible to generate these packet with packet injection
tools like nemesis. So it is possible that these packets come to your
firewall (although they shouldn't) and you don't want them to pass.

That's why I probe for this.

Have a nice time,

Joerg


