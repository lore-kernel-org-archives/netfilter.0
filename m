From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: active connections
Date: Mon, 3 May 2004 17:11:49 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405031711.49579.Antony@Soft-Solutions.co.uk>
References: <BAY15-F25y82gv5Gmz800010514@hotmail.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <BAY15-F25y82gv5Gmz800010514@hotmail.com>
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

On Monday 03 May 2004 4:43 pm, azeem ahmad wrote:


> > > hi all
> > > i m having a problem that i m using MASQUERADING on a redhat 8.0 box
> > > with iptables. the problem is that when i want the users to be
> > > disconnected i flush iptables; the new connections dont get established
> > > but the current active connections dont break. like if a user is
> > > downloading msn messenger for example and i flush iptables, this user's
> > > connection dont break. so what i can do to break the active connection
> > > please help me out
> >
> > From: "Alexis" <alexis@tpys.com.ar>
> >
> > and they will, this is conntrack :)
> > try unload the module and thats it
>
> thanks
> but i m a student so i want to caputure the concept also. so please tell me
> the mystery or tell me about any tutorial about it.

Current connections ("ESTABLISHED" in connection tracking terms) are 
handled in the background, and not by your ruleset (your rules only deal with 
the first packet of a connection).   Therefore changing the ruleset makes no 
difference to connections which are already established.

For more info on how netfilter's connection tracking works:

http://iptables-tutorial.frozentux.net/iptables-tutorial.html#STATEMACHINE
http://www.sns.ias.edu/~jns/security/iptables/iptables_conntrack.html

Regards,

Antony.

-- 
Behind the counter a boy with a shaven head stared vacantly into space,
a dozen spikes of microsoft protruding from the socket behind his ear.

 - William Gibson, Neuromancer (1984)

                                                     Please reply to the list;
                                                           please don't CC me.


