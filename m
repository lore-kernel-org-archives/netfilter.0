From: KOVACS Krisztian <hidden@sch.bme.hu>
Subject: Re: lost UDP packets with matching NAT rules
Date: Fri, 17 Feb 2006 10:43:19 +0100
Message-ID: <200602171043.19725@nienna>
References: <freemail.20060115181615.95655@fm03.freemail.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-bounces@lists.netfilter.org>
In-reply-to: <freemail.20060115181615.95655@fm03.freemail.hu>
Content-disposition: inline
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
Content-Type: text/plain; charset="iso-8859-1"
To: =?iso-8859-2?q?Keser=FB_Korn=E9l?= <keseruk@freemail.hu>
Cc: netfilter@lists.netfilter.org


  Hi,

On Wednesday 15 February 2006 18.16, Keser=FB Korn=E9l wrote:
> Thanks for the explanation!
> Does this mean that a nat function, realized with a DNAT+SNAT rule
> pair will not work for many-to-one connections? What I wanted to
> realize with those rules is that UDP packets received from anywhere
> (several sources) are forwarded to one concrete destination and the
> source of the forwarded packets is always changed to the same.
> If so, would a NOTRACK rule in the raw table help here (don't track
> those connections)?

  Unfortunately not. You'd need stateless NAT for UDP, which is not (=
yet)=20
implemented in Netfilter. (But occasionally it would be a really cool=
 and=20
useful feature.)

--=20
KOVACS Krisztian


