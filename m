From: William Knop <w_knop@hotmail.com>
Subject: iptables routing help
Date: Sat, 24 Jan 2004 16:25:15 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <CD650C0C-4EB3-11D8-8BD0-000A9577164C@hotmail.com>
Mime-Version: 1.0 (Apple Message framework v609)
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hello,
My dsl provider has my house on several subnets (ips obtained via dhcp, 
along with a netmask of 255.255.255.0), so I have had to screw around 
with each machine to make sure local traffic doesn't flood the dsl 
modem. To remedy this, I've been trying to set up a firewall box to 
basically reroute those three subnets as local, but I'm finding it very 
difficult. It seems like every doc out there only addresses nat, which 
is definitely not what we want. I'd greatly appreciate some help 
accomplishing this.

Thanks much,
William



