From: "Matt Hellman" <netfilter@taxandfinance.com>
Subject: RE: T-Pot (TCP HoneyPot) idea
Date: Fri, 11 Apr 2003 16:17:38 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000301c3006f$c785cb30$fd0aa8c0@winxp>
References: <Pine.LNX.4.44.0304110041130.17825-100000@Sinister.Com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0304110041130.17825-100000@Sinister.Com>
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
To: waltdnes@waltdnes.org, 'Netfilter list' <netfilter@lists.netfilter.org>

>>> I'm not terribly well versed in the various flag settings=20
>>during session
>>> setup and tear down, however this doesn't seem likely to be=20
>>very effective.
>>> The end result would probably just be a lot more traffic on=20
>>your own little
>>> connection to the Internet.
>>
>>Bandwidth isn't as much of an issue with syn/ack packets as=20
>>is the load on
>>the system. This is why the old synflood was so devastating.
>>
>>>  Or worse, someone could figure out what you're
>>> doing and flood you with SYN packets with spoofed source=20
>>addresses.  It may
>>> not effect the resources on your firewall (assuming your=20
>>not keeping the
>>> connection state) but others sure won't appreciate getting=20
>>a bunch of
>>> SYN-ACK packets from you;)
>>
>>This can already be done. If I fake a SYN packet from you do, say, DNS
>>root server A, you get traffic from root server A. Maybe a=20
>>lot of traffic.

I understand this, but wouldn't getting a single SYN-ACK and 65534 RST's =
(or
none depending on the DNS host) raise less eyebrows than 65535 =
SYN-ACK'S.
What do you mean by "Maybe a lot of traffic"...wouldn't you just get a
single SYN-ACK [and drop the packet] for each spoofed SYN? One of the
significant differences I see in the suggested setup is that your host =
would
send a SYN-ACK for every SYN packet on every port, regardless of whether =
a
service is actually running on that port.

>>It does use more bandwidth as most hosts will reply with an=20
>>RST, so there
>>is inbound and output traffic. How effective this is depends=20
>>on the ratio
>>of bandwidth in control of the attacker to the limits of=20
>>bandwidth that
>>the victim has, and also the capabilities of the intermediate system.


