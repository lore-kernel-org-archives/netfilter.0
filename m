From: Petr Silhavy <silhavy@mef.cz>
Subject: [Openswan Users] 
	Re: Dead loop on netdevice ipsec0, fix it urgently!
Date: Fri, 09 Jul 2004 16:21:49 +0200
Sender: users-bounces@lists.openswan.org
Message-ID: <658x2rcy.fsf@chaos.mef.cz>
References: <40EE7E15.70204@epost.de>
Reply-To: Discussion list for Openswan users <users@lists.openswan.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <users-bounces@lists.openswan.org>
In-Reply-To: <40EE7E15.70204@epost.de> (
 =?iso-8859-1?q?Nicole_H=E4hnel's_message_of?= "Fri, 09 Jul 2004 13:14:29
 +0200")
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.openswan.org/mailman/listinfo/users>,
	<mailto:users-request@lists.openswan.org?subject=unsubscribe>
List-Archive: <http://lists.openswan.org/pipermail/users>
List-Post: <mailto:users@lists.openswan.org>
List-Help: <mailto:users-request@lists.openswan.org?subject=help>
List-Subscribe: <http://lists.openswan.org/mailman/listinfo/users>,
	<mailto:users-request@lists.openswan.org?subject=subscribe>
Errors-To: users-bounces@lists.openswan.org
Content-Type: text/plain; charset="iso-8859-1"
To: =?iso-8859-1?q?Nicole_H=E4hnel?= <nicole.haehnel@epost.de>
Cc: users@lists.openswan.org, netfilter@lists.netfilter.org

Nicole H=E4hnel <nicole.haehnel@epost.de> writes:

> Hi,
>
> I get this error on my firewall-vpn-server
>
> Dead loop on netdevice ipsec0, fix it urgently!
>
>
> Any ideas where this come from?
I got this cryptic message when I modified ESP packet in mangle table.
Rule like "iptables -t mangle -A OUTPUT -p 50 -j TOS --set-tos 0x10"
is able to make klips (1.99.x) mad.
