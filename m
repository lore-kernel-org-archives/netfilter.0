From: "Matt Hellman" <netfilter@taxandfinance.com>
Subject: RE: T-Pot (TCP HoneyPot) idea
Date: Thu, 10 Apr 2003 21:51:10 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000001c2ffd5$35a5a400$fd0aa8c0@winxp>
References: <20030410220741.GA32442@m1800>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030410220741.GA32442@m1800>
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

I'm not terribly well versed in the various flag settings during session
setup and tear down, however this doesn't seem likely to be very effective.
The end result would probably just be a lot more traffic on your own little
connection to the Internet.  Or worse, someone could figure out what you're
doing and flood you with SYN packets with spoofed source addresses.  It may
not effect the resources on your firewall (assuming your not keeping the
connection state) but others sure won't appreciate getting a bunch of
SYN-ACK packets from you;) 

>>-----Original Message-----
>>From: netfilter-admin@lists.netfilter.org 
>>[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of 
>>waltdnes@waltdnes.org
>>Sent: Thursday, April 10, 2003 5:08 PM
>>To: Netfilter list
>>Subject: T-Pot (TCP HoneyPot) idea
>>
>>
>>  I'm sure every here has seens lots of SYN-packets in their logs,
>>trying to connect to various ports they shouldn't be talking to.  I
>>don't run any public servers, and I use passive ftp, so I simply block
>>all connection attempts.  The general procedure is to drop the packet,
>>and ignore it.  What would be the effect of sending back a SYN-ACK
>>packet (and anything else necessary?) to fake the setting up of a
>>connection... and then dropping the packet and ignoring it ?
>>
>>  Would an infected machine scanning the net eventually run into
>>resource limits and DOS itself ?  I'm sure that professional crackers
>>can work around this, but if we can make things a bit more painful for
>>skiddies and automatic worms, then let's do it.
>>
>>  Can such trickery be pulled off with a current bog-standard 
>>iptables,
>>or does someone need to write a new "target"?
>>
>>-- 
>>Walter Dnes <waltdnes@waltdnes.org>
>>An infinite number of monkeys pounding away on keyboards will
>>eventually produce a report showing that Windows is more secure,
>>and has a lower TCO, than linux.
>>


