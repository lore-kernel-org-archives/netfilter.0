From: Scott MacKay <scottmackay@yahoo.com>
Subject: Re: Iptables not working with RH9
Date: Thu, 20 Nov 2003 08:17:30 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031120161730.99386.qmail@web13907.mail.yahoo.com>
References: <sfbc9d8f.047@pf.ueo.ohio-state.edu>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <sfbc9d8f.047@pf.ueo.ohio-state.edu>
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
To: Derek Storvik <dstorvik@pf.ueo.ohio-state.edu>, netfilter@lists.netfilter.org

Did you add on the iptables hook for bridging and
activate all the proper configuration settings?
I has a similar problem with 2.4.22 (under RH9)
because I forgot to  menuconfig and add in the proper
settings.

--- Derek Storvik <dstorvik@pf.ueo.ohio-state.edu>
wrote:
> Hello all
>   Hopefully someone can see my error.   
> I have been running RH7.3 with it's standard kernal
> version 2.4.18-3 for several months configured as a
> transparent bridging firewall. We recently purchased
> a new machine and wanted to install RH9 with its
> standard kernal 2.4.20( i think)I followed the same
> steps installed with iptables and bridging utils and
> used my same script file to setup the bridge with
> two nics and fill in all my rules. This didn't seem
> to work right and on further testing realized
> NOTHING was being filtered. I then rebooted and
> manualy set up the bridge and cleared all the tables
> and set the default policy to drop. SO at this point
> nothing should get through. Well it bridges
> everything, and the counters in iptables do not
> increment. The system acts as if it is not there
> what so ever.
> 
> here is the setup after the basic minimal install
> brctl addbr br0
> brctl addif br0 eth0
> brctl addif br0 eth1
> ifconfig eth1 0.0.0.0 promisc
> ifconfig eth0 0.0.0.0 promisc
> #bring up bridge with either of the next two
> commands
> ifconfig br0 up
> ip link set br0 up
> #both do the same thing  namely nothing
> iptables -X
> iptables -F
> iptables -P FORWARD DROP
> iptables -P INPUT DROP
> iptables -P OUTPUT DROP
> 
> This setup happily bridges packets right on through
> with no updates to the iptables counters.
> 
> I have been experimenting with devil linux as well
> recently and it exhibits the same problem. 
> 
> ip_forwarding is set to 0  as it has been on my
> working rh7.3 machine I tried setting it to 1 but
> that didn't help the problems. Im not 100% sure what
> exactl the ip_forwarding property corresponds to
> anyway.
> 
> any help would be greatly appreciated!
>    Thanks
>          Derek
> 
> 


__________________________________
Do you Yahoo!?
Free Pop-Up Blocker - Get it now
http://companion.yahoo.com/

