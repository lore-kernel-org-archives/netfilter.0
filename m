From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: sugestion needed for session marking from different default
	routres
Date: Wed, 01 Oct 2003 13:06:14 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1065006374.870.59.camel@elendil.intranet.cartel-securite.net>
References: <34887.212.202.127.214.1065004876.squirrel@knex.zedx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <34887.212.202.127.214.1065004876.squirrel@knex.zedx.net>
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
To: axel@zedx.org
Cc: netfilter@lists.netfilter.org

Le mer 01/10/2003 =E0 12:41, Axel Christiansen a =E9crit :
[...]
> Now, ssh from inet on the DSL line works fine. The
> Pakets get back the right way by the active default
> route. I also want to ssh in over the other interface,
> and want the packets back in that line.
> I am thinking about marking the incoming packets and
> then finding out about the returning packets some how.
> If this would work, the routing then can by done by
> ip rule (routing).

You must have a look to CONNMARK target and connmark match that stands
in pom extra section :

http://www.netfilter.org/documentation/pomlist/pom-extra.html#CONNMARK

---
This patch adds per connection marks, and a target (CONNMARK)
respective a match (connmark) for using these.

Usage:

   connmark
       This  module  matches  the netfilter mark field associated
       with a connection (which can be  set  using  the  CONNMARK
       target below).

       --mark value[/mask]
              Matches  packets  in  connections  with  the  given
              unsigned mark value (if a mask is  specified,  this
              is logically ANDed with the mark before the compar=AD
              ison).


   CONNMARK
       This  is  used  to set the netfilter mark value associated
       with the connection

       --set-mark mark
              Set connection mark

       --save-mark
              Set connection mark to the same as the one  on  the
              packet

       --restore-mark
              Set  the  netfilter  packet  mark  value to the one
              associated with the connection. This is only  valid
              in the mangle table.
---

That means you can affect different marks to SSH sessions depending on
what interface they come in. This mark will get restored on replies you
generate for they will get flaged as ESTABLISED by conntrack engine.

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE

