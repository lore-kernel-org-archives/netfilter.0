From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: SMTP external
Date: Thu, 2 Jan 2003 20:29:16 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200301022029.16450.netfilter@newkirk.us>
References: <20ED00AA0BC135449469D6EF0AE79C970FAB@ozlan.fcdomain.net> <00c801c2b2b7$23ccf870$6301a8c0@VAIO> <20030102234447.GA11431@miggy.org>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030102234447.GA11431@miggy.org>
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
To: Athan <netfilter@miggy.org>, netfilter@lists.netfilter.org

On Thursday 02 January 2003 06:44 pm, Athan wrote:

> =09iptables -A INPUT -m state --state NEW,ESTABLISHED -p tcp
> =09--sport 25
> =09iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -p tcp
> =09--dport 25
>
> Untested, off the top of my head, but should do the job.
>
> -Ath

Umm, it might help to have a target... adding "-j ACCEPT" perhaps?  :^)=20
Also, since the intent is to let outside clients connect TO port 25, the=20
INPUT rule should use --dport, while the OUTPUT should use --sport.  Of=20
course, if a looser OUTPUT rule already exists (like EST/REL with no=20
protocol specified) then the OUTPUT rule would be redundant anyway. =20
(but would also be a sign that the firewall /could/ be tighter)

 If logging of 'all' access is desired, at least for a test period, I'd=20
suggest logging ONLY state NEW connections in INPUT, to keep from being=20
overwhelmed.  Unless something goes seriously wrong, or you have=20
unsecure rules elsewhere, you will still log each and every IP that=20
tries to connect to port 25, but only once per attempt, instead of once=20
for each packet in 3mb worth of family christmas pictures or such.  (and=20
lord help your logfile if they send it to several family members=20
individually... :^)  It'd probably be a good idea to log port 25 DROPs=20
as well, so you can see if anyone has been poking around.

For individual IP control just redirect all NEW state dport 25 from INPUT=
=20
to a custom chain that has an ACCEPT rule for each client IP, and a DROP=20
at the end.  Obviously this would require either that every client has a=20
static IP, or that you allow ranges of IP's which their dynamic IP is=20
assigned from, and the latter isn't a good idea.  Since you're unlikely=20
to be lucky enough that every client is (and would remain) on a static=20
IP, this probably is pointless.

Finally, and probably most important, go to http://sendmail.net=20
(presuming that's what you'd be running) and download and install latest=20
releases, and read through and follow all their security instructions. =20
Starting with version 8.10 (8.12 is current release) sendmail supports=20
SMTP AUTH - use it.

j



