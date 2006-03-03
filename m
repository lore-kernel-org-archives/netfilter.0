From: "Sandeep Agarwal" <sandeep_agarwal@hotmail.com>
Subject: How to use Real IP inside the LAN
Date: Fri, 3 Mar 2006 19:07:45 +0530
Message-ID: <BAY20-DAV63F1C2B14037920885A9497EA0@phx.gbl>
Reply-To: Sandeep Agarwal <sandeep_agarwal@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: netfilter <netfilter@lists.netfilter.org>

Dear All,

I have following setup.

ISP---->|eth0|Linux Box|eth1|------>|Switch|--->PC (LAN IP)
                                                            |--->VOIP Device 
(Cisco) (Real IP)
                                                            |--->WebServer 
(Real IP)

ISP has provided 8 IP Pool.
No DMZ configuration is there. Simple rc.firewall is working.
Now I want to use Real IP inside the LAN.
What is the right way to do this?

Will it be worthwhile, If I make aliases like eth1:1 & assign a Real IP from 
pool?
If this is ok, than which rules I have to add in iptables?

Thanks
Sandeep 

