From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: Upload shapping
Date: Mon, 26 Dec 2005 12:10:49 +0100 (CET)
Message-ID: <18185.80.127.73.119.1135595449.squirrel@webmail.sterenborg.info>
References: <43AFC947.9020603@e-attico.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <43AFC947.9020603@e-attico.net>
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
To: netfilter@lists.netfilter.org

On Mon, December 26, 2005 11:43, Diego Cabrero wrote:
> Hi everyone,
>
> I'm controling the uplink traffic bandwidth between two ethernet
> linux computers, but it seems like even the download bandwidth gets
> limited

When you limit upload too much, it'll affect download. You can't get
around that fact.

> then i've got trouble on that because my intention is shaping the
> conection on an asymetric way (ADSL).  Lately, I'm going crazy, this
> problem has got me pretty worried and i'm not figuring out at all,
> the reasons why this weird bug happens.

I'm not sure it's a bug ; I don't know how much you limit your upload.
(Besides, this is a routing thing, not Netfilter. I think the lARTC
list is more appropriate.)


Gr,
Rob



