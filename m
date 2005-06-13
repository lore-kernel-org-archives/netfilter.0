From: Glaucius Djalma Pereira Junior <glaucius@gmail.com>
Subject: Re: ICMP NAT
Date: Mon, 13 Jun 2005 13:36:29 -0300
Message-ID: <f48e768e050613093644b07fa6@mail.gmail.com>
References: <9D598A34672DF24F89FF4F851A41619511F3CA44@i2km08-ukbr.domain1.systemhost.net>
Reply-To: Glaucius Djalma Pereira Junior <glaucius@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <9D598A34672DF24F89FF4F851A41619511F3CA44@i2km08-ukbr.domain1.systemhost.net>
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
Content-Type: text/plain; charset="us-ascii"
To: "pablo.1.munoz@bt.com" <pablo.1.munoz@bt.com>
Cc: netfilter@lists.netfilter.org

iptables -t nat -A PREROUTING -d PUBLIC_IP -p icmp -j DNAT --to PRIVATE_IP
iptables -t nat -A POSTROUTING -s PRIVATE_IP -p icmp -j SNAT --to PUBLIC_IP

and if you want packets from source local :

iptables -t nat -A OUTPUT -d PUBLIC_IP -p icmp -j DNAT --to PRIVATE_IP

best regards

On 6/13/05, pablo.1.munoz@bt.com <pablo.1.munoz@bt.com> wrote:
>=20
> Hi all, Can someone tell me how can I implement a SNAT POSTROUTING and a
> DNAT PREROUTING of an ICMP packet?
>=20
> Regards, Pablo.
>=20
>=20


--=20
Glaucius Djalma Pereira Junior
glaucius@gmail.com

