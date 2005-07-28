From: Matin Tamizi <mtamizi@gmail.com>
Subject: Re: Stateless NAT
Date: Thu, 28 Jul 2005 16:54:51 -0400
Message-ID: <f68a41605072813544f7fc705@mail.gmail.com>
References: <OF7FD36B55.0277057F-ONC125701A.00258ADF-C125701A.00262725@team4.de>
	<9D532201-8173-474B-8281-1FA274AFC243@cuseeme.de>
	<f68a416050609064333bebd9f@mail.gmail.com>
Reply-To: Matin Tamizi <mtamizi@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <f68a416050609064333bebd9f@mail.gmail.com>
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
To: NetFilter <netfilter@lists.netfilter.org>
Cc: Dharanikanth Dugginni <dharanikanthd@gmail.com>

On 7/28/05, Dharanikanth Dugginni <dharanikanthd@gmail.com> wrote:
> Hello Matin,
>=20
> I saw a post from you about Stateless NAT in linux and you concluded
> saying you found some solution, I am trying to do some thing similar
> to that, would you mind sharing the approach you have taken??
>=20
> Thanks,
> -Dhar
>=20

I had a *real* special situation since I'm doing this just for a
testbed.  I was able to get around stateless NAT by using ARP
poisoning to force a certain network topology.  This approach will
work but is not scalable and not recommended.

IMHO, you have the following options:
 1. Use a different firewall -- I'm sure you've heard suggestion before.
 2. Create a target module -- I couldn't figure out how to do this for
a static NAT, so please let me know if you do
 3. QUEUE the packets you want to NAT and use libipq to do the static NATin=
g
 4. ARP poisoning (spoofing)

Let me know if you want me to post more information about 3 or 4.

-Matin

