From: "Joffer" <joffer@online.no>
Subject: Re: HELP - NetMeeting, H323, 2.4.19pre9 and newnat13
Date: Mon, 3 Jun 2002 22:12:11 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <000901c20b3b$5c1967a0$140a0a0a@joffer.net>
References: <Pine.LNX.4.33.0206031148010.4553-100000@blackhole.kfki.hu> <3CFB9535.4020308@attbi.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Robert La Ferla <robertlaferla@attbi.com>, Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@lists.samba.org

It works fine for me. 2.4.19-pre9 and iptables-CVS-2002-05-28

did you load
modprobe ip_conntrack_h323
modprobe ip_nat_h323

I'm allowing all traffic originating from my Lan out on the internet, and I
can connect with video/audio to other netmeeting users, at least those with
an ordinary ip adress; this means I haven't tried to connect to anyone who
has been NAT'ed, and I probably can't get somebody to connect to me, not
without setting up additional rules..

/Christopher

----- Original Message -----
From: "Robert La Ferla" <robertlaferla@attbi.com>
To: "Jozsef Kadlecsik" <kadlec@blackhole.kfki.hu>
Cc: <netfilter@lists.samba.org>
Sent: Monday, June 03, 2002 6:11 PM
Subject: Re: HELP - NetMeeting, H323, 2.4.19pre9 and newnat13


> Are you saying that H.323 connection tracking just doesn't work?  It
> certainly isn't working for me.  I keep seeing posts from people having
> trouble setting it up so I know I'm not alone.
>
> All I would like to do is have one designated Windows host on my LAN, be
> able to use NetMeeting audio/video through a Netfilter NAT.  Being able
> to use multiple hosts would be a plus.
>
> Sincerely,
> Robert
>
>
>
>



