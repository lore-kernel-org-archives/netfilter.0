From: "David Leangen" <dleangen@canada.com>
Subject: RE: /etc/sysconfig/iptables does not load on reboot
Date: Sat, 2 Jul 2005 14:49:32 +0900
Message-ID: <NEBBKBPLMLNABNADCIPAOECFBDAB.dleangen@canada.com>
References: <ab5428f705070122446b6f9966@mail.gmail.com>
Reply-To: dleangen@canada.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <ab5428f705070122446b6f9966@mail.gmail.com>
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
To: tahmeed <qs.tahmeed@gmail.com>
Cc: netfilter@lists.netfilter.org


Dear Tahmeed,

Thank you. But that's exactly what I'm doing.

I am absolutely positive that the correct script is saved to
/etc/sysconfig/iptables. I tried with all of the following:

 - iptables-save
 - service iptables save

If I use 'iptables-restore /etc/sysconfic/iptables' after reboot, then the
correct script gets loaded (which also shows that the correct values are in
/etc/sysconfig/iptables).

My init script IS indeed getting run at system startup.


So, what I can't figure out is why the script in /etc/sysconfig/iptables is
not being loaded at system startup.


Any ideas?

Thank you!!




> -----Original Message-----
> From: tahmeed [mailto:qs.tahmeed@gmail.com]
> Sent: 2 July 2005 14:44
> To: dleangen@canada.com
> Cc: netfilter@lists.netfilter.org
> Subject: Re: /etc/sysconfig/iptables does not load on reboot
>
>
> hello David,
>
> after u configure iptables - directly or via a script issue
>
> iptables-save > /etc/sysconfig/iptables
>
> then ur conf will be saved in the mentioned file & be available while
> restarting the service or reboot.
>
> else the system will use the default conf that have been set up during
> the installation of the system.
> and
>
> "iptables-restore" :: resets the conf to the system default which
> means u lost the conf u just did.
>
> thanks.
>
> On 7/2/05, David Leangen <dleangen@canada.com> wrote:
> >
> > Hello!
> >
> > On FC3, my file /etc/sysconfig/iptables is not being loaded on
> reboot. For
> > some reason, my iptables is being loaded with some kind of
> default values.
> >
> > I thought that the file /etc/sysconfig/iptables was supposed to
> be loaded
> > via iptables-restore (and indeed this appears to be so according to the
> > startup script in /etc/rc.d/init.d/iptables). Is there
> something that I am
> > not understanding correctly?
> >
> >
> > Thank you!
> >
> >
> >
>
>
> --
> Happy! If not now never


