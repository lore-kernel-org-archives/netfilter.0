From: "David Gaudine" <david@annette.concordia.ca>
Subject: Re: RELATED is not recognized
Date: Mon, 5 May 2003 09:13:34 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <002801c31308$22e365a0$0432cd84@sleepy>
References: <001101c31278$94dc0ad0$0432cd84@sleepy> <200305050616580441.028BA0E6@smtp.nikonbw.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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

> may be the problem is you don't try to use -i option, since you are using
> INPUT chain right,
> try to use it with that option

Thanks, but it didn't work.  However, I withdraw the question, because
(continued below)

> >CONFIG_IP_NF_CONNTRACK=y
> >CONFIG_IP_NF_FTP=y
> >CONFIG_IP_NF_IPTABLES=y
> >CONFIG_IP_NF_FILTER=y
[snip]
> >is unrecognized.  Why is this?  Is there another kernel options that I
> >should have included?

Actually I missed at least two necessary kernel options.  I don't know how I
missed them.  I'm having disk problems and can't compile right now, but
let's assume the problem is solved.  Because of the disk problems my
incoming mail is also down, so thanks to anyone else who sent solutions that
didn't get through yet.
David


