From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: Protecting against DoS
Date: Tue, 09 Dec 2003 13:01:31 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1070992891.1867.19.camel@jasiiitosh.nexusmgmt.com>
References: <9659.200.48.142.50.1070997074.squirrel@www.netfids.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <9659.200.48.142.50.1070997074.squirrel@www.netfids.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: Geffrey =?ISO-8859-1?Q?Vel=E1squez?= <g_netfilter@netfids.com>
Cc: netfilter@lists.netfilter.org

On Tue, 2003-12-09 at 14:11, Geffrey Vel=C3=A1squez wrote:
> Hi,
>=20
> > Hello,
> >
> > 	First make sure you are using tcpsyn_cookies:
> >
> > echo 1 > /proc/sys/net/ipv4/tcp_syncookies -- if you have not compiled
>=20
>=20
> Is that valid for forwarded packets? or only destinated to the firewall?
>=20
<snip>
I'm glad you brought that up.  In fact, I'm delighted at this entire
discussion since we are developing the final self-protection rules for
use in the ISCS project.

We have avoided using these /proc settings for just that concern - that
they are mostly for the gateway itself and not for the devices being
protected by it whether it is anti-spoofing with rp_filter or protecting
against syn_floods.  Is this assumption of ours true? Thanks, all - John
--=20
John A. Sullivan III
Chief Technology Officer
Nexus Management
+1 207-985-7880
john.sullivan@nexusmgmt.com
---
If you are interested in helping to develop a GPL enterprise class
VPN/Firewall/Security device management console, please visit
http://iscs.sourceforge.net=20


