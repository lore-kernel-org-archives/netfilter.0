From: "Stanislav Puffler DiS." <stanislav.puffler@seznam.cz>
Subject: RE: ping to internet hosta through NameServer of provider
Date: Thu, 11 Mar 2004 08:57:22 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <E1B1L3c-0007eB-0y@vishnu.netfilter.org>
References: <200403101041.03840.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200403101041.03840.Antony@Soft-Solutions.co.uk>
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

Hallo,
have tried this, but don=B4t know exactly what to do, could anyone help =
me
please ? In syslog.conf console output is remarked - not permited I =
think.
And as for --log-level option, don=B4t know how to set up LOG target =
only to
syslog. Thanks...

Stanley

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Antony Stone
Sent: Wednesday, March 10, 2004 11:41 AM
To: netfilter@lists.netfilter.org
Subject: Re: ping to internet hosta through NameServer of provider

On Wednesday 10 March 2004 10:22 am, Stanislav Puffler DiS. wrote:

> Apologize, these are my rulesets. As for pinging internet hosts, it is
> working corectly now (after accepting packets from ISP NameServer).

Good.

> But the only one problem is, that there are still logs in shell prompt =
and
i
> am not typing anything...

I am not sure I understand why this is a problem.   Do you mean you want =
the

logs to go to syslog instead of the console, or do you mean that you =
don't=20
udnerstand why packets are arriving at your firewall and being logged =
when=20
you are not creating them?

If it's the first, then you should investigate the --log-level option to =
the

LOG target, and check your syslog.conf setup.

If it's the second, then the simple answer is that packets are sent to=20
arbitrary addresses around the Internet all the time, and it does not =
take=20
long after plugging a packet logger into a previously unused IP address=20
before you start seeing traffic turn up...

Regards,

Antony.

--=20
The words "e pluribus unum" on the Great Seal of the United States are =
from
a=20
poem by Virgil entitled "Moretum", which is about cheese and garlic =
salad=20
dressing.

                                                     Please reply to the
list;
                                                           please don't =
CC
me.




