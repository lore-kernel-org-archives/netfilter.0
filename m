From: "Linux" <linux@usermail.com>
Subject: Re: Forward all traffic to another Public address
Date: Sun, 8 Dec 2002 17:27:18 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <005f01c29f19$bf988dc0$b22826d8@bfons>
References: <002b01c29b16$58d97fb0$d318b2a1@IBMCMDCTR004> <001301c29e57$d9307490$992826d8@bfons> <1039368044.9597.9.camel@localhost.localdomain>
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

Actually,

I will be making the DNS change and only want all traffic to forward while
propagation takes place.  Would propagation be any faster if I lower the
TTL?  If so, this would make it a non-issue.

Linux303

----- Original Message -----
From: "Ben Russo" <ben@umialumni.com>
To: "Linux" <linux@usermail.com>
Sent: Sunday, December 08, 2002 10:20 AM
Subject: Re: Forward all traffic to another Public address


> I don't know about the iptables,
> But one thing I can tell you from experience setting up LOTS of servers
> in data centers is to make complex use of DNS.
> 1.  When setting up a server give it a canonical name that relates to
> the server and it's location.
> 2.  Assign seperate CNAME's for the services, even sometimes multiple
> CNAME's for the same service.  For example "us-popmail.myservers.net"
> "eu-popmail.myservers.net" "webmail.myservers.net" "www.myservers.net"
> etc.
> 3.  Then you might have all of these DNS entries referring to the same
> box at first. But later, if you evern need (for scalability or for
> distribution or for redundancy) to have more than one machine, your
> users/clients software won't need to be reconfigured, you can instead
> just change DNS and the clients won't be the wiser.
>
> So, with regards to the stuff below you should change DNS MX and A
> records appropriately, IP redirection isn't the right way to do this.
>
> On Sat, 2002-12-07 at 12:15, Linux wrote:
> > Does anyone have any imput on this?  Also, would iptables be the best
> > way to redirect the traffic?  I don't have access to the router.
> >
> > Linux
> >         ----- Original Message -----
> >         From: Linux
> >         To: netfilter@lists.netfilter.org
> >         Sent: Tuesday, December 03, 2002 2:52 PM
> >         Subject: Forward all traffic to another Public address
> >
> >         Hello All,
> >
> >         I am freaking going crazy and pulling my hair out.  Here is I
> >         want to do.
> >         Forward all traffic (smtp, pop3, web,etc) for one IP address
> >         in Server box located in CA to a Server in TX
> >         These boxes are on separate networks.
> >         Here is what I did
> >
> >         iptables -t nat -A PREROUTING -s 216.x.x.x -d 238.x.x.x -m
> >         state --state RELATED,ESTABLISHED -j MASQ
> >         iptables -t nat -A PREROUTING -d 238.x.x.x -j DNAT --to
> >         216.x.x.x
> >
> >
> >         Can someone please help me as I cannot figure out what I am
> >         doing wrong.
> >
> >
> >         Thank you,
> >
> >         Linux
> --
> Ben Russo <ben@umialumni.com>
>


