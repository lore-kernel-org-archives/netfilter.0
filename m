From: "Jerry Robles de Medina" <jroblesdemedina@godo.sr>
Subject: RE: Bypass transparent proxy(Squid)
Date: Wed, 31 Mar 2004 15:52:01 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <040EAEDD7A465C4AA0350CB69A326D550C3931@backup2.GODO-2000>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: David Cannings <lists@edeca.net>, netfilter@lists.netfilter.org

I am using smoothwall 2.0 and in it's adminpage you can set the proxy to =
be transparent.
And in the rc.firewall.up file I put in=20
/sbin/iptables -t nat -I squid -p tcp -s ! 192.168.0.45 --dport 80 -j =
REDIRECT --to-ports 800

But I have no idea if this is good or bad.

Jerry


-----Original Message-----
From: netfilter-admin@lists.netfilter.org =
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of David Cannings
Sent: March 31, 2004 3:40 PM
To: netfilter@lists.netfilter.org
Subject: Re: Bypass transparent proxy(Squid)

On Wednesday 31 March 2004 19:29, Jerry Robles de Medina wrote:,
> I have read somewhere along the posts that it is possible to let 2 =
pc's
> (ip's) bypass a transparent proxy server(squid cache). I have tried it
> in the rc.firewall.up file but I cannot get it working.=20

Please explain what you have tried, including the output of your chains=20
from:

iptables -L -nvx; iptables -L -t nat -nvx

David


