From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: Could anyone, please, tell me what's wrong with this:
Date: Fri, 18 Nov 2005 12:07:40 +0100 (CET)
Message-ID: <64091.193.173.147.3.1132312060.squirrel@webmail.sterenborg.info>
References: <437DB2FC.7080000@camline.net.mt>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <437DB2FC.7080000@camline.net.mt>
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


On Fri, November 18, 2005 11:54, Anthony Azzopardi wrote:
> |Hello ppl,
>
> Could anyone, please, tell me what's wrong with this:
>
> iptables -A FORWARD --match iprange --src-range 192.168.123.1 -
> 192.168.123.99 -j DROP
>
> It's giving me errors.

And exactly *what* errors would that be ?

I'm guessing you need to delete the space between :
"192.168.123.1 - 192.168.123.99"

So it reads :
"192.168.123.1-192.168.123.99"


Gr,
Rob



