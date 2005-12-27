From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: largescale NAT
Date: Tue, 27 Dec 2005 19:45:14 +0100
Message-ID: <000c01c60b15$aca45f30$0101000a@sterenborg.info>
References: <43B17ED4.5020104@fiktiv.szgtikol.kando.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <43B17ED4.5020104@fiktiv.szgtikol.kando.hu>
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

> Thank you for your answer, but what if we have only one
> public(external) ip? :)

Isn't it possible to limit the number of connections per (source) IP ?
http://www.netfilter.org/projects/patch-o-matic/pom-base.html#pom-base-c
onnlimit

Maybe not so nice for your users but things have to keep working, don't
they ?


Gr,
Rob


