From: =?koi8-r?Q?=22?=Vladimir Potapov=?koi8-r?Q?=22=20?=<varyag18@mail.ru>
Subject: Re[2]: iptables ceases to work after night
Date: Thu, 11 Sep 2003 14:28:18 +0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <E19xOgU-000D0o-00.varyag18-mail-ru@f17.mail.ru>
References: <16770b1670ae.1670ae16770b@tm.net.my>
Reply-To: =?koi8-r?Q?=22?=Vladimir Potapov=?koi8-r?Q?=22=20?=<varyag18@mail.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <16770b1670ae.1670ae16770b@tm.net.my>
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
To: kluivert@tm.net.my
Cc: netfilter@lists.netfilter.org


It's interesting idea.What can be still problems?

-----Original Message-----
From: kluivert@tm.net.my
To: varyag18@mail.ru
Date: Thu, 11 Sep 2003 15:46:56 +0800
Subject: Re: iptables ceases to work after night

> 
> > Yesterday at evening my packet filter with iptables worked 
> > fine.Today at morning , I see that he don't forwarding packet from 
> > DMZ to local and back.And this thing I see every morning.After I 
> > reboot my machine it's work fine.I think that my 3com cards have 
> > some bugs.In log there no entries about this . My rules is:
> 
> Check your cron jobs, maybe something is resetting some parameters back 
> to the defaults in the early hours of the morning.
> 
> 

