From: "T. Take" <t_takejp@hotmail.com>
Subject: Re: ULOG: invalid argument
Date: Sat, 06 Mar 2004 19:25:21 +0900
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <BAY15-F33RUm6ttWN6G000566da@hotmail.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-2022-jp"; format="flowed"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi. Thank you for your answers.

On Fri, 5 Mar 2004, Michelle Konzack wrote:
>
> > Am 2004-03-05 18:51:06, schrieb Jozsef Kadlecsik:
> > >On Fri, 5 Mar 2004, Michelle Konzack wrote:
> > >
> > >> >> # iptables: Invalid argment (the same error)
> > >> >
> > >> >Please make sure there is no iptables binary from your distribution 
which
> > >> >precedes in PATH the iptables binary installed from source.
> > >                        ^^^^^^^^^^^^^^^
> > >> This is not possibel, because he use the Debian nativ-system.
> > >> ...he has not written that he has used
> > >> apt-get install ulogd
> > >                  ^^^^^
> >
> > False, you have overread the line above...
> > He has done an
> >
> > apt-get build-dep ulogd
> > apt-get -b source ulogd
> >
> > which I was talking about. The 'iptables' from WOODY are working fine
>
>Please, an error message returned by iptables has nothing to do with the
>ulog daemon, let it run on the system at all or not.
>
>Best regards,
>Jozsef

I didn't write about installing ulogd, but I have done it.

#apt-get build-dep ulogd
#apt-get -b source ulogd
#dpkg -i ulogd-1.0.2.deb
(sometimes i used "-f" option.)

And then, I have installed iptable-1.2.9 in the same way.
(I checked the messages by "#iptables -V" and "#ulogd -V", and they are 
1.2.9 and 1.0.2)

In other words, maybe i succeded the version up of ulogd and iptables. But 
I cannot use ULOG
target.

Best regards,
T.Take

_________________________________________________________________
友達と24時間ホットライン「MSN メッセンジャー」、今すぐダウンロード！  
http://messenger.msn.co.jp 


