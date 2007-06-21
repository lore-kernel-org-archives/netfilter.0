From: "Elvir Kuric" <omasnjak@gmail.com>
Subject: Re: Netfilter Hooks
Date: Thu, 21 Jun 2007 14:09:33 +0200
Message-ID: <1814bfe70706210509t10723b5awa5baf3f2218f9760@mail.gmail.com>
References: <f9432b90706201841p7cf4cf95u25dcaa0a55124fac@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=Gvr9SONYAr8mnGj37/IBc1czux2HrMlYrrLUGvExUPf7J5mTsEBKyCJ7sFkODMkKddBsyeZiTzuO7KYNvFJwAZlXeTn72vXzYBy7Zpu0X2InDpJS5jKSdloKsqk7wdDbidFMxgCK4p6YXDprS84TPTc+KaIf48Xdton7+lqYIng=
In-Reply-To: <f9432b90706201841p7cf4cf95u25dcaa0a55124fac@mail.gmail.com>
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
To: "Tercio F. Gaudencio Filho" <terciofilho@gmail.com>
Cc: netfilter@lists.netfilter.org

Hi all,

take a look at http://www.squid-cache.org/ .

Squid cache is very good :)

Regards

Elvir Kuric

On 6/21/07, Tercio F. Gaudencio Filho <terciofilho@gmail.com> wrote:
> Hi All!
>
> I'm new in Netfilter world and I'm with some doubts...
>
> I want to create "something" that can analyze packets that get in and
> get out from my machine, but I want to analyze the packet data not
> it's origin or destination, it's content.
>
> Imagine that I want to create a filter, that blocks/allow every packet
> that contains the word, for example, "GOOGLE" in it. I don't want to
> block a packet deriving from some IP, or something like that, I want
> to filter the content. For example, be able to parse a XML file in a
> packet, or parse some protocol, something like that.
>
> Question, is it possible to do with netfilter hooks? I read sometime
> ago, about netfilter hooks, and it seems to be pretty simple, with
> restrictions.... but I'm not sure about that.
>
> If not possible with netfilter hooks, is that possible in another way?
> Which way?
>
> Thanks all!
>
> Tercio.
>
>

