From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: connection limit per ip
Date: Tue, 20 Jul 2004 09:53:38 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407200953.40058.Antony@Soft-Solutions.co.uk>
References: <20040720055237.12274.qmail@web40702.mail.yahoo.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040720055237.12274.qmail@web40702.mail.yahoo.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Tuesday 20 July 2004 6:52 am, Mohammad Shakir wrote:

> I have red hat linux 7.3 with normail dialup and i have 15 clients which
> are connected with my linux box.
>
> I am using simple MASQUERADING for internet sharing, now i want to put
> limit of 1kb limit for each user.

Try the "dstlimit" match in current versions of netfilter.

Quoting from the man page: "This module allows you to  limit  the  packet  per  
second (pps) rate on a per destination IP or per destination port base.  As 
opposed to the `limit' match, every  destination ip / destination port has 
it's own limit."

Regards,

Antony.

-- 
Normal people think "If it ain't broke, don't fix it".
Engineers think "If it ain't broke, it doesn't have enough features yet".

                                                     Please reply to the list;
                                                           please don't CC me.


