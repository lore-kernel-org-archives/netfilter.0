From: Joerg Mayer <jmayer@loplof.de>
Subject: Re: MS Windows domain logon via netfilter NAT
Date: Sun, 12 May 2002 20:30:27 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020512203027.I623@thot.informatik.uni-kl.de>
References: <3CDEA665.5040605@ufl.edu>
Reply-To: Joerg Mayer <jmayer@loplof.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <3CDEA665.5040605@ufl.edu>
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
To: Kramer <kramer@ufl.edu>
Cc: netfilter@lists.samba.org

On Sun, May 12, 2002 at 01:29:09PM -0400, Kramer wrote:
> Windows client hosts on the NATed LAN can't find the NT4 Domain for=20
> logon.  Therefore Network Neighborhood browsing doesn't work.  Strangely =

> direct UNC connections will work if logon credentials are not required.

In normal IP networks running windows, the DC is found via the WINS service.
WINS is the pre win2k version of DNS. WINS is used to map host- and service-
names to IP-addresses. AFAIK, there is currently no support for WINS in
iptables/netfilter, thus the answer your win client gets back points to
the not-NATed address, which is unreachable. By directly specifying the
machine you work around that problem (you manually to what the wins service
would have done otherwise).

  ciao
        J=F6rg

--
Joerg Mayer                                          <jmayer@loplof.de>
I found out that "pro" means "instead of" (as in proconsul). Now I know
what proactive means.


