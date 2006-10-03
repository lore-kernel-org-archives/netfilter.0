From: "Nathan @ Netdigix Systems" <lists@netdigix.com>
Subject: Re: newbie - load balancing with iptables
Date: Tue, 03 Oct 2006 08:19:03 -0700
Message-ID: <1159888743.45227f674127f@mail.dreamtoy.net>
References: <004b01c6e698$51107b90$580110ac@HO.lippogeneral.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <004b01c6e698$51107b90$580110ac@HO.lippogeneral.com>
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
To: winanjaya@lippogeneral.com
Cc: netfilter@lists.netfilter.org

you should use keepalived or ultramonkey

otherwise check out http://www.netfilter.org/patch-o-matic/pom-extra.html

Quoting Winanjaya <winanjaya@lippogeneral.com>:

> 
> Dear All,
> 
> I am very new with this, I am running squid with transparent proxy on my
> FC1, it is also as client's gateway
> my FC1 has 2 NICs .. Eth0 and Eth1 .. how to load balancing? .. Internet
> browsing service should be taken on Eth0 and for other services such as port
> 25, 110, 21, 389, 53 etc .. should be taken on Eth1 ..
> 
> Can I do this with iptables? .. please help
> 
> Thanks a lot in advance
> 
> Regards
> Winanjaya
> 
> 
> ***********************
> No virus was detected in the attachment (no filename).
> 
> Your mail has been scanned by InterScan.
> ***********-***********
> 
> 





thanks and best regards,
- Nathan
- http://www.netdigix.com


