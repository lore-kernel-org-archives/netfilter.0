From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: What is wrong ???
Date: Mon, 22 Jan 2007 12:41:59 +0100
Message-ID: <001801c73e1a$53833cd0$0b0ffe0a@NS006819>
References: <45B4977B.8060906@freemail.hu><BAY103-DAV115D0A522A376BCE62C591B2AE0@phx.gbl>
	<45B4A14E.4090707@freemail.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <45B4A14E.4090707@freemail.hu>
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
To: 'Netfilter IPtableMailinglist' <netfilter@lists.netfilter.org>

> Yes... And it works without it.... But I need TARPIT support....

The compilation process complains about ipt_IPV4OPTSTRIP which is not
the same as ipt_TARPIT.
You could try leaving ipt_IPV4OPTSTRIP out: you don't have to apply
*all* patches...


Grts,
Rob



