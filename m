From: Raymond Leach <raymondl@knowledgefactory.co.za>
Subject: Re: dns server
Date: Thu, 6 Jun 2002 15:48:32 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206061548.32785.raymondl@knowledgefactory.co.za>
References: <Pine.LNX.4.21.0206061542060.7290-100000@dns.toxicfilms.tv>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <Pine.LNX.4.21.0206061542060.7290-100000@dns.toxicfilms.tv>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Maciej Soltysiak <solt@dns.toxicfilms.tv>
Cc: Francois Peyron <lists@peyron.nom.fr>, netfilter@lists.samba.org

On Thursday 06 June 2002 15:45, Maciej Soltysiak wrote:
> Hello,
>
> i think somebody should write a short and simple FAQ for this.
> This type of questions are appearing very often.
>
> I belive that, you do not need to add special filtering rules for
> forwarders, secondaries, etc.
>
> Properly configure your DNS server, use ACLs.
>
> Using netfilter you can not judge whether TCP:53 packet is a zone =
transfer
> or just a query.
If you only expect to receive queries from internal interfaces then =
there=20
should be no 'queries' from external sources.

>
> Regards,
> Maciej Soltysiak

--=20
----------------------------------------

Ray Leach (Technical Network Specialist)

Knowledge Factory

www: http://www.knowledgefactory.co.za

Tel: +27-11-445-8100 Direct: 445-8263

Fax: +27-11-445-8101

"No matter where you go, there you are."

----------------------------------------

