From: "Philippe Dhont   (Sea-ro)" <Philippe.Dhont@searo.be>
Subject: NAT question
Date: Wed, 9 Apr 2003 11:51:44 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <B5747F3DB39FD411884B00B0D07808CCB6CA01@server10>
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
To: netfilter@lists.netfilter.org

I added 
$IPTABLES -t nat -A POSTROUTING -j SNAT --to-source 10.165.165.165 

Now when i ping from 10.51.13.13 on eth0 side to 10.165.1.60 then i can see
via tcpdump that on eth1 the 10.165.1.60 is seeking the 10.165.165.165 
"arp who-has 10.165.165.165 tell 10.165.1.60" is what i get.
So i guess that this means that iptables changed the address ?
So the firewall doesn't knows that it converted the ip number before and
can't send a reply to the correct ip address where it originally came from

How can i make this work so that if i ping to 10.165.1.60 that i can get a
reply ?
AND that the NAT thing did its work ?
And no, i can't use ipforwarding because of a security issue.

Regards,


	--tronstr@xsomic--



