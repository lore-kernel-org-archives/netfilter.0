From: Frank Smith <fsmith@hoovers.com>
Subject: Re: Need help have some questions...
Date: Mon, 18 Aug 2003 16:14:39 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <70530000.1061241278@hoovers-59.hoovers.com>
References: <20030818201333.57194.qmail@web40202.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030818201333.57194.qmail@web40202.mail.yahoo.com>
Content-Disposition: inline
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
To: SBlaze <dagent.geo@yahoo.com>, nf <netfilter@lists.netfilter.org>

--On Monday, August 18, 2003 13:13:33 -0700 SBlaze <dagent.geo@yahoo.com> wrote:

> To Ralf, the netfilter team, and the whole of the OS community
> 
> How am I supposed to proxy apache? Why should I have to? Is it not a firewalls
> job to protect a system(and LAN behind it)? This is a very valid form of
> protection I'm asking for here.
> 
> A more detailed explanation of what I need is this and I know I'm not alone in
> this as I have been corresponding with people who want the very same thing(cc
> if ya our there lemme hear ya..post up with me here.)
> 
> Anyone who runs apache and logs(which is EVERYONE who runs apache unless they
> are brain dead or don't care about security) is constantly BOMBARDED DAILY with
> CODE/RED and NIMDA(and I'm sure other types of invalid requests they would like
> to protect against).

'Bombarded' is a relative term.  On a busy site they aren't even noticable
unless you're looking for them.

> Knowing this... and knowing that the discard service is a very nice and clean
> way to sort of send things like this to the great packet /dev/null , I do not
> think it is too much to ask that iptables provide me a way to keep those
> invalid requests AWAY from my web server. I should be able to route packets to
> the discard service without having to use the NAT table(although if that was
> even an option I would use it.) All my services run on ONE machine NAT should
> not be nessecery.
> 
>   If this can not be done I would love for someone to give me a half technical
> half lamen's terms explanation. I honestly don't think I'm asking so much of
> the  iptables firewall that I should have to go proxying things and
> circumventing things here and there.

You might want to take a look at http://www.securityfocus.com/infocus/1553
It's about IDS signatures, but it shows the complexity of the problem of
string-matching URLs due to path obuscation and character encoding, and
doesn't even mention that the URL could possibly be spread over fragmented
packets.
   Even with plain URL's, string matching takes time and CPU, increasing
the latency through your firewall.  You could probably do what you want
by shunting your port 80 packets to userspace and filtering it there.
   A proxy really is the best tool for the job, it already has everything
you need and is  well-optimized for the task.

Frank

> 
> Much Respect to the netfilter team and the OS Community
> SBlaze
> 

-- 
Frank Smith                                      fsmith@hoovers.com
Systems Administrator                           Voice: 512-374-4673
Hoover's Online                                   Fax: 512-374-4501


