From: "hare ram" <hareram@sol.net.in>
Subject: Re: iptables -m time does not work
Date: Wed, 6 Nov 2002 10:11:02 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <006001c2854e$b630f400$43723fca@nextto>
References: <E187c2V-0001ft-00@kashyyyk.netfilter.org> <aq1b78$lc5$1@hermes.vibe.ac>
Reply-To: "hare ram" <hareram@sol.net.in>
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
To: Udo Rader <spamtrash2@vibe.ac>
Cc: netfilter@lists.samba.org

Hi

even i too have same problem
iam able to see .o file and .so file
and when i say make manuconfig, it show the the limit and time in netfilter

but when i give this option iam not able to
but iam using redhat 7.3

hare
----- Original Message -----
From: "Udo Rader" <spamtrash2@vibe.ac>
Newsgroups: netfilter.users
To: <netfilter@lists.netfilter.org>
Sent: Sunday, November 03, 2002 1:36 AM
Subject: Re: iptables -m time does not work


> hi,
>
> I bet you have the same problem that I had with the string-module.
>
> look at your /var/log/syslog and check if there are complains about
> a missing ipt_time module.
>
> If so, the solution is simple: Your kernel is very probably not patched
> for the time module.
>
> udo
>
> On Fri, 01 Nov 2002 14:20:15 +0000, Torsten Puls wrote:
>
> > Hello
> >
> > My Problem
> > After input of dis order I get the following error message:
> >
> > iptables -A INPUT -m time --timestart 08:00 --timestop 16:00 --days
Mon -j ACCEPT
> > iptables: No chain/target/match by that name
> >
> > Why?
> >
> > Regards
>
>
>


