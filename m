From: <skmail@mcewen.wcnet.org>
Subject: Re: Forward rule can't specify destination address?
Date: Thu, 6 Jun 2002 17:00:39 -0400 (EDT)
Sender: netfilter-admin@lists.samba.org
Message-ID: <Pine.LNX.4.33.0206061652320.24520-100000@mcewen.wcnet.org>
References: <200206062042.g56KgfA04579@Networker.rockstone.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <200206062042.g56KgfA04579@Networker.rockstone.co.uk>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Antony Stone <Antony@Soft-Solutions.co.uk>
Cc: netfilter@lists.samba.org

Hmm... that sheds some light on stuff.  I think I'll have to rewrite my 
firewall rules now.  :)

I specified the SNAT also because connections are initiated to the
internet from it, and they must come from a specific internet IP address.  
It's doing this for several machines on an internal network. They only 
have a handful of addresses assigned to them.  Each address is assigned 
specifically to a user, and a general one for the firewall.  Each user has 
to come from a unique tracked IP to login to a remote system.  Don't ask 
why, that's the way they set it up on their end. 

I didn't know that the return would be done automatically though, so I'm 
glad you cleared that up.  I do have rules for that also in other places 
in my firewall script that don't need to be there.



On Thu, 6 Jun 2002, Antony Stone wrote:

> On Thursday 06 June 2002 9:36 pm, skmail@mcewen.wcnet.org wrote:
> 
> > I'm NAT'ing it also.  Should have put these in my first email I guess.
> >
> > $IPTB -A FORWARD -d 1.2.3.4 -p tcp --dport 3389 -j ACCEPT
> >
> > $IPTB -t nat -A PREROUTING -d 1.2.3.4  -p tcp --dport 3389 -j DNAT
> > --to 192.168.0.1
> 
> Okay, so 1.2.3.4 is your original address, and 192.168.0.1 is what you have 
> after it's been translated...
> 
> > $IPTB -t nat -A POSTROUTING -s 192.168.0.1 -d ! 192.168.0.0/24 -j SNAT
> > --to 1.2.3.4
> 
> Just out of interest, why do you specify this as well ?   Does the internal 
> server sometimes initiate connections as well ?
> 
> You don't need to have this rule if the internal machine only ever *receives* 
> connections from the outside (eg a web server).   The reverse translation 
> gets done automatically for you by netfilter.
> 
> > Prerouting before forwarding?  So I need to specify 192.168.0.1 as the
> > destination in the forward rule?
> 
> Yes :-)
> 
> 
> Antony.
> 


