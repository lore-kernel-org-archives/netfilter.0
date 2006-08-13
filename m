From: Brian Lewis <bsl04@uark.edu>
Subject: Re: port redirection
Date: Sun, 13 Aug 2006 02:54:04 -0500
Message-ID: <20060813025404.47434f1a.bsl04@uark.edu>
References: <20060812191819.8d677f6c.bsl04@uark.edu>
	<87d5b5cg4w.fsf@newton.gmurray.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-bounces@lists.netfilter.org>
In-reply-to: <87d5b5cg4w.fsf@newton.gmurray.org.uk>
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

On Sun, 13 Aug 2006 07:18:55 +0100
Graham Murray <graham@gmurray.org.uk> wrote:

> Brian Lewis <bsl04@uark.edu> writes:
> 
> > I run a servlet container that wants to listen on TCP 8080. I want to
> > redirect TCP 80 on my machine to 8080 on the same machine.
> >
> > If I do -t nat -I PREROUTING -i $IF -d $IP -p tcp --dport 80 -j REDIRECT
> > --to-port 8080, it works in that I reach the 8080 server when I connect
> > to 80.
> >
> > But I have to allow 8080 through. Is there a way to provide access to the
> > 8080 server via port 80 without having to allow 8080?
> 
> Would the following work?
> 
> iptables -t mangle -A PREROUTING -p tcp --dport 80 -j MARK
> --set-mark 1
> 
> iptables -A INPUT -m mark --mark 1 -j ACCEPT
> iptables -A INPUT -p tcp --dport 8080 -j DROP

That in conjuction with the REDIRECT rule seems to work well. Thank you.

