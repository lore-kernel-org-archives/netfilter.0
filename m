From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: what filtering to do on the OUTPUT chain?
Date: 23 Oct 2002 08:51:53 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1035355913.20496.19.camel@elendil>
References: <1035317344.8858.14.camel@elendil>
	<Pine.LNX.4.44.0210221605170.15445-100000@localhost.localdomain> 
	<20021023003146.D8681@funkyjesus.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20021023003146.D8681@funkyjesus.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: Nick Drage <nickd@funkyjesus.org>
Cc: netfilter mailing list <netfilter@lists.netfilter.org>

Le mer 23/10/2002 =E0 01:31, Nick Drage a =E9crit :
> "--cmd-owner" is your friend, your close, personal, bestest friend.

--cmd-owner is, imho, not usable on its own for filtering purposes, such
as application based filtering.

I'll try to show why :

root@elendil:~# iptables -A OUTPUT -m owner --cmd-owner "nc" -j REJECT

So I should not be able to execute a netcat. I use a REJECT rule to give
a simple example.

cbr@elendil:~$ nc 192.168.1.10 22
(UNKNOWN) [192.168.1.10] 22 (ssh) : Connection refused

Fine. That's what I wanted.

cbr@elendil:~$ ln -s /bin/nc toto
cbr@elendil:~$ ./toto 192.168.1.10 22
SSH-2.0-Feydreiva SSH daemon

Well, a bit tricky... If you investigate a bit more and set a DROP
policy up with only allowed application, you'll discover you just can't
specify a command path, only a command name. That means if you allow
"ping" command, any command named ping will do the trick, would it be a
symlink named "ping" to another command or a binary named "ping". So, if
you want to do it well, you have to restrict your filesystem, forbiding
users to write in order to prevent them to create another "ping".

So --cmd-owner becomes useful when used with other matches, to restrict
ping command to ICMP echo requests as an exemple :

iptables -A OUTPUT -m owner --cmd-owner "ping" -m state --state NEW \
	-p icmp --icmp-type echo-request -j ACCEPT

Solution would be to match commands not on name, but on the exact binary
location (inode number, device number), but it is far out of my skills
to implement this. Moreover, it could affect performance (but you can
reduce it well using state match and only filter NEW packets using this
stuff).

By the way, owner match is very useful to me, especially --uid-owner and
--gid-owner.

--=20
C=E9dric Blancher  <blancher@cartel-securite.fr>
IT systems and networks security expert  - Cartel S=E9curit=E9
Phone : +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE

