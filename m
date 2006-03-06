From: "Derick Anderson" <danderson@vikus.com>
Subject: RE: Connection not recognized as RELATED
Date: Mon, 6 Mar 2006 10:38:30 -0500
Message-ID: <FAC4E024BF776842876169173CE2F0132CBCB8@mailbox.vikus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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

=20

> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org=20
> [mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of=20
> Richard Simon
> Sent: Friday, March 03, 2006 10:48 AM
> To: ludi; netfilter@lists.netfilter.org
> Subject: RE: Connection not recognized as RELATED
>=20
> I dont think you looked at my configuration included in the message.
> I have those modules loaded (as you can see from my lsmod=20
> output) and I have ftp working on port 21 (which you can=20
> infer from my DNAT rule).
> I'm just not getting the conntrack to recognize the SYN for=20
> the passive connection to be RELATED.
>=20
> anyone else have a guess?
>=20
> Richard Simon
> Giant Killer Robots
> 361 Brannan St.
> San Francisco, CA 94107
> (415) 777-2477
>=20

I would start by filtering in the filter table. These rules

-A PREROUTING -d 77.77.77.4 -i eth2 -p tcp -m tcp --sport 1024:65535
--dport 21 -j DNAT --to-destination 192.168.4.101:21
-A FORWARD -d 192.168.4.101 -i eth2 -o eth0 -p tcp -m tcp --sport
1024:65535 --dport 21 -m state --state NEW -j ACCEPT=20

should be

-A PREROUTING -d 77.77.77.4 -i eth2 -j DNAT --to-destination
192.168.4.101
-A FORWARD -p tcp -d 192.168.4.101 -i eth2 -o eth0 -p tcp -m tcp --dport
21 -m state --state NEW  -j ACCEPT

There is no need to filter twice and conntrack makes unprivileged source
port filtering unnecessary. Also, filtering in nat is a bad idea, for
reasons that are explained somewhere in the archive but if memory serves
only the first packet in a connection which is matched by a nat rule
actually passes through the nat table.

Hope that helps. If not, you can always open up the destination ports
for the passive range on your FTP server. Also, if you use FTPS (over
SSL) conntrack can't see the PASV port request and won't have a clue
what to do, so you have to open those ports anyway.

Derick Anderson

