From: "Sietse van Zanen" <sietse@wizdom.nu>
Subject: RE: Preventing port scanning using iptables ?
Date: Sat, 5 Aug 2006 15:41:34 +0200
Message-ID: <02BB8A4AC86C564C89C7F14CF98CE0C40127F4@knowledge.wizdom.nu>
References: <20060805062309.43523.qmail@web56213.mail.re3.yahoo.com>
	<44D4456C.5050203@mymail.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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
To: Ruprecht Helms <rhelms@mymail.ch>, Elvir Kuric <omasnjak@yahoo.com>
Cc: netfilter@lists.netfilter.org

If you set the policy of the INPUT and FORWARD chains to DROP and only =
allow connection to ports you need from IP's that need to access these =
ports, you're automagically protected against portscans. Iptables will =
drop all connections to ports you have not opened, and the scanner will =
not know anything about them. Any ports you have opened will be visible =
to scanners ofcourse.
=20
-Sietse

________________________________

From: netfilter-bounces@lists.netfilter.org on behalf of Ruprecht Helms
Sent: Sat 05-Aug-06 9:14
To: Elvir Kuric
Cc: netfilter@lists.netfilter.org
Subject: Re: Preventing port scanning using iptables ?



Elvir Kuric schrieb:
> Hi all,
>  I am trying to implement proper firewall to my
> network using iptables
> and I  have to admit that I am amazing by amount of
> iptables features
> it offers.
>  But I can not understand is there any way to prevent
> port scanning
> using iptables?

Yes by checking the tcp-flags. The connections are not established
because only the port is checked if it is reachabele.

Regards,
Ruprecht

-------------------------------------------------------------------
Ruprecht Helms IT-Service & Softwareentwicklung
             let worktools be individual

Web: http://www.rheyn.de <http://www.rheyn.de/>=20




