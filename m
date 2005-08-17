From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Forward to DMZ addresses
Date: Wed, 17 Aug 2005 00:53:53 -0500
Message-ID: <4302D0F1.8030005@riverviewtech.net>
References: <57933.67.53.150.63.1123957195.squirrel@mail.innovativesource.net>	<430028A8.3090508@riverviewtech.net>
	<22055.206.166.83.50.1124208942.squirrel@mail.innovativesource.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <22055.206.166.83.50.1124208942.squirrel@mail.innovativesource.net>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

jonathan@innovativesource.net wrote:
> Kind of... I'm trying to redirect _any_ traffic destined for my DMZ
> address to be forwarded to the machines themselves.  I tried the rule you
> suggested, and I also realized that I had already tried that.
> 
> Basically, I want to forward any traffic destined for DMZ address pass the
> firewall and onto the DMZ machines themselves, well once they gone through
> some bad packet checks...

Ok, if you are wanting all traffic to be destined you will need to statefully inspect packets and return them to your LAN accordingly before you forward the traffic off to your DMZ server.  That is unless you have a different globally routable IP for your DMZ system than you do for your router.

You will probably need to DNAT in the PREROUTING chain for both inbound interfaces, your LAN and WAN connection.

> FYI, the rule didn't work as expected.  The following is my script thus far:
> 
> #************************************
> /sbin/modprobe ip_tables
> /sbin/modprobe ip_conntrack
> /sbin/modprobe ip_conntrack_ftp
> /sbin/modprobe iptable_filter
> /sbin/modprobe ipt_LOG
> /sbin/modprobe ipt_limit
> /sbin/modprobe iptable_nat
> /sbin/modprobe ipt_REJECT
> /sbin/modprobe ipt_state
> 
> #
> # Enable IP forwarding
> #
> 
> echo "1" > /proc/sys/net/ipv4/ip_forward
> 
> $ipt -F
> $ipt -X
> $ipt -Z
> 
> 
> $ipt -P INPUT DROP
> $ipt -P OUTPUT ACCEPT
> $ipt -P FORWARD DROP
> 
> ###########################################
> #
> # Rules
> #
> 
> #
> # Accept EST. and REL. packets
> #
> $ipt -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
> $ipt -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
> 
> #
> # Forward all from LAN through WAN
> #
> $ipt -A FORWARD -i $LAN_INTERFACE -o $WAN_INTERFACE -j ACCEPT
> 
> #
> # NAT all outgoing packets
> #
> $ipt -t nat -A POSTROUTING -o $WAN_INTERFACE  -j SNAT --to-source $WAN_IP

If your LAN is on a different subnet you could add an "-s <LAN subnet>" extension to this to make sure that you are only SNATing your LAN traffic.

> #
> # temp - this does the actual allowing of outgoing packets
> # from the dmz server... but it still nat's them... I don't want to nat
> # them, I want them to appear as they are
> #
> $ipt -A FORWARD -i $DMZ_INTERFACE -o $WAN_INTERFACE -j ACCEPT
> ############################################################
> #
> # Firewall specific rules
> #
> 
> #
> # Allow access from LAN to firewall
> #
> $ipt -A INPUT -i $LAN_INTERFACE -j ACCEPT
> 
> #
> # Save rules
> #
> /etc/init.d/iptables save
> 
> #************************************
> 
> this is basic, as I'm trying to take it one step at a time.  I'm currently
> dealing with 2 issues.  the one mentioned above...and the other is not
> NATing the outgoing DMZ packets...  I would like them to go out with their
> IP addresses...

I take it that your DMZ system is running a globally routable IP?  If this is the case can we get a list of said IPs (scrubbed if need be) for discussion?



Grant. . . .

