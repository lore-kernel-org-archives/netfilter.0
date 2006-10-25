From: "TechSafe Seguranca" <techsafe.sec@gmail.com>
Subject: Re: Blocking MSN
Date: Wed, 25 Oct 2006 08:01:06 -0200
Message-ID: <50c841770610250301p5ce1ac6pd2ab20bb3b8a8a92@mail.gmail.com>
References: <c544f7190610230845uf32bd1fka58f02f9b39cd533@mail.gmail.com>
	<008401c6f6bb$39ad1700$0419a8c0@fly>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <008401c6f6bb$39ad1700$0419a8c0@fly>
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
To: facubarrera@gmail.com, netfilter@lists.netfilter.org

If your iptables will be compiled with patch-o-matic, is enough you
block string "gateway.dll".

iptables -A INPUT -m string --string 'gateway.dll' - j DROP

Cordial,

--=20
______________________________
                 TechSafe
Sua seguran=E7a sob nossa prote=E7=E3o

