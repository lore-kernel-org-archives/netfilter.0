From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: Nat with a dynamic IP
Date: Fri, 5 Sep 2003 10:16:41 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF52E367E@alderaan.smgtec.com>
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
Content-Type: text/plain; charset="us-ascii"
To: Ramin Dousti <ramin@cannon.eng.us.uu.net>, Peter Marshall <peter.marshall@caris.com>
Cc: Thorsten Scherf <tscherf@web.de>, netfilter@lists.netfilter.org

Damn, guys, if you could set me up with a fantastic script that can do
multiple DHCP subscriptions on a single NIC, I could throw away my all
4-port NIC's. I'll hear offers for the cards 'after' I get this script
:-)



-----Original Message-----
From: Ramin Dousti [mailto:ramin@cannon.eng.us.uu.net]=20
Sent: Friday, September 05, 2003 10:11 AM
To: Peter Marshall
Cc: Thorsten Scherf; netfilter@lists.netfilter.org
Subject: Re: Nat with a dynamic IP

On Fri, Sep 05, 2003 at 11:36:09AM -0300, Peter Marshall wrote:

> That is a pretty good solution for the SNAT.  I never thought about
MASQ.
> However .... I am not sure if the DNAT is the best solution ....  WHat
if
> you had multiple ip numbers on the external card ....

and they're all dynamic? Give us an example...

Ramin

> More importantly, what about trying to connect directly to the
firewall from
> an external address.


