From: Ramin Alidousti <ramin@cannon.eng.us.uu.net>
Subject: Re: (no subject)
Date: Wed, 26 Jun 2002 08:16:53 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020626121653.GB1755@cannon.eng.us.uu.net>
References: <F120TRqf69aZbLAX3cf0000000a@hotmail.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <F120TRqf69aZbLAX3cf0000000a@hotmail.com>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: caroline kenny <caroline_kenny@hotmail.com>
Cc: netfilter@lists.samba.org

On Wed, Jun 26, 2002 at 09:11:08AM +0100, caroline kenny wrote:

> 
> 
> Hello users,
> 
> I am using the iptables-1.2.5 package and I was wondering if anyone out 
> there can tell me if it is possible to perform some action if a firewall 
> rule is hit.
> For example, I have a rule set up to deny sending traffic from my box to a 
> certain destination. If I attempt to send traffic to this destination, the 
> rule will drop the traffic. But i was wondering is there any way a script 
> can be run when this trffic is rejected...I havent seen this done anywhere 
> and I really dont think that its possible but I said that I would just 
> check it out.

You can use ulog to send the packet to the user space where you can do
anything including launching a script based on a certain packet.

You also can use the LOG functionality and scan the log file and trigger
a script upon the detection of a certain log entry...

Ramin

> 
> Thanks for the help!
> Caroline
> 
> _________________________________________________________________
> Send and receive Hotmail on your mobile device: http://mobile.msn.com
> 

