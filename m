From: Askar <askarali@gmail.com>
Subject: Re: rules for skype
Date: Sun, 1 May 2005 14:46:29 +0500
Message-ID: <a0f69e50505010246227a187f@mail.gmail.com>
References: <90ba0390f499.90f49990ba03@vsnl.net>
Reply-To: Askar <askarali@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <90ba0390f499.90f49990ba03@vsnl.net>
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
To: "varun_saa@vsnl.net" <varun_saa@vsnl.net>
Cc: netfilter@lists.netfilter.org

It depends, if you have "iptables -P FORWARD DROP" at the top of your
rules set then you have to allow skype ports (any) with something like
this

iptables -A FORWARD -p tcp --dport SKYPEPORT -j ACCEPT

and if you have ""iptables -P FORWARD ACCEPT" , then you don't have to
do anything fanncy.

regards

Askar

On 5/1/05, varun_saa@vsnl.net <varun_saa@vsnl.net> wrote:
> Hello,
>      My server is on Mandriva 10.1
> eth0 is WAN with static IP connected to 512K DSL
> eth1 is LAN - 192.168.0.0/24 and 192.168.21.0/24
>=20
> I am doing a nat/masq on eth0.
>=20
> Some of clients are going to using Skype.
>=20
> Any rules to be included for skype ?
>=20
> Thanks
>=20
> Varun
>=20
>=20


--=20
I love deadlines. I like the whooshing sound they make as they fly by.
Douglas Adams

