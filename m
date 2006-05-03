From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: about dettecting different TTL value
Date: Wed, 03 May 2006 09:32:26 +0200
Message-ID: <1146641546.28003.20.camel@anduril.intranet.cartel-securite.net>
References: <1154.202.22.193.97.1146631315.squirrel@202.22.193.97>
	<44583D20.6010703@inxsoft.net>
	<1146634258.4841.19.camel@anduril.intranet.cartel-securite.net>
	<4458454C.9080705@inxsoft.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4458454C.9080705@inxsoft.net>
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
To: Thomas Kuiper <tkuiper-netfilter@inxsoft.net>
Cc: netfilter@lists.netfilter.org

Le mercredi 03 mai 2006 =E0 13:53 +0800, Thomas Kuiper a =E9crit :
> ISP's that filter are bad

Agree. And thoses who are trying to prevent people from sharing their
connection as well. But nevermind, such dinosaurs will extinguish by
themselves. In France for instance, thoses who have been trying to
enforce that have seen there clients leave for other ISP, so they had to
stop and most actually droped the "sharing not allowed" clause from
their contracts. Most of them even encourage that now :)

> and ethernet isn't really designed to be secure for that.

Link layer is not designed to be secure in any mean.

> But thats wasn't question here. Whats your solution?

Imho, ISP should not bother with how many hosts are behind a link.
People won't subscribe 2 lines because they got 2 laptops at home :)
Now, there's still something obscur to me behind OP question. What are
we talking about ? People using a soho router so they can share their
connection (I think it is the point, as TTL is discussed) ? People
trying to get multiple IPs for multiple hosts from the same modem (case
where we'll see different MAC addresses) ?

First situation, no solution. But is there a point in trying to prevent
this ? Connection sharing is imho something so well accepted nowadays...
Traffic emitted is in complete user control so they can tweak any header
field or parameter they want to fool ISP tracking. In particular, stuff
like OpenBSD pf scrub[1] optionaly associated with modulate[2] (I don't
see someone trying to figure out ISN generator class to spot multiple
hosts though). A bit sad we do not have such things in Netfilter. BTW...

Second situation, there are solutions. One deployed is PPPoE links, even
for cable modems. If users have to set a PPP links, then you can
restrict a given login to one tunnel at the same time, you can restrict
one modem to establish one tunnel at the same time, you can attach BPF
filter to you PPP link (to enforce source IP as an example), etc.


[1] http://www.openbsd.org/faq/pf/scrub.html
[2] http://www.openbsd.org/faq/pf/filter.html#state

--=20
http://sid.rstack.org/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

