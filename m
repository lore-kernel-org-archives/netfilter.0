From: "=?ISO-8859-1?Q?Juan_Le=F3n?=" <debjuanca@gmail.com>
Subject: Re: Block an IP if there is number of connection within a time
	limit ??
Date: Wed, 27 Jun 2007 11:55:39 -0400
Message-ID: <6bb85d880706270855o6f44892cheed931478c9a387@mail.gmail.com>
References: <4681F1BE.6000108@ditro.com> <4681F315.6060106@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=p/Q5Rfu6aATlzP7BW3qy/M2vowYvtd/2pESx2uWjFZ57AOba9Fr9OTLkPLjSF+3mBOexGiOgDRon8buuuknauPRtpV/qoCTvTdV9INY0sG8tgN9bbBkVC5WxLc9xCpXMM6OddYadmDrI4DJdpr1zPoGzQHz2ZIcWKaOo9uabiWk=
In-Reply-To: <4681F315.6060106@riverviewtech.net>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@lists.netfilter.org>

2007/6/27, Grant Taylor <gtaylor@riverviewtech.net>:
> On 6/27/2007 12:12 AM, Ditro - BipinDas wrote:
> > I do have a Exim mail server with IPTABLES and TCP WRAPPER as
> > firewall. Yesterday I had noticed that,there is continuous smpt
> > connection from an IP. I would like to block these IP,if there is
> > more than 10 connection in 30 second. Is this possible using IPTABLES
> > command. If yes,Please guide me.
>
> Use the IPTables "recent" match extension to match on newly established
> SMTP sessions and reject them if there have been more than 10 in the
> last 30 seconds.

iptables -I INPUT -p tcp --dport 25 -i eth0 -m state --state NEW -m recent \
  --update --seconds 30 --hitcount 10 -j DROP


>
>
>
> Grant. . . .
>
>

