From: Aaron Berg <aberg@travellantech.com>
Subject: Re: Multiple Source Addresses
Date: Tue, 15 Apr 2003 11:10:57 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200304151110.58045.aberg@travellantech.com>
References: <22FCCF057850DB48B98178E1811374830DA6D9@slra07.slb.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <22FCCF057850DB48B98178E1811374830DA6D9@slra07.slb.de>
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
To: Keller Nicolas <nicolas.keller@slb.de>, netfilter@lists.netfilter.org

Try something like this:

iptables -N allowable
#you should limit which traffic is sent through this chain
iptables -A input -j allowable
#list of IPs to allow
iptables -A allowable -s 192.168.43.1 -j ACCEPT
iptables -A allowable -s 192.168.43.2 -j ACCEPT
#It will only do this rule if it doesn't match any rules before it in the=
=20
chain
iptables -A allowable -j LOG

I haven't tested this, but it should do the trick.

On Tuesday 15 April 2003 9:28 am, Keller Nicolas wrote:
> Hi!
>
> I want to log every packet that *doesn't* come from IP1 and IP2 (becaus=
e
> these two hosts should be the only one that communicate with the
> Firewall). Up to now I couldn't figure out a way to do this, as it is
> NOT possible to include multiple source addresses in one line, like
> this:
>
> iptables -A INPUT -s !192.168.43.1 !192.168.43.2 -j LOG
>
> Anyone can show me a way to get this to work?
>
> Thank you very much!
>
> Nicolas Keller


