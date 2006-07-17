From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Local Routing without IP Aliasing
Date: Tue, 18 Jul 2006 01:31:49 +0200
Message-ID: <44BC1DE5.1010602@plouf.fr.eu.org>
References: <44BBF7AF.2090004@tavve.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <44BBF7AF.2090004@tavve.com>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Hello,

Jim Doble a =E9crit :
> I am trying to configure a Linux host to treat a potentially large rang=
e=20
> of IP addresses as "local", without having to define these addresses as=
=20
> aliases.

ip route add local <prefix>/<length> dev lo

