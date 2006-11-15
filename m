From: Matevz Langus <matevz.langus@borea.si>
Subject: Re: how to change ip source address of incoming packets
Date: Wed, 15 Nov 2006 09:25:12 +0100
Message-ID: <30B51F1D-F230-4F45-BDB6-050DBB82AC3E@borea.si>
References: <20768C3A-7F88-4816-8B52-2DE7A6910C64@borea.si>
	<455ACC13.2070801@freemail.hu>
Mime-Version: 1.0 (Apple Message framework v752.2)
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <455ACC13.2070801@freemail.hu>
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
Content-Type: text/plain; charset="iso-8859-1"; delsp="yes"; format="flowed"
To: =?ISO-8859-1?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Cc: netfilter@lists.netfilter.org

To easy to be true. Tried this one already. I get this:

iptables v1.3.5: Can't use -i with POSTROUTING

Matevz

On Nov 15, 2006, at 9:13 AM, G=E1sp=E1r Lajos wrote:

> iptables -t nat -A POSTROUTING -j SNAT -i eth0.10 -s 192.168.1.1 --=20
> to-source 192.168.10.1


