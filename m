From: "Maxime Ducharme" <mducharme@cybergeneration.com>
Subject: Re: blocking irc + botnets
Date: Wed, 3 Aug 2005 12:18:55 -0400
Message-ID: <0fc301c59847$0b719420$b000a8c0@cybergeneration.com>
References: <bc5becf6050802084137a7ad69@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="iso-8859-1"
To: hbeaumont hbeaumont <ahlist@gmail.com>, netfilter@lists.netfilter.org


Hello

i suggest block every outbound ports on your
servers

use ip_conntrack to allow servers to answer ESTABLISHED
connections on your open ports (like 80 for a http server)

botnets or trojan downloaders can simply run on any port

a vulnerable script could be used to run a "wget ..."
command that would use outbound tcp 80, which isnt in
irc's port ranges, thats why you should simply block them all

hth

Maxime Ducharme
Programmeur / Sp=E9cialiste en s=E9curit=E9 r=E9seau


----- Original Message -----=20
From: "hbeaumont hbeaumont" <ahlist@gmail.com>
To: <netfilter@lists.netfilter.org>
Sent: Tuesday, August 02, 2005 11:41 AM
Subject: blocking irc + botnets


Can anyone help me with the proper method to block outgoing requests to
botnets + irc?

Or point me in the direction of searchable list archives (I could only find
the non-searchable archives) or other FAQ that answers this?

Problem:

We have servers that could get infected via poorly wrote user scripts. I
want to prevent these servers from being used as part of botnets or general
connections to
IRC (most scripts I run across seem to try to connect to IRC). I want to
take the best preventative measures I can in case one of the machines would
become infected
or otherwise compromised.

Also, interested in any other popular method of stopping general outgoing
DOS attacks (rate limiting UDP perhaps? I'm not real up on the techniques
used by the DOS'ers).

I'm interested in the recommended rules to add to prevent this type of thing
should it occur. Thanks.


