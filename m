From: Chris Brenton <cbrenton@chrisbrenton.org>
Subject: Re: providing partial access to iptables for non root user
Date: Mon, 21 Feb 2005 08:38:44 -0500
Message-ID: <1108993123.2238.90.camel@grendel>
References: <4219C6F1.2070500@juergens.name>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <4219C6F1.2070500@juergens.name>
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
To: Michael =?ISO-8859-1?Q?J=FCrgens?= <netfilter@juergens.name>
Cc: netfilter <netfilter@lists.netfilter.org>

On Mon, 2005-02-21 at 06:33, Michael J=FCrgens wrote:
>=20
> I=B4m looking for a solution to provide a non root user write access to=
 a=20
> chain.

I've written up some stuff using sudo in order to create an auditing
trail. You can read about it here:

http://www.loganalysis.org/sections/parsing/application-specific/firewall=
-logging.html#iptables

> his special case I have to provide the a mechanism to block some ip=20
> adresses to connect to http.
> But this should be done by a non root user. The non root user should no=
t=20
> change any other rule.

The problem is you can not set permissions to different iptables
switches. So granting a person access to the binary implies they will be
able to do pretty much anything they want.

You might be able to create a front end that accepts just an IP address,
and then the back end fills out the rest of the command, but you would
need really good data scrubbing to ensure that only IP addresses are
accepted, not command line switches. You would also need to ensure that
the user does not have direct access to the binary.

HTH,
Chris



