From: "curby ." <curby.public@gmail.com>
Subject: Re: /etc/sysconfig/iptables does not load on reboot
Date: Sat, 9 Jul 2005 20:40:09 -0600
Message-ID: <5d2f37910507091940101bfd5a@mail.gmail.com>
References: <NEBBKBPLMLNABNADCIPAGEGMBDAB.dleangen@canada.com>
	<NEBBKBPLMLNABNADCIPAAEEJBEAB.dleangen@canada.com>
Reply-To: "curby ." <curby.public@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <NEBBKBPLMLNABNADCIPAAEEJBEAB.dleangen@canada.com>
Content-Disposition: inline
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
To: dleangen@canada.com
Cc: netfilter@lists.netfilter.org

On 7/9/05, David Leangen <dleangen@canada.com> wrote:
> This happens after having run adsl-setup.

What is adsl-setup doing for you? Are you using an internal dsl modem,
or is it external/usb or external/cat5?  Especially if you use a
network cable to connect to an external DSL modem, you should be able
to configure your network card directly using ifconfig or
/etc/sysconfig thus getting rid of the need for adsl-setup at all.

That said, it would be nice to figure out why this is causing a
conflict.  Perhaps Fedora experts would understand what exactly
adsl-setup is doing, and/or why it would be conflicting with the
reload of iptables rules.

