From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: Forward to DMZ addresses
Date: Thu, 18 Aug 2005 14:49:37 -0500
Message-ID: <4304E651.1050807@riverviewtech.net>
References: <57933.67.53.150.63.1123957195.squirrel@mail.innovativesource.net>	<430028A8.3090508@riverviewtech.net>	<22055.206.166.83.50.1124208942.squirrel@mail.innovativesource.net>	<4302D0F1.8030005@riverviewtech.net>	<19817.206.166.83.50.1124294643.squirrel@mail.innovativesource.net>	<43042660.7090405@riverviewtech.net>
	<39173.206.166.83.50.1124389983.squirrel@mail.innovativesource.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <39173.206.166.83.50.1124389983.squirrel@mail.innovativesource.net>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Disclaimer:  I'm at the office and I can not give a proper reply now so more will follow later.

> Ok, I'm starting to see the logic...I think
> 
> I'm not sure about 2 of the examples
> 
> iptables -t nat -A PREROUTING -i ${WAN} -d ${ExternalIP} -j DNAT
> --to-destination
> ${DMZServerIP}
> 
> Is $ExternalIP the external IP of the firewall or the dmz machine?

Umm...  I have, possibly incorrectly, been operating under the assumption that they were one in the same.  I was believing that you were wanting your firewall, with the ExternalIP, to forward any traffic that was not related to your LAN's internet traffic over to your DMZ server.  Thus I was going that route for a solution.  Let me go reread what you have sent. ... (reading) ... Ok, see if you agree with how I'm restating what you said earlier.

     Router WAN interface = xx.yy.yy.241
     Router LAN connected to DMZ switch = xx.xx.xx.183 (IP Network = xx.xx.xx.182)

  Firewall eth1 connected to ?????????? = xx.xx.xx.184 (IP Network = xx.xx.xx.182)
  Firewall eth2 connected to DMZ switch = xx.xx.xx.185 (IP Network = xx.xx.xx.182)
DMZ server eth0 connected to DMZ switch = xx.xx.xx.186 (IP Network = xx.xx.xx.182)

  Firewall eth0 connected to LAN switch = 10.123.x.x

As I'm looking (closer) at what you said earlier I have a question.  You say that eth1 on your firewall is connected to your router.  Is that connection via a cross over cable or via a cable plugged in to the the DMZ switch?  If eth1 is connected to the DMZ switch what is the difference between eth1 and eth2 on your firewall?  I'm sort of believing that eth1 is connected to the router via a cross over cable and yet the router and the DMZ systems are on the same IP subnet, or at least it appears that way from the IPs that each piece of equipment has.

Do you have a subnet of IPs or just a handful of IPs allocated to you by your provider that are accessible via the xx.yy.yy.241 IP?  I have a feeling that part of your problem is that you are trying to break routing by using routing.  If you are wanting to break routing you will need to bridge some things together.  However I don't think you do have a block of IP addresses unless you have a block of 16 that ends with 191 being the broadcast IP (xx.xx.xx.176-191).  Depending on what you have and what you want to achieve decides the way that this problem can be solved.  The more that I look at it the more it looks like you have a circuit from a provider who has provided you with a small group of IPs.  Is this the case?  Are the IPs in question in a subnet or just a scattering of them?

> iptables -t filter -A FORWARD -i ${DMZ} -o ${LAN} -s ${DMZServerIP} -j ACCEPT
> 
> I'm understanding this as "all any packets from the DMZ to the LAN".  I
> would prefer to not allow DMZ->LAN, i.e. using FORWARD, could I not do
> 
> iptables -t filter -A FORWARD -i ${DMZ} -o ${LAN} -m state --state
> ESTABLISHED,RELATED -s ${DMZServerIP} -j ACCEPT

Yes you could do that with out any problem.  Most of my clients want full access to their DMZ systems and they also want them to have full access to their LAN yet they want them on a different subnet.

> **normally I would just try it, but I'm not near the server right now...

*nod*  I understand completely.

> iptables -t nat -A POSTROUTING -o eth1 -j SNAT --to-source xx.yy.yy.240
> 
> wouldn't this SNAT everything outgoing, even the DMZ traffic?  I'll have
> about 5 servers on the DMZ once this is all working

I think this question may become a moot point once you answer my question(s) above.  This had to do with me thinking that your ExternalIP and the IP of the firewall system were one in the same.



Grant. . . .

