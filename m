From: "Christian H. Kuhn" <qno-netfilter@qno.de>
Subject: Re: H.323 masquerading
Date: Sun, 13 Oct 2002 17:59:26 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021013155926.GF627@qno.de>
References: <20021011161234.GR10468@qno.de> <20021013094041.17979.qmail@web40306.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20021013094041.17979.qmail@web40306.mail.yahoo.com>
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
Content-Transfer-Encoding: 7bit
To: Netfilter Mailing List <netfilter@lists.samba.org>

Hallo Kevin,

& Kevin McConnell <kevymac@yahoo.com> [2002-10-13 16:02]:
> > http, ftp, icq, ... are working. When trying
> > NetMeeting, i can log
> > onto an ils server. When connecting to other people,
> > i see in
> > /var/log/syslog:
> > 
> > Oct 11 17:12:40 ns kernel: ASSERT
> > ip_conntrack_core.c:94 &ip_conntrack_lock_R71150de5
> > readlocked
> > Oct 11 17:12:40 ns kernel: ASSERT ip_nat_core.c:739
> > &ip_conntrack_lock not readlocked
> > Oct 11 17:12:40 ns kernel: ASSERT ip_nat_core.c:739
> > &ip_conntrack_lock not readlocked
> > Oct 11 17:12:40 ns kernel: ASSERT: ip_nat_core.c:839
> > &ip_conntrack_lock not readlocked
> > 
> > repeated ad infinitum. I can connect and chat, but
> > no
> > video/audio. Other people cannot call me.
> 
> I believe that the reason everything else is working
> and not the H.323 stuff is because you need a seperate
> patch. There is an experimental patch that allows you
> to do this in the patch-o-matic system located in
> patch-o-matic-20020825/extra/h323* 

Ok, i recompiled the kernel (unpacking in a new directory) with the
p-o-m, using pending and additionally extra/h323*. Audio/Video is
enabled, but my ILS entry cannot be called.

Kind regards,
Chris
-- 
http://www.qno.de
ICQ 57840861

