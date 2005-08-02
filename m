From: "Piszcz, Justin" <jpiszcz@servervault.com>
Subject: RE: blocking irc + botnets
Date: Tue, 2 Aug 2005 12:37:16 -0400
Message-ID: <F8B974E70BDE1745ABB27AF04788FA00998F5C@mail1.dulles.sv.int>
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
To: hbeaumont hbeaumont <ahlist@gmail.com>, netfilter@lists.netfilter.org

Well to start out, you'd want to block outbound TCP ports 6660-7000,
there are however, some IRC servers that accept connections on weird
ports to bypass firewalls.

-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of hbeaumont
hbeaumont
Sent: Tuesday, August 02, 2005 11:41 AM
To: netfilter@lists.netfilter.org
Subject: blocking irc + botnets

Can anyone help me with the proper method to block outgoing requests to=20
botnets + irc?

Or point me in the direction of searchable list archives (I could only
find=20
the non-searchable archives) or other FAQ that answers this?

Problem:

We have servers that could get infected via poorly wrote user scripts. I

want to prevent these servers from being used as part of botnets or
general=20
connections to=20
IRC (most scripts I run across seem to try to connect to IRC). I want to

take the best preventative measures I can in case one of the machines
would=20
become infected
or otherwise compromised.

Also, interested in any other popular method of stopping general
outgoing=20
DOS attacks (rate limiting UDP perhaps? I'm not real up on the
techniques=20
used by the DOS'ers).

I'm interested in the recommended rules to add to prevent this type of
thing=20
should it occur. Thanks.

