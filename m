From: <bmcdowell@coxhealthplans.com>
Subject: RE: TARPIT target
Date: Tue, 30 Sep 2003 08:58:25 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7A3B4AA360FDEF448F3390421FC8D731F4143D@coxhpexg.coxhp.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: netfilter@lists.netfilter.org


Well, I've gotten mixed results.  I did get the TARPIT target to work, =
but cannot for the life of me get 'nth' to work also.  It shows up as an =
option in the kernel config, but the libipt_nth.so is never created.  I =
can see a libipt_nth.h in the source, but that's as close as it gets.

One thing that gives me pause is that I am using 1.2.8, and not 1.2.7a.  =
There are two reasons why I think this may be important.  First, the pom =
is older than the iptables version I am using.  Second, libipt_TARPIT.c =
and libipt_TARPIT.d are both found in the source for iptables 1.2.8.  =
Does this not mean that TARPIT is included at least as an option in =
1.2.8?  Of course, if it is, I can't seem to get it to show up in the =
kernel menu...

Please forgive any ignorance on my part...

Thanks,

Bob

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Cedric Blancher
Sent: Friday, September 26, 2003 4:32 PM
To: Bob McDowell
Cc: netfilter@lists.netfilter.org
Subject: Re: TARPIT target


Le ven 26/09/2003 =E0 22:45, bmcdowell@coxhealthplans.com a =E9crit :
> How do I use the TARPIT target?
> I have iptables 1.2.8 installed and working otherwise.  I'm running =
RedHat 9.
> When I try and use
> 	'iptables -A FORWARD -j TARPIT'
> I get
> 	'iptables: No chain/target/match by that name'

Your kernel does not support TARPIT.

> I have rebuilt the kernel, but I do not see an option for 'TARPIT'
> anywhere in the netfilter stuff.  Yes, I do have 'experimental' turned
> on.  I have also deleted iptables completely and used only the source
> to install it.

TARPIT target is in patch-o-matic (extra section). So you have to
download and install it.

	1. install patch-o-matic (see README)
	2. rebuild your kernel from sources that got patched
	3. build iptables

And it should work.

Not that TARPIT only applies to TCP connections. So your previously
given command won't work :

	cbr@elendil:~$ sudo iptables -A FORWARD -j TARPIT
	iptables: Invalid argument

You have to specify TCP matching :

	cbr@elendil:~$ sudo iptables -A FORWARD -p tcp -j TARPIT
	cbr@elendil:~$ sudo iptables -L FORWARD
	Chain FORWARD (policy ACCEPT)
	target     prot opt source               destination
	TARPIT     tcp  --  anywhere             anywhere

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: =
FA62226DA9E72FA8AECAA240008B480E157E98EE

