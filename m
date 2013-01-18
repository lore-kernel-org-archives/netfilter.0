From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: [PATCH v4] netfilter: nf_conntrack_sip: Handle Cisco 7941/7945
 IP phones
Date: Fri, 18 Jan 2013 03:10:07 +0100
Message-ID: <20130118021007.GA26517@1984>
References: <1355805238-2460-1-git-send-email-cernekee@gmail.com>
 <20130117233539.GA15576@1984>
 <CACuyg24kxP3Ck280LBcPuUc6bp26DbWqpWaLyHAkz6pwd8WMVA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACuyg24kxP3Ck280LBcPuUc6bp26DbWqpWaLyHAkz6pwd8WMVA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Humberto =?iso-8859-1?Q?Juc=E1?= <betolj@gmail.com>
Cc: netfilter@vger.kernel.org

On Thu, Jan 17, 2013 at 10:55:38PM -0300, Humberto Juc=E1 wrote:
> For now I'm using "siproxd" to solve this.
>=20
> I glad to hear that already has a patch for this.
> I will wait for official kernel support (Ubuntu)!

This will happen in upcoming Linux kernel 3.9, as this will hit the
-next tree at some point.
