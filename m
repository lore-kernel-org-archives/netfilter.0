From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: Problems with firewall and emule
Date: Wed, 2 Apr 2003 15:49:26 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200304021549.26475.netfilter@newkirk.us>
References: <200304021705.07896.carlosble@terra.es>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200304021705.07896.carlosble@terra.es>
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
To: carlosble@terra.es, netfilter@lists.netfilter.org

On Wednesday 02 April 2003 11:05 am, Carlos Ble wrote:
> Hi all. Some users from my lan complains to me about emule.
> They have a LOWID and can't use their machines as emule servers.
> I had checked my firewall and i think all its ok. I went to
> http://www.thedonkeynetwork.com/connection_test
> from one computer of the lan to test my conection (using even port 80)
> and i got a time out message "time out, this means that even did not
> receibe a RESET signal; maybe due to a stealth firewal". But.... the
> http port is open because iam browsing !!!.  Needs emule a special
> conntrack ?. I dont know so much about emule, can somebody help me
> please? Thanks in advance.

EDonkey2000 (emule is a 3rd-party replacement for EDonkey, as is=20
MLDonkey) communicates primarily on TCP 4662.  The problem you are=20
facing is that when they connect to a server somewhere, that server will=20
attempt to connect back to them at port 4662, initiating a NEW=20
connection.  This means connecting to the public IP they appear to be=20
at, and if you are masquerading several emule/edonkey users then they=20
all have the same public IP.  Any attempt from outside to connect to one=20
of these machines as a peer or a server will necessarily be a NEW=20
connection, so conntrack cannot know which local machine is the=20
destination.  If only one machine is running, you could DNAT incoming=20
connections from the internet for tcp dport 4662 to that specific client=20
and they would get a HighID.

(From a page I'm writing on IM and P2P netfilter issues)

TCP 4661 - connect to server=20
TCP 4662 - connect to client=20
TCP 4663 - connect remote GUI to client=20
UDP 4665 - connect to secondary server=20

The only critical port here for incoming connections is 4662, unless they=
=20
are /really/ running an EDonkey server, in which case they need 4661=20
incoming as well.  For 'normal' p2p file sharing with EDonkey (emule)=20
the client needs 4661 and 4662 outbound, and 4662 inbound.

The upshot is that I believe you will only be able to have a single=20
emule/edonkey machine behind a single public IP.  Try adding:
iptables -t nat -A PREROUTING -p tcp --dport 4662 -j DNAT --to {ip}
for one of the emule users, and make sure you ACCEPT that traffic in=20
FORWARD.  That user should now get a HighID, and favorable searches and=20
transfers.  It is possible that this will allow the others to get=20
HighID's as well, but only the one that is the target of the DNAT would=20
be able to actually serve files, since external queries would never=20
reach the others.  I'm not certain if the extra machines would even be=20
able to receive files, I don't know the EDonkey/Overnet (Overnet is a=20
newer completely 'serverless' variant, communicating on TCP port 4662=20
and an additional random [or manually configured] UDP port) protocols=20
well enough to know if that comes through as a NEW connection or simply=20
a reply to one initiated by the internal client.  I suspect that only=20
the DNAT targetted machine would work properly.

Finally, if you really want to accomodate these users, you can set up a=20
specific machine as the EDonkey server, running the Linux EDonkey client=20
software, DNAT outside connections to that machine, and allow each of=20
them remote GUI access to that client.  They would each have knowledge=20
of and control over each other's transfers, however, which might be=20
undesirable to them...  ;^)

j


