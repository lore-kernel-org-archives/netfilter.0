From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Allow active and passive FTP connections
Date: Thu, 17 Jun 2004 17:52:00 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406171752.01001.Antony@Soft-Solutions.co.uk>
References: <20040617164140.44194.qmail@web14724.mail.yahoo.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040617164140.44194.qmail@web14724.mail.yahoo.com>
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

On Thursday 17 June 2004 5:41 pm, Sagara Wijetunga wrote:

> <justin.piszcz@mitretek.org> wrote:
> > Is it necessary to build ip_conntrack_ftp as a
> > module?
> > If you want to do ports other than 21 on 2.4, yes,
> > on 2.6, no, you can
> > use the append="" option in LILO.
>
> Could you elaborate this a bit? I use Linux kernel
> 2.6.5 and ip_conntrack_ftp is compiled into the
> kernel. Do I still have to pass a append="" option to
> kernel at LILO?

Only if you want to connect to a non-standard port number (ie: other than 21)

Regards,

Antony.

-- 
This email is intended for the use of the individual addressee(s) named above 
and may contain information that is confidential, privileged or unsuitable 
for overly sensitive persons with low self-esteem, no sense of humour, or 
irrational religious beliefs.

If you have received this email in error, you are required to shred it 
immediately, add some nutmeg, three egg whites and a dessertspoonful of 
caster sugar.   Whisk until soft peaks form, then place in a warm oven for 40 
minutes.   Remove promptly and let stand for 2 hours before adding some 
decorative kiwi fruit and cream.   Then notify me immediately by return email 
and eat the original message.

                                                     Please reply to the list;
                                                           please don't CC me.


