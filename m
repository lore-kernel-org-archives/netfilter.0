From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: HELP - NetMeeting, H323, 2.4.19pre9 and newnat13
Date: Tue, 4 Jun 2002 09:57:03 +0200 (CEST)
Sender: netfilter-admin@lists.samba.org
Message-ID: <Pine.LNX.4.33.0206040933150.6390-100000@blackhole.kfki.hu>
References: <3CFB9535.4020308@attbi.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <3CFB9535.4020308@attbi.com>
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

On Mon, 3 Jun 2002, Robert La Ferla wrote:

> Are you saying that H.323 connection tracking just doesn't work?  It
> certainly isn't working for me.  I keep seeing posts from people having
> trouble setting it up so I know I'm not alone.

We are facing two separated problems:

- applying the patch. People tend to forget applying the newnat patch or
  all the pending patches.

- using the functionality. I can repeat only myself. It works, but only in
  the (most) simple cases. [Sometimes I think the patch should have never
  been written. :-(]

> All I would like to do is have one designated Windows host on my LAN, be
> able to use NetMeeting audio/video through a Netfilter NAT.  Being able

If you want to call out only, this is simple and doable by
SNAT/MASQUERADE. I you want that the host could be called from outside,
then it is doable by DNAT.

> to use multiple hosts would be a plus.

Multiple hosts can call out, no problem. However, because they're NATed,
the hosts cannot be called.

All the above will fail if netmeeting use the faststart option (H.245
tunnelling) or there is a gatekeeper involved at any side.

Regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
WWW-Home: http://www.kfki.hu/~kadlec
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary


