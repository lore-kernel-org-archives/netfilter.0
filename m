From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: Fixup protocol
Date: Fri, 14 Apr 2006 08:18:58 +0200
Message-ID: <001a01c65f8b$50f7d570$0101000a@sterenborg.info>
References: <cc86d0010604131641r157d57eu1b0cda9962b7d410@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <cc86d0010604131641r157d57eu1b0cda9962b7d410@mail.gmail.com>
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

> Hi people,
> 
> Someone can help me?
>
> I'm searching for solution about the Cisco PIX fixup protocol
> (application inspection) in Linux OS.

The only PIX fixup results I have seen were for smtp and those are not
so good. The PIX smtp fixup is considered quite brain-dead by many (it
doesn't speak ESMTP), so I don't know if using it is such a good idea.
(The other fixup's may be better, though.)
Anyway, you want to configure Cisco PIX fixup in Linux or what ? AFAIK
this is a PIX solution only.


Gr,
Rob


