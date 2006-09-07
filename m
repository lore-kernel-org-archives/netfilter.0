From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Newbie question about NAT and forwarding
Date: Thu, 07 Sep 2006 11:20:39 +0200
Message-ID: <44FFE467.8020909@plouf.fr.eu.org>
References: <20060906205232.GA23980@crowfix.com>
	<ednhr3$pjc$1@sea.gmane.org>	<44FF5F42.4050605@plouf.fr.eu.org>	<20060907002458.GA13990@crowfix.com>	<44FF77DD.9030005@plouf.fr.eu.org>
	<20060907024331.GA2591@crowfix.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20060907024331.GA2591@crowfix.com>
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
Content-Type: text/plain; charset="iso-8859-9"; format="flowed"
To: netfilter@lists.netfilter.org

felix@crowfix.com a =E9crit :
> On Thu, Sep 07, 2006 at 03:37:33AM +0200, Pascal Hambourg wrote:
>=20
>>felix@crowfix.com a ?crit :
>>
>>>I've used table names with iptables commands in my shell scripts, but
>>>I didn't know this /etc/iproute2 directory existed.
>>
>>Huh ? AFAIK, iptables commands do not use routing tables. Can you give=20
>>an example ?
>=20
> I am showing my newbie status.  Maybe I meant chain names?

Someone using user-defined iptables chains cannot be a newbie. :-)

> Here is a
> snippet I use to enable and disable ssh, with SSH being a table?chain?
> name I can use in another script:
>=20
> iptables -N SSH

Here "SSH" is a user-defined iptables chain in the default iptables=20
table ("filter"). Routing tables and /etc/iproute2 are totally=20
independant from iptables.

