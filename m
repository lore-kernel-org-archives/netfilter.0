From: Philip Craig <philipc@snapgear.com>
Subject: Re: How to differentiate packets generated locally or received from
 t	he network using the NF_IP_PRE_ROUTING filter
Date: Tue, 06 Apr 2004 10:11:43 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4071F5BF.50806@snapgear.com>
References: <2F1FC1DEA077D5119FAD00508BCFD6D20BBB0110@zsc3c030.us.nortel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <2F1FC1DEA077D5119FAD00508BCFD6D20BBB0110@zsc3c030.us.nortel.com>
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
To: George Gao <ggao@nortelnetworks.com>
Cc: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

George Gao wrote:
> Is there any way to differentiate a local IP Multicast or IP brocast from an
> inbound mal-formed packet with the exact same content? Thanks much in
> advance!

Use '-m pkttype --pkt-type multicast' and '-m pkttype --pkt-type broadcast'.

-- 
Philip Craig - SnapGear, A CyberGuard Company - http://www.SnapGear.com


