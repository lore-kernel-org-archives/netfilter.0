From: "Seferovic Edvin" <edvin.seferovic@kolp.at>
Subject: RE: iptables mac destination filtering
Date: Thu, 28 Apr 2005 11:55:17 +0200
Message-ID: <22864.5901232541$1114681864@news.gmane.org>
References: <1114681174.5821.19.camel@dhcp0-103.erasme.lan>
Reply-To: edvin.seferovic@kolp.at
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1114681174.5821.19.camel@dhcp0-103.erasme.lan>
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

Hi,

I suppose it is because you do NOT know the destination MAC address. The
dest MAC address is found out first when the packets get out of iptables and
go to the NIC. Besides - you cannot find out the MAC address of the host
that is reachable over i.e. 3 hops. Recall the OSI layer system and it
should be clear. 

I think I am not wrong here. If so, please correct me.

Regards,

Edvin Seferovic

-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Thomas Turquois
Sent: Donnerstag, 28. April 2005 11:40
To: netfilter@lists.netfilter.org
Subject: iptables mac destination filtering

Hi,

I would like to know why it's not possible to filter on mac destination
address with iptables.

Thanks.




