From: Juan Hernandez <alucard@kanux.com>
Subject: Re: Help need :) How to delete all rules in chain ?
Date: Tue, 28 Sep 2004 15:26:21 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1096399581.1940.0.camel@alucard.kanux.com>
References: <1096400937.3163.134.camel@alkaloid.netup.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1096400937.3163.134.camel@alkaloid.netup.ru>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

iptables -F
On Tue, 2004-09-28 at 15:48, Abylai Ospan wrote:
> Hello, all !
> 
> May be this question in FAQ but I can't find it ;-( I have 3 (or more)
> identical rules in one (for example - INPUT) chain.
> If I do command:
> iptables -D FORWARD -s 10.0.0.10 -d 10.0.0.20 -j ACCEPT 
> 
> the first rule is deleted only. Is there any command line option to
> remove all identical rules in one chain ?
> 
> wbr, Abylai
> 
-- 

Juan Hernandez, RHCE SCSA
.knxTech C.A.
CC Los Chaguaramos, Ofc 16-10B      |  Tel: (58) 212-6624745
Los Chaguaramos, Caracas-Venezuela  |  Mobile: (58) 412-5821882

Programmin' Python is like sugar... Sweet ;)


