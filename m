From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: SSH Connections Lost After 1 minute idle
Date: Wed, 14 Jul 2004 00:49:18 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407140049.18617.Antony@Soft-Solutions.co.uk>
References: <20040713233231.33272.qmail@web40709.mail.yahoo.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040713233231.33272.qmail@web40709.mail.yahoo.com>
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

Nick Taylor <nickt@lightlink.com> wrote:

> > I'm sorry, I haven't followed the entirety of this thread, but my thoughts
> > are as follows:
> >
> > Sometimes (on a nat box), the connection tracking can't tell the
> > difference between an "orphaned" connection (say the server crashed) and
> > an idle connection, so after a certian period, it drops the connection out
> > of its table, and of course, another packet that comes in later will get a
> > connection reset, because it has forgotten.

That's true, however, the timeout period on a TCP connection is 5 days (!), so 
I don't think it can be used to explain why a connection might be dropped 
after only a minute or so....

Antony.

-- 
RTFM may be the appropriate reply, but please specify exactly which FM to R.

                                                     Please reply to the list;
                                                           please don't CC me.


