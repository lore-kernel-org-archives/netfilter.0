From: "Hudson Delbert J Contr 61 CS/SCBN" <Delbert.Hudson@LOSANGELES.AF.MIL>
Subject: RE: Port 25
Date: Tue, 8 Feb 2005 07:32:06 -0800
Message-ID: <186AC876521E0F46BDE77079A6567FD0F0DDA8@la-ncc-ms1nsabb.losangeles.afspc.ds.af.mil>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
To: Jason Opperisano <opie@817west.com>, netfilter@lists.netfilter.org

jason,

afraid i've gotta agree with you on this. i'd take it a step further,
it probably makes the environment more difficult to figure out as the =
RST
would alert me to the fact that i PROBABLY can DOS this guy whereas if i =
get
no response, i'm left to me own devices. every step that makes the life =
of
"UNINVITED GUESTS" harder is worth doing especially if it can be =
accomplished with
LESS effort. good catch here.

jose,
when you get a chance could you post a link to the docs you refer to.

-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org]On Behalf Of Jason
Opperisano
Sent: Tuesday, February 08, 2005 5:16 AM
To: netfilter@lists.netfilter.org
Subject: Re: Port 25


On Tue, 2005-02-08 at 04:32, Jose Maria Lopez wrote:
> I don't have the documentation handy, but it said making just a
> DROP could lead you to being DOS attacked. Have anybody heard
> something about this?

i propose that the exact opposite is true.  why should i make my
firewall undertake the effort of generating a RST packet for every yahoo
on the Internet that wants to scan my IP range for TCP 139, 445, etc.

DROP-ing a packet doesn't take any real effort on the firewall's part;
whereas generating a RST packet adds at least some overhead--which in
the extreme case could be significant.

-j

--
"Here are your messages: 'You have thirty minutes to move your
 car.' 'You have ten minutes to move your car.' 'Your car has been
 impounded.' 'Your car has been crushed into a cube.' 'You have thirty
 minutes to move your cube.'"
	--The Simpsons



