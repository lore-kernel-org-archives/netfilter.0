From: "Collins, Kevin" <KCollins@nesbittengineering.com>
Subject: RE: (LONG) DNS/Router/Firewall question... SOLVED
Date: Fri, 14 Mar 2003 07:56:56 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <5DE7560BBF09D6119ED100B0D03D842601392C@MAIL-SERVER>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

On Thursday, March 13, 2003 6:24 PM, Elmshauser, Erik scribbled:

> > So the question is how do I allow the "Forward Lookups" to happen?
> > The first thing I noticed was that my original DNS rules only allowed
> > traffic between my ISP and me.  I've modified those rules to what you
see
> > below:
> > 
> > echo "   Allowing DNS Forward Lookups to take place..."
> > $IPTABLES -A OUTPUT -o $EXTIF -p udp -s $EXTIP --sport $UNPRIVPORTS \
> >           -d 0.0.0.0 --dport 53 -m state --state NEW -j ACCEPT
> > $IPTABLES -A INPUT -i $EXTIF -p udp -s 0.0.0.0 --sport $UNPRIVPORTS \
> >           -d $EXTIP --dport 53 -m state --state ESTABLISHED,RELATED \
> >           -j ACCEPT
> > 
> > But they don't work either.  What am I missing?
> > 
> 
> perhaps if you added the NEW state to the output rule it would
> let new connection out from the firewall?


THAT'S IT!!!  This fixed the problem!

On the very first Output rule in my script, I added the NEW state to the
exisiting ESTABLISHED,RELATED and everything just started clicking.  I don't
even the need the section that was supposed to allow DNS transactions!

Thanks for you astute observations and recommendation!

Kevin L. Collins, MCSE
Systems Manager
Nesbitt Engineering, Inc.

