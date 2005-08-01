From: bjorn@ruberg.no (=?iso-8859-1?q?Bj=F8rn_Ruberg?=)
Subject: Re: Setting up a local firewall
Date: 01 Aug 2005 14:49:53 +0200
Message-ID: <ygfack1zury.fsf@langbein.hjemme.ruberg.no>
References: <42ED87C7.207@filefront.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42ED87C7.207@filefront.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Bryan Christ <bryan.christ@filefront.com> writes:

> I locked myself out of  my server until I rebooted it.  My goal was to lo=
ck down everything and allow only SSH connectivity.  Can anyone show me whe=
re my logic went wrong?  Here was the fatal script which I wrote:
>=20
> /sbin/iptables -F INPUT
> /sbin/iptables -A INPUT -s 0/0 -j DROP

First, you drop EVERYTHING from EVERYWHERE.

> /sbin/iptables -A INPUT -s 0/0 -m state  --state NEW,ESTABLISHED -p tcp -=
-dport 22 -j ACCEPT

Then you allow SSH from everywhere else, which is... NOWHERE.

> My guess is that I missed accepting syn packets, but I'm not ready to "tr=
y" again.

Instead, get familiar with the principle that "order does matter".

--=20
Bj=F8rn


