From: eribicic@sinectis.com <kisero@uolsinectis.com.ar>
Subject: RE: how to filter kazaa
Date: Wed, 21 May 2003 12:58:12 -0300 (GMT+3)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030521155812.B03D96C9B7@honorio.sinectis.com.ar>
Reply-To: kisero@uolsinectis.com.ar
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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
To: georgc@FARMINGDALE.EDU, jaws@skyinet.net, netfilter@lists.netfilter.org

isnt it easyer to filter ports 1214?

> The following rule has worked for me. 
> 
> http://www.securityfocus.com/infocus/1531
> 
> 
> $IPTABLES -A FORWARD -p tcp -m string --string X-Kazaa-Username: -j REJECT
> --reject-with tcp-reset
> 
> $IPTABLES -A FORWARD -p tcp -m string --string X-Kazaa-Network: -j REJECT
> --reject-with tcp-reset
> 
> $IPTABLES -A FORWARD -p tcp -m string --string X-Kazaa-IP: -j REJECT
> --reject-with tcp-reset
> 
> $IPTABLES -A FORWARD -p tcp -m string --string X-Kazaa-SupernodeIP: -j -j
> REJECT --reject-with tcp-reset
> 
> -----Original Message-----
> From: tracker [mailto:jaws@skyinet.net] 
> Sent: Wednesday, May 21, 2003 3:20 PM
> To: netfilter@lists.netfilter.org
> Subject: how to filter kazaa
> 
> Hi all,
> 
> Im new to this list and iptables. I would like to know how to filter kazaa.
> 
> Thanks.
> 
> Jaws
> 
> 
> 
-- 
Slds.

