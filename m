From: "Seferovic Edvin" <edvin.seferovic@kolp.at>
Subject: RE: iptables mac destination filtering
Date: Thu, 28 Apr 2005 12:14:21 +0200
Message-ID: <30400.5539780066$1114682969@news.gmane.org>
References: <01bf01c54bd9$94bcba30$6104a8c0@skqianyi>
Reply-To: edvin.seferovic@kolp.at
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <01bf01c54bd9$94bcba30$6104a8c0@skqianyi>
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

that is also what I wanted to say ;) Although netfilter is working on IP
layer, packages that come in, contain the source MAC address of the sender
so that is why for example the source MAC filtering works... right?

Regards,

Edvin Seferovic

-----Original Message-----
From: Yu Zhiguo [mailto:yuzg@nanjing-fnst.com] 
Sent: Donnerstag, 28. April 2005 12:04
To: edvin.seferovic@kolp.at; netfilter@lists.netfilter.org
Subject: Re: iptables mac destination filtering

Hello,

    For simply, this is because netfilter is working on IP layer.


----- Original Message ----- 

> Hi,
> 
> I suppose it is because you do NOT know the destination MAC address. The
> dest MAC address is found out first when the packets get out of iptables
and
> go to the NIC. Besides - you cannot find out the MAC address of the host
> that is reachable over i.e. 3 hops. Recall the OSI layer system and it
> should be clear. 
> 
> I think I am not wrong here. If so, please correct me.
> 
> Regards,
> 
> Edvin Seferovic
> 
> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org
> [mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Thomas
Turquois
> Sent: Donnerstag, 28. April 2005 11:40
> To: netfilter@lists.netfilter.org
> Subject: iptables mac destination filtering
> 
> Hi,
> 
> I would like to know why it's not possible to filter on mac destination
> address with iptables.
> 
> Thanks.
> 
> 
> 


