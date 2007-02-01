From: Alexander Pyhalov <alp@rosten.elektra.ru>
Subject: Re: Wrong ips
Date: Thu, 1 Feb 2007 14:48:29 +0300
Message-ID: <200702011448.29835.alp@rosten.elektra.ru>
References: <200702010851.14795.alp@rosten.elektra.ru>
	<45C1D0FC.9050908@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <45C1D0FC.9050908@gmail.com>
Content-Disposition: inline
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
Content-Type: text/plain; charset="windows-1252"
To: netfilter@lists.netfilter.org

On Thursday 01 February 2007 14:37, Georgi Alexandrov wrote:
> > # =9AAccess to HTTP server
> > iptables -A INPUT -p tcp -m tcp --dport 80 -j ACCEPT
> > # =9AAccess to SSH is allowed to all
> > iptables -A INPUT -p tcp -m --dport 22 -j ACCEPT
>=20
> This line is wrong ^

I know - it's my misprint ( only in letter )

