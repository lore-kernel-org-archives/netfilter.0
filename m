From: Ralf Spenneberg <lists@spenneberg.org>
Subject: Re: How to block all ports except port 21,22,80,8080 ???
Date: 18 Feb 2003 09:57:08 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1045558628.1967.29.camel@kermit.spenneberg.de>
References: <1045555939.94722.jacob_chan@so-net.net.tw>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1045555939.94722.jacob_chan@so-net.net.tw>
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
To: Netfilter <netfilter@lists.netfilter.org>

Am Die, 2003-02-18 um 09.12 schrieb jacob_chan:
> How to block all ports except port 21,22,80,8080 ???
> 
> Dear all,
> 
> I want to block all ports except port 21,22,80,8080.
Block for what? Input? What protocol? TCP? 
iptables -A INPUT -p tcp ! --dport 21,22,80,8080 -j DROP

Cheers,

Ralf
> 
> Any help appreciated.
> 
> Best regards,
> 
> Jacob
-- 
Ralf Spenneberg
RHCE, RHCX

IPsec/PPTP Kernels for Red Hat Linux:  
http://www.spenneberg.com/.net/.org/.de
Honeynet Project Mirror:                http://honeynet.spenneberg.org
Snort Mirror:                           http://snort.spenneberg.org

