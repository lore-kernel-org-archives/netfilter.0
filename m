From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: How to use more IP address for one netcard in Iptables?
Date: Tue, 1 Apr 2003 03:05:11 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200304010305.11186.netfilter@newkirk.us>
References: <20030401033056.725471C9C1C78@sm204.163.com>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030401033056.725471C9C1C78@sm204.163.com>
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
To: Bobo <boboaq@163.com>, "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

On Monday 31 March 2003 10:30 pm, Bobo wrote:
> Hi
>
>     While  use Iptables as the gateway of my LAN,I would like to use
> NAT.
>
>    I have six   C class address,and I want to use it on one netcard
> eth0 for NAT.
>
>    Must I bind the six IP address with eth0 step by step under linux ?
>
>   Could I use the six IP address in the Shell scripts while only bind
> one Ip address with netcard eth0 ?
>
>   Thanks a lot.

You have to bind each address if you want routing to recognize them as=20
valid for that interface.  Also be aware that when matching in iptables=20
you can ONLY match the main interface, ie eth0, not an extra virtual one=20
like eth0:1.  The way to distinguish between them (if necessary) in an=20
iptables rule is by IP.

j


