From: "Dharmendra.T" <dharmu@nsecure.net>
Subject: Re: Multiple -d flags
Date: 13 Jan 2003 16:34:48 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1042455895.1886.3.camel@india>
References: <3E20826E.50308@mattiamartinello.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3E20826E.50308@mattiamartinello.com>
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
To: Mattia Martinello <mattia@mattiamartinello.com>
Cc: netfilter@lists.netfilter.org

On Sun, 2003-01-12 at 02:15, Mattia Martinello wrote:
> Hi
> 
> I wish to create a rule that allow a packet to a specified IP on a 
> specified port.
> 
> The rule:
> 
> iptables -A FORWARD -s 0.0.0.0/0 -d 213.21.136.8/255.255.255.255 -dport 
> 80 -j ACCEPT
> 
> shows me the following error:
> 
> iptables v1.2.5: multiple -d flags not allowed
> Try `iptables -h' or 'iptables --help' for more information.
> 
> How I can solve my problem?
> 
> Thank you very much
> Bye
> Mattia
> 
> 
You should specify --dport not "-dport"
REgards

-- 
Dharmendra.T
Linux Enthu


