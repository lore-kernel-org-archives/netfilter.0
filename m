From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Instructions on how to redirect port 80 to port 8080
Date: Tue, 17 Feb 2004 19:30:37 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200402171930.37729.Antony@Soft-Solutions.co.uk>
References: <9908FCB837A50642B74E2BEC198843095CC64A@csrees-exchsrvb.csrees.usda.gov> <1077044692.2402.51.camel@pepelui.baicom> <1077045002.2397.54.camel@pepelui.baicom>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1077045002.2397.54.camel@pepelui.baicom>
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
To: Netfilter <netfilter@lists.netfilter.org>

On Tuesday 17 February 2004 7:10 pm, Alexis wrote:

> iptables -t nat -A PREROUTING -p tcp --dport 80 -j DNAT --to
> x.x.x.x:8080

You might prefer to use REDIRECT - it's like DNAT, but only allows you to 
specify the port number, and forces the IP address to the local machine:

iptables -A PREROUTING -t nat -d a.b.c.d -p tcp --dport 80 -j REDIRECT --to 
8080

(Note that I've added a "-d a.b.c.d" where a.b.c.d is the IP address of the 
machine with the rule on it - otherwise it would redirect *all* TCP port 80 
traffic, whether it was originally addressed to this machine or somewhere 
else.)

Regards,

Antony.

> On Tue, 2004-02-17 at 16:04, Alexis wrote:
> > iptables -t mangle -A PREROUTING -p tcp --dport 80 -j DNAT --to
> > x.x.x.x:8080
> >
> > could be a start :)
> >
> > On Tue, 2004-02-17 at 15:55, Martinez, Michael wrote:
> > > Guys -
> > >
> > > I'm finding a lack of documentation describing how to do this. It ought
> > > to be simple. I know how to do it with ipchains.
> > >
> > > On a redhat linux system using /etc/sysconfig/iptables, what line(s) do
> > > I add to /etc/sysconfig/iptables to configure to redirect all inbound
> > > port 80 traffic to port 8080 on the same host?
> > >
> > > Thank  you -
> > >
> > > Regards,
> > >
> > > Michael Martinez
> > > ISTM/CSREES
> > > United States Department of Agriculture
> > > ---
> > > This email is signed with my digital signature so that you may verify
> > > the authenticity of the sender.

-- 
These clients are often infected by viruses or other malware and need to be 
fixed.  If not, the user at that client needs to be fixed...

 - Henrik Nordstrom, on Squid user's mailing list

                                                     Please reply to the list;
                                                           please don't CC me.


