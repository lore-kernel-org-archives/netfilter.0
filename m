From: Jason Costomiris <jcostom@jasons.org>
Subject: Re: Redhat 7.2 Kernel
Date: Wed, 10 Jul 2002 09:10:02 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020710131001.GA1557@jasons.org>
References: <000001c2277c$93210d40$7200a8c0@blue> <000c01c227ed$4f5a8520$050b10ac@tuq155u4834h40>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <000c01c227ed$4f5a8520$050b10ac@tuq155u4834h40>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: Dorian Haasler <dorian@uptime.at>
Cc: 'Denis JULIEN' <denis.julien@vupublishing.net>, "'Mike G. Hammonds'" <mhammonds@knowledgeinenergy.com>, "'Iptables-User-list (E-mail)'" <netfilter@lists.samba.org>

On Wed, Jul 10, 2002 at 10:39:24AM +0200, Dorian Haasler wrote:
: Why using rc.firewall scripts with RedHat? Write your script and at
: the of it use "iptables-save" to store the information!
: At the next reboot the iptables settings will be the same and you
: don=B4t need to run your script every time. Changes can done in
: /etc/sysconfig/iptables
: where the rules where stored!

One reason in particular to NOT run an rc.firewall out of rc.local on RedHat
(or any other system for that matter) is that by that time you've already=20
brought up your network interfaces.  There's a window that's short, but is
still nonetheless exploitable to do damage.

RH loads the iptables policies FIRST, then brings up the i/f's. =20

So basically, run your script, then run "service iptables save", and make
sure that iptables starts at boot.  You'll most likely also want to have
a look at /etc/sysctl.conf to tweak the ip forwarding setting.

--=20
Jason Costomiris <><           |  Technologist, geek, human.
jcostom {at} jasons {dot} org  |  http://www.jasons.org/=20
          Quidquid latine dictum sit, altum viditur.
                    My account, My opinions.

