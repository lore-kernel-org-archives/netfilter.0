From: kilobug@freesurf.fr (=?iso-8859-1?q?Ga=EBl?= Le Mignot)
Subject: Re: Nobody can help me ???   :(
Date: Mon, 30 Sep 2002 11:30:18 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <plopm3ptuvomdx.fsf@drizzt.dyndns.org>
References: <20020930082725.79600.qmail@web40007.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20020930082725.79600.qmail@web40007.mail.yahoo.com> ("Hanz
 F."'s message of "Mon, 30 Sep 2002 01:27:25 -0700 (PDT)")
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
To: "Hanz F." <hanz852@yahoo.com>
Cc: netfilter@lists.netfilter.org


Mon, 30 Sep 2002 01:27:25 -0700 (PDT), tu as dit : 

 > HI
 > I've posted an email asking for help, but got no
 > answer !! Isn't this mailing list usefull for new
 > members or what ??
 > All I need is to run all kind of softwares (IRC, ICQ,
 > yahoo messenger ,.....) through Netfilter , isn't that
 > possible ???

for IRC, you can use the IRC protocol helper (modprobe ip_conntrack_irc and
modprobe ip_nat_irc if you do NAT too).

For others, you'll have to find a protocol helper, which is not included
in the "standard" kernels (I'm not even sure they exist).

But I use ICQ through a netfilter-powered gateway that does NAT and 
firewalling, and it seems to work

-- 
Gael Le Mignot "Kilobug" - kilobug@freesurf.fr - http://kilobug.free.fr
GSM         : 06.71.47.18.22 (in France)   ICQ UIN   : 7299959
Fingerprint : 1F2C 9804 7505 79DF 95E6 7323 B66B F67B 7103 C5DA

Member of HurdFr: http://hurdfr.org - The GNU Hurd: http://hurd.gnu.org

