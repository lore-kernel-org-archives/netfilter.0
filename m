From: =?ISO-8859-2?Q?J=F6rg_Harmuth?= <harmuth@mnemon.de>
Subject: Re: iptables local port forward
Date: Mon, 10 Oct 2005 16:41:46 +0200
Message-ID: <434A7DAA.6030306@mnemon.de>
References: <freemail.20050910153926.43612@fm17.freemail.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <freemail.20050910153926.43612@fm17.freemail.hu>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

dfgdfg dfgdf wrote:
> Hi 
> 
> I have a question about iptables port forward:
> I have the following rules which are working ok if I try it
> from outside
> but when I try it from the localhost (which is running the 
> iptables) it is not working ? 
> Does any body know why it isn't  working this way?
> and what is the solution ?
> 
> Thx a lot
> Anti
> ------------------
> # Redirect port 5900
> iptables -t nat -A PREROUTING -p tcp -d $LOCAL_IP --dport
> 5900 -j DNAT --to $OTHER_HOST_IP:5900
> 
> iptables -t nat -A POSTROUTING -o eth0 -p tcp -d
> $OTHER_HOST_IP --dport 5900 -j MASQUERADE


What *exactly* isn't working ? Do you mean, that eg

telnet $IP_OR_NAME_OF_IPTABLES_BOX 5900

doesn't connect you with $OTHER_HOST_IP:5900, if you issue this command 
on the iptables box itself ? If this is your question, well - iptables 
can't do this with your rule set (assuming that the rules you posted are 
only relevant rules). Locally generated packets never pass 
nat/PREROUTING. They pass nat/OUTPUT instead. See

http://iptables-tutorial.frozentux.net/chunkyhtml/c951.html

for details.

Joerg

