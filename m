From: hbeaumont hbeaumont <ahlist@gmail.com>
Subject: blocking irc + botnets
Date: Tue, 2 Aug 2005 10:41:14 -0500
Message-ID: <bc5becf6050802084137a7ad69@mail.gmail.com>
Reply-To: hbeaumont hbeaumont <ahlist@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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

Can anyone help me with the proper method to block outgoing requests to=20
botnets + irc?

Or point me in the direction of searchable list archives (I could only find=
=20
the non-searchable archives) or other FAQ that answers this?

Problem:

We have servers that could get infected via poorly wrote user scripts. I=20
want to prevent these servers from being used as part of botnets or general=
=20
connections to=20
IRC (most scripts I run across seem to try to connect to IRC). I want to=20
take the best preventative measures I can in case one of the machines would=
=20
become infected
or otherwise compromised.

Also, interested in any other popular method of stopping general outgoing=
=20
DOS attacks (rate limiting UDP perhaps? I'm not real up on the techniques=
=20
used by the DOS'ers).

I'm interested in the recommended rules to add to prevent this type of thin=
g=20
should it occur. Thanks.
