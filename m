From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: How to disable ip_contrack_irc when its compiled into the kernel?
Date: Fri, 27 Dec 2002 18:26:30 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200212271826.30883.Alistair@nerdnet.ca>
References: <1041008143.15849.81.camel@fish-dt.dmz.dynam.ac>
Reply-To: Alistair@nerdnet.ca
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1041008143.15849.81.camel@fish-dt.dmz.dynam.ac>
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
To: Justin Hammond <fish@dynam.ac>, netfilter@lists.netfilter.org


=09This error is caused when the connection inside the firewall is using=20
=09its outside IP address, which is NOT what irc-conntract/irc-nat=20
=09expects to see. =20

=09This error is more commonly seen when a client inside a firewall is=20
attempting to DCC connect to a client outside the firewall, and the clien=
t
=09is using the IP address of the outside of the firewall  ... how this=20
=09can be cured in a *server* I'm not sure, not running any of the server=
s,
=09but with the MIRC client you tell the client to "Use Local IP" rather =
than
=09"Use IP from Server" (Its been a while...) given that this is a server=
=20
=09inside your firewall --- I'd suspect that similar rules for NATting an=
d
=09DENATting the connection exist and you need to tell the server to use
=09its local IP rather than the internet IP address on the outside of the
=09firewall....

=09Alistair


On December 27, 2002 11:55 am, Justin Hammond wrote:
> Hi all
>
> We have a problem on one of our servers. Its running:
>
> Linux 2.4.17 on a Sparc Box with IPtables 1.2.4
>
> The Kernel support for IPtables was compiled into the kernel, not as
> loadable modules, and now we have some problems.
>
> We recently setup a IRC server for a customer, and they came back and
> told us that DCC sending was not working for any client connected to
> this IRC server. A quick check of the logs revealed:
>
> Forged DCC command from 218.103.157.103: 1.154.254.169:0
> Forged DCC command from 218.103.157.103: 1.154.254.169:0
> Forged DCC command from 218.103.157.103: 1.154.254.169:0
> Forged DCC command from 218.103.157.103: 1.154.254.169:0
>
>
> Throughout the entire kernel log.
>
> (I believe the problem has been fixed in later releases of iptables, so
> I'm not after a fix)
>
> Now here is my problem. The Server is in Sydney, Australia, and I'm in
> Singapore, around 8000Miles away, so doing a remote kernel compile and
> reboot to remove the contrack_irc module is not something that I fancy.
>
> I'm wondering if there is a Rule or way that I can disable the contrack
> module from operating?
>
> Thanks :)
>
> Justin

