From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Redirecting from one ip to another problem
Date: Fri, 25 Jun 2004 10:51:52 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406251051.52171.Antony@Soft-Solutions.co.uk>
References: <627ED3D5182532448B61510FFAB3D37F10A941@srvdc01.jade.local>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <627ED3D5182532448B61510FFAB3D37F10A941@srvdc01.jade.local>
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

On Friday 25 June 2004 10:39 am, Mark C. Casey wrote:

> The address of the firewall/gateway on eth1 is 172.16.0.254.
> The 172.16.0.2 will only exist so the webserver can see 192.168.0.1 as
> 172.16.0.2. Ideally i'd want it working on a number of ports (or just
> redirect the ip).
>
> For example 1433/tcp, 5000-5025/tcp etc.

In that case adjust the "--dport 3306" which I suggested earlier (assuming 
that you just needed MySQL access).

> How do I do the "If it's imaginary, you need to apply that address to eth1
> on the firewall, then do:"?

ip addr add 172.16.0.2 dev eth1

Regards,

Antony.

> -----Original Message-----
> From: netfilter-admin@lists.netfilter.org
> [mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Antony Stone
> Sent: 25 June 2004 10:21
> To: netfilter@lists.netfilter.org
> Subject: Re: Redirecting from one ip to another problem
>
> On Friday 25 June 2004 9:31 am, Mark C. Casey wrote:
> > I'm in the process of replacing the current firewall with an IPCop
> > machine, however i'm needing to replicate one rule that is causing me
> > something of a headache. On eth0 is the router (connected to the net), on
> > eth1 is a webserver on eth2 is a switch which is connected upto the lan.
> >
> > The ip address of the webserver is 172.16.0.1.
> >
> > On eth2 is a sql server with the ip address of 192.168.0.1.
> >
> > The current firewall has it setup so that when connecting to 172.16.0.2
> > redirects the traffic to 192.168.0.1 and so the webserver is able to
> > access the sql server without ever knowing its real ip address.
> >
> > How can this be replicated using IPTables?  All my attempts thus far have
> > failed miserably to replicate this.
>
> Is address 172.16.0.2 that of the firewall, or is it an imaginary address?
>
> If it's imaginary, you need to apply that address to eth1 on the firewall,
> then do:
>
> iptables -A PREROUTING -t nat -s 172.16.0.1 -d 172.16.0.2 -p tcp --dport
> 3306 -j DNAT --to 192.168.0.1
> iptables -A FORWARD -s 172.16.0.1 -d 192.168.0.1 -p tcp --dport 3306 -j
> ACCEPT
>
> Regards,
>
> Antony.

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


