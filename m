From: Kjetil Torgrim Homme <kjetilho=6miFZF/5cTBuMpJDpNschA@public.gmane.org>
Subject: [quagga-users 369] Re: FW: Antefacto and 2.4.21
Date: Wed, 03 Sep 2003 11:19:35 +0200
Sender: quagga-users-bounces=UOy77sIEA+cAd7ICUelF/Q@public.gmane.org
Message-ID: <1r65ka6xg8.fsf@glesvat.ifi.uio.no>
References: <Pine.LNX.4.44.0309011948200.5869-100000@l>
	<3F5551F1.5040505@simutronics.com>
Mime-Version: 1.0
Return-path: <quagga-users-bounces@lists.quagga.net>
In-Reply-To: <3F5551F1.5040505@simutronics.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.quagga.net/mailman/listinfo/quagga-users>,
	<mailto:quagga-users-request@lists.quagga.net?subject=unsubscribe>
List-Archive: <http://lists.quagga.net/pipermail/quagga-users>
List-Post: <mailto:quagga-users@lists.quagga.net>
List-Help: <mailto:quagga-users-request@lists.quagga.net?subject=help>
List-Subscribe: <http://lists.quagga.net/mailman/listinfo/quagga-users>,
	<mailto:quagga-users-request@lists.quagga.net?subject=subscribe>
Errors-To: quagga-users-bounces@lists.quagga.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jimm=2zrVkTMJS9g5UWNf+nJyDw@public.gmane.org
Cc: "LinuxVirtualServer.org users mailing list." <lvs-users=9NwHyUdJu3J9kDVj6ABq+kzrnptfnCPw@public.gmane.org>, netfilter=wool9L35kiczKOhml7GhPkB+6BGkLq7r@public.gmane.org, quagga-users=UOy77sIEA+cAd7ICUelF/Q@public.gmane.org, "=?iso-8859-1?q?Elizabeth_Stokely_<lizabeth=2zrVkTMJS9g5UWNf+nJyDw@public.gmane.org>._Jo=E3o_?=
	=?iso-8859-1?q?Nuno_Mendes?=" <lizabeth=2zrVkTMJS9g5UWNf+nJyDw@public.gmane.org>

[Jim Miller]:
>
>   Well, I'm in the middle stages of setting up two linux server
>   firewalls (iptables/netfilter - doing stateful firewalling) with
>   keepalived (vrrp) and the LVS framework kernel patch, in a
>   Master/Backup configuration (keepalive seems to like having the
>   lvs framework to build on).

what are you using LVS for?  sounds like you don't need it.
keepalived runs fine without LVS.

-- 
Kjetil T.			|  read and make up your own mind
				|  http://www.cactus48.com/truth.html
