From: "Samuel Jean" <sjean@cookinglinux.org>
Subject: RE: Iptables Make Rules On Different Interface? "iptables - L" 
     shows no difference!
Date: Mon, 7 Jun 2004 11:14:32 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <33147.207.236.167.66.1086621272.squirrel@207.236.167.66>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org

<linux_kurt@yahoo.com> wrote:
>when applying these rules, iptables -L
>it shows
>Chain INPUT (policy DROP)
>target prot opt source destionation
>Accept all -- anywhere anywhere

>Chain OUTPUT (policy DROP)
>target prot opt source destionation
>Accept all -- anywhere anywhere

>There is no place to differentiate interface eth0 or eth1

Sure there is. But you'll find those fields using iptables -L -v

--=20
Samuel Jean
SysAdmin & NetAdmin
at cookinglinux.org


