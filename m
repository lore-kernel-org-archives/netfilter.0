From: Florian Boelstler <euphoria@web.de>
Subject: IRC connection tracking
Date: Wed, 30 Jun 2004 20:53:47 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40E30C3B.8030804@web.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

this is a slightly modified repost of a former message [1].
Unfortunately I didn't got any replies so far.
I hope someone can help me out this time :)

I was looking for a solution to catch "DCC send"-messages (incoming DCC
sessions) by a 'default rule' (states RELATED, ESTABLISHED).
My security policy, and I think the most ones out there, do not allow
unrestricted outgoing connections. That's why a default rule is necessary.

The maintainer of the connection tracking module told us that this
is a known restriction of the irc_connection_tracking module.
At that time (kernel 2.4.18) someone wrote a patch [2] for
ip_conntrack_irc.c. This patch applied, "DCC send"-messages  were
treated by the stateful inspection of netfilter and thus accepted as a
new outgoing connection.

Sometime durng development of 2.4.x kernel the code of
irc_connection_tracking changed and the patch doesn't work anymore.
It is not just shifted lines, etc. The design changed at all.
The 2.4.18 patch is not hard to understand, just some simple additions.

I was looking at the code of 2.4.24 and 2.6.x later on.
I tried to adapt the patch but the code is very different and I
obviously do not have enough knowledge about Linux network architecture
to solve that problem. :)

So I was wondering whether some of you are also interested in such a
patch. Probably there are some guys out there who can solve the problem
in five minutes. :)
I would like to share what I know, and we could solve it together.

Harald, what do you think? :)

Cheers,

  Florian


[1] http://lists.netfilter.org/pipermail/netfilter/2004-June/053193.html
[2]
http://lists.netfilter.org/pipermail/netfilter-devel/2002-July/008665.html



...............................

Someone on the net said:
Hallelujah! The Moderators are double teaming 'em!
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Using GnuPG with Debian - http://enigmail.mozdev.org

iD8DBQFA4ww7wT2gPfZm6tURAiOSAKCA6h7gy/rRIE/PEACLWL/TgKL2iACfYJkl
Lg7DEA81RTMFdBxq8BTWopU=
=mGNg
-----END PGP SIGNATURE-----

