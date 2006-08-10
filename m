From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: One little problem I don't understand
Date: Thu, 10 Aug 2006 10:20:47 +0200 (CEST)
Message-ID: <60983.193.173.147.3.1155198047.squirrel@webmail.sterenborg.info>
References: <44DA422F.7000306@cdvultur.com> <44DAE1DC.3080801@rtij.nl>
	<44DAE67F.3010702@cdvultur.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <44DAE67F.3010702@cdvultur.com>
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

On Thu, August 10, 2006 09:55, Costi wrote:
> But still isn't iptables  *first rule wins* policy ? From what I know
> iptables runs with this policy?

That depends on the target.
If the target is definitive (AFAIK these are: ACCEPT, DROP, REJECT) then
subsequent rules will not be processed. A MARK target is not definitive s=
o
subsequent rules are processed.


Gr,
Rob



