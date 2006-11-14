From: Danny <dineshg@hostway.com>
Subject: Re: Iptables for load balancing internet traffic
Date: Tue, 14 Nov 2006 16:56:25 +0530
Message-ID: <4559A7E1.6050302@hostway.com>
References: <4558A3B8.9080905@hostway.com> <45597F2B.4060101@alinto.com>	
	<45598EAD.8090900@hostway.com>
	<30df48470611140215w1e9a030fy9194256b08134550@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <30df48470611140215w1e9a030fy9194256b08134550@mail.gmail.com>
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

Jorge Ner=C3=ADn wrote:
>
> Yes there is a way, if you search you will find this:
>
> Routing for multiple uplinks/providers
> http://lartc.org/howto/lartc.rpdb.multiple-links.html
>
> It works.
>
 >> Note that balancing will not be perfect, as it is route based, and=20
routes are cached.

Yup ! I tested this. But it doesnt do a perfect Round Robin [ in this=20
case nth patch worked better ].


- Danny

