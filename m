From: Kamal <kamash@gmail.com>
Subject: Re: NAT POSTROUTING accounting
Date: Mon, 16 Oct 2006 20:40:25 +0300
Message-ID: <8a1be4700610161040g70d38874gf3d9fb1fe629d84@mail.gmail.com>
References: <8a1be4700610150743t6c089bfcm7648174d88793c00@mail.gmail.com>
	<45327967.8080406@rtij.nl>
	<8a1be4700610160500r3bee8e52taa1e7f0c4765eb8c@mail.gmail.com>
	<45337B04.4040808@freemail.hu>
	<8a1be4700610160622q533ac28di9ab37f5735ddd554@mail.gmail.com>
	<45339128.4010609@freemail.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <45339128.4010609@freemail.hu>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

On 10/16/06, G=E1sp=E1r Lajos <swifty@freemail.hu> wrote:


mangle POSTROUTING comes before nat POSTROUTING so nat POSTROUTING is
the last chain in a packet traversal as per:
http://iptables-tutorial.frozentux.net/images/tables_traverse.jpg

So replying to your email:
> 1. You may do some changes on the packets... (SNAT/DNAT, etc...)
How  would SNAT or DNAT help in accounting?

> 2.a. You have to mark or identify the packets you want to count in other
> chains ... (MARK target or direct rules)
Since nat POSTROUTING is the last chain I wouldn't be able to mark it
after the packet is SNATte'd.

> 2.b. You can use the mangle POSTROUTING chain for counting specified
> packets because this is the "last" chain BEFORE every packet leaves the
> system.
> (I know that there is a "raw" table...)
As I said POSTROUTING mangle comes before POSTROUTING nat.

If it were after it then I would have the following:

 iptables -t nat -I POSTROUTING -o eth0 -p tcp --dport 80 -j SNAT --to
192.168.0.1
 iptables -t nat -I POSTROUTING -o eth0 -p tcp --dport 25 -j SNAT --to
192.168.0.1
 iptables -t nat -I POSTROUTING -o eth0 -p tcp --dport 443 -j SNAT --to
192.168.0.1
 iptables -t nat -I POSTROUTING -o eth0 -j SNAT --to  192.168.0.2

then I would have added
iptables -t mangle -I POSTROUTING -o eth0 -s 192.168.0.1 -j ACCEPT
iptables -t mangle -I POSTROUTING -o eth0 -s 192.168.0.2 -j ACCEPT

which would have been a nice solution

But since mangle POSTROUTING is before nat POSTROUTING, then the above
wouldn't work & I would have to add a statement in mangle POSTROUTING
for every nat rule:
iptables -t mangle -I POSTROUTING -o eth0 -p tcp --dport 80 -j ACCEPT
iptables -t mangle-I POSTROUTING -o eth0 -p tcp --dport 25 -j ACCEPT
iptables -t mangle -I POSTROUTING -o eth0 -p tcp --dport 443 -j ACCEPT
iptables -t mangle -I POSTROUTING -o eth0 -j ACCEPT

And that's what I meant by "not very graceful".

Thanks

