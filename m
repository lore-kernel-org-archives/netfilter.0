From: "Derick Anderson" <danderson@vikus.com>
Subject: RE: ftp issue cont.
Date: Fri, 12 Aug 2005 13:44:00 -0400
Message-ID: <E656E2CC1C5AEB42ACB00EB83122C7741FCC43@farmer.vikus.com>
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

FTP passive mode creates an entirely new connection for data transfer.
It is not 'related' to the original connection and so iptables doesn't
pick it up as such (nor do any other stateful firewalls that I'm aware
of). The connection works something like this:

1. Client connects to FTP server on port 21 and requests PASV mode.
2. Server replies with the port that client should use (e.g., 50100).
3. Client makes NEW connection on the passive port (50100).
4. Server transfers information using the new connection.

This is why (I think...) stateful firewalls don't pick up passive
connections: they are initiated by the client, not the server.

You know you have to open port 21 and 20 (for non-passive connections)
inbound to your FTP server. I didn't see that in your rules either but
since you can log in to the server, etc. I can only assume it works. You
will have to check your FTP server's documentation on which ports it
uses in PASV (passive) mode. These ports are always above 1023 (1024:).
I will give you an example:

Suppose your FTP server uses ports 50100 to 50200 for passive
connections. You will need to add an iptables rule such as

$IPT -A FORWARD -p tcp -d your.ftp.ip.address --dport 50100:50200 -j
ACCEPT

into your firewall ruleset, assuming your FTP server is not on the
firewall and you've taken care of DNATing. If you want to be lazy you
can always do this:

$IPT -A FORWARD -p tcp -d your.ftp.ip.address --dport 1024: -j ACCEPT

The above rule should work right away, provided the rest of your
firewall is in order. For anything else I suggest reviewing the HOW-TOs
on www.netfilter.org. A google search will probably provide you with the
specific ports for your FTP server, and any server worth the download
will let you change what those ports are.

Hope that helps.

Derick

-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of
varun_saa@vsnl.net
Sent: Friday, August 12, 2005 12:52 PM
To: netfilter@lists.netfilter.org
Subject: ftp issue cont.

Make sure you've opened up whichever unprivileged passive ports your FTP
server uses. Passive FTP connections are seen as new by stateful
firewalls, not related to the original control connection.=20
=20
Derick Anderson =20
=20
Thanks Derick,=20
              But I am not very clear about ftp.=20
So I will appreciate details.=20
=20
Thanks=20
=20
Varun=20



