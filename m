From: Sven Schuster <schuster.sven@gmx.de>
Subject: Re: mail relay
Date: Thu, 20 Mar 2003 17:00:36 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E79E5A4.50701@gmx.de>
References: <OFF04453C4.ECF4132D-ONC1256CEF.00548382-C1256CEF.00543F77@LocalDomain>
Mime-Version: 1.0
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
Cc: david@atd.es

david@atd.es wrote:

>
> Hi everybody,
> I would like to know how can I filter the mail relay received in my 
> port 25 with the firewall,..  I want only accept the packets from only 
> one ip, my ISP.
> This is possible this rule with iptables ??


If your mailserver is on the firewall itself, you should give this one a 
try (this is very
basic, one would usually add some more rules, set default policy to 
drop, then even
this rule wouldn't be right anymore):

iptables -A INPUT -p tcp --dport 25 -s ! 1.2.3.4 -j REJECT --reject-with 
tcp-reset


Sven



