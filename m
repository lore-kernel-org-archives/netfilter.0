From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: HELP - NetMeeting, H323, 2.4.19pre9 and newnat13
Date: Mon, 3 Jun 2002 11:52:09 +0200 (CEST)
Sender: netfilter-admin@lists.samba.org
Message-ID: <Pine.LNX.4.33.0206031148010.4553-100000@blackhole.kfki.hu>
References: <3CF8DD34.6F5A0B40@attbi.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <3CF8DD34.6F5A0B40@attbi.com>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Robert La Ferla <robertlaferla@attbi.com>
Cc: netfilter@lists.samba.org

On Sat, 1 Jun 2002, Robert La Ferla wrote:

> I am trying to get NetMeeting to work using 2.4.19pre9, newnat13 and
> H323.  I can get a chat and whiteboard connection.  I can occasionally
> hear the other person but not 2-way audio or video.  This seems to be
> worse than my older 2.4.17 configuration with newnat8.

Some bugs have been fixed since then :-).

But seriously, the H.323 (conntrack/nat) helper is based on a crude hack.
It works only in the most simplest cases, when nothing as complicated as
"faststart/H.245 tunnelling", gatekeeper, RAS, etc are involved.

> One thing I noticed is that when I do a lsmod | grep h323, I see:
>
> ip_nat_h323             2576   0  (autoclean) (unused)
> iptable_nat            14672   3  (autoclean) [ipt_MASQUERADE
> ip_nat_h323 ip_nat_ftp]
> ip_conntrack_h323       2352   1  (autoclean)
> ip_conntrack           16176   4  (autoclean) [ipt_MASQUERADE
> ip_nat_h323 ip_nat_ftp ipt_state iptable_nat ip_conntrack_h323
> ip_conntrack_ftp]
>
> Notice that the ip_nat_h323 is unused.  Even if I dial using NetMeeting,
> it remains unused.

The module usage has no relation with the number of the ongoing netmeeting
sessions. "unused" means: "no other module depends on me"

Regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
WWW-Home: http://www.kfki.hu/~kadlec
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary


