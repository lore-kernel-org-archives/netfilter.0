From: "Hudson Delbert J Contr 61 CS/SCBN" <Delbert.Hudson@LOSANGELES.AF.MIL>
Subject: RE: IDS better than hardcore iptables rules?
Date: Fri, 4 Feb 2005 08:13:51 -0800
Message-ID: <186AC876521E0F46BDE77079A6567FD0F0DD9E@la-ncc-ms1nsabb.losangeles.afspc.ds.af.mil>
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
To: "R. DuFresne" <dufresne@sysinfo.com>, seberino@spawar.navy.mil
Cc: netfilter@lists.netfilter.org

ron,

i can now die happy as i've finally heard someone echo my sentiments
as regards to 'shortcuts' to eliminate learning the basics of network
environments. its the same malady that many programmers suffer from
as evidenced by the shoddy un checked code that makes its to mkt today.

~go to school


-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org]On Behalf Of R. DuFresne
Sent: Thursday, February 03, 2005 4:32 PM
To: seberino@spawar.navy.mil
Cc: netfilter@lists.netfilter.org
Subject: Re: IDS better than hardcore iptables rules?


On Thu, 3 Feb 2005 seberino@spawar.navy.mil wrote:

> Many people on this list including Jason O. are masters
> at creating very detailed careful iptables rules that
> DROP packets that have anything peculiar about them.
>=20
> (e.g. FIN without ACK, etc.)
>=20
> My iptables script just filters based on port
> number and protocol.  I was wondering if instead
> of diving into TCP education to duplicate the
> fine work Jason and others have done,
> if an IDS (Intrusion Detection System)
> like Snort would serve the same purpose???
>=20
> I assume Snort **ALSO** knows what TCP flag combos
> typically signify a port scan and other nasties?
>=20

And there are many that have delved into combining the two applications =
to
work together, but, IDS is a beat unto itself, takes perhaps a bit more
thought and work just to tune the IDS *behind* the firewall to get the
proper set of true alarms working such that it's not just another =
whining
app that gets ignored pretty much as much as most system logs tend to =
be.

And TCP education is require as much for IDS setup and design as proper
firewalling.  There are no shortcuts, one needs to gain the basic
knowledge levels to tackle more then the basics of network design as in
any other venture one wishes to put their efforts into.  Afterall, there
were no real cheap shortcuts to your phd, correct?

Thanks,

Ron DuFresne
--=20
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        admin & senior security consultant:  sysinfo.com
                        http://sysinfo.com

...Love is the ultimate outlaw.  It just won't adhere to rules.
The most any of us can do is sign on as it's accomplice.  Instead
of vowing to honor and obey, maybe we should swear to aid and abet.
That would mean that security is out of the question.  The words
"make" and "stay" become inappropriate.  My love for you has no
strings attached.  I love you for free...
                        -Tom Robins <Still Life With Woodpecker>



