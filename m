From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: DNAT Problem
Date: Thu, 22 Apr 2004 20:13:26 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404222013.26552.Antony@Soft-Solutions.co.uk>
References: <1611.80.0.0.23.1082351242.squirrel@80.0.0.175> <200404221421.44015.Antony@Soft-Solutions.co.uk> <13723.80.0.0.2.1082657890.squirrel@202.149.196.178>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <13723.80.0.0.2.1082657890.squirrel@202.149.196.178>
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

On Thursday 22 April 2004 7:18 pm, test@seaconindia.com wrote:

> > > iptables -t nat -A PREROUTING -i eth1 -p tcp --dport 25 -j DNAT --to
> > > 192.168.0.6:25
> >
> > I don't believe that can be your complete ruleset.
> >
> > I see nothing wrong with the above rule as it stands, however on its own
> > it's not much good - you need a FORWARD rule to allow packets through to
> > the mail server as well.
>
> Can you give me an example of the forward rule set.

iptables -A FORWARD -d a.b.c.d -p tcp --dport 25 -j ACCEPT

where a.b.c.d is the real (internal) IP address of your mail server.

> > Anyway, I thought (I may be mistaken) that the problem was not with the
> > inbound DNAT, but with SNAT?

I repeat the statement immediately above.

> Or shall I attach my complete bash script ? (is it ok ?)

Please do post the smallest ruleset which demonstrates the problem (ie it 
allows access to your internal mailserver, but all accesses appear to be from 
the firewall's IP address).

Regards,

Antony.

-- 
"The problem with television is that the people must sit and keep their eyes 
glued on a screen; the average American family hasn't time for it."

 - Report in the New York Times, following a demonstration at the 1939 World's 
Fair.

                                                     Please reply to the list;
                                                           please don't CC me.


