From: "Elvir Kuric" <omasnjak@gmail.com>
Subject: Re: Restricting applications/protocols to use specific ports using
	iptables, is this possible
Date: Mon, 4 Jun 2007 14:39:01 +0200
Message-ID: <1814bfe70706040539x61ca3113rb8679da3cc29b304@mail.gmail.com>
References: <1814bfe70706040437i34b282d8ocf15b698160e05b5@mail.gmail.com>
	<20070604120611.GC28171@torres.zugschlus.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=l/h8d3dJDfiXgUjuWnx/aleiEwI0X2vXXIuPwTKBBz2KNLZ818LfmtD7M+LLv2JZhzI1N7qyDeO7oytTJ8HBf1BWUFi5ClHHlS/WF1PVl4D4fnBig01UpXa/wWOB3OARc6eMbaQcaZv/ZNeUDtPMhTFs4AD4JMVzm0+6KAvIec4=
In-Reply-To: <20070604120611.GC28171@torres.zugschlus.de>
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
To: Marc Haber <mh+netfilter@zugschlus.de>
Cc: netfilter@lists.netfilter.org

On 6/4/07, Marc Haber <mh+netfilter@zugschlus.de> wrote:
> On Mon, Jun 04, 2007 at 01:37:07PM +0200, Elvir Kuric wrote:
> > I am interested in one thing, is possible using iptables software
> > limit particular application/protocol to use/bind to particular ports.
>
> Why do you want to do that?

:) I want to control which ports are open in output chain. Testing, exploring.

I know it is not important which ports are open in output chain,
usually putting output policy to accept.

>
> > For example I want to send all reqestes from my machine using ports I
> > specify, not random ones,
>
> Why?
>
> >  or accept ping echo-replay on specific ports.
>
> Pleas get your facts straight. ICMP does not have ports.

ICMP was just example, first on my mind in that moment :)

Regards

Elvir Kuric
>
> Greetings
> Marc
>
> --
> -----------------------------------------------------------------------------
> Marc Haber         | "I don't trust Computers. They | Mailadresse im Header
> Mannheim, Germany  |  lose things."    Winona Ryder | Fon: *49 621 72739834
> Nordisch by Nature |  How to make an American Quilt | Fax: *49 3221 2323190
>
>

