From: "IT Clown" <iptables@mailbox.co.za>
Subject: Re: network range
Date: Sat, 03 Apr 2004 22:53:00 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <web-275929490@mail01.infosat.net>
References: <web-275892654@mail01.infosat.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <web-275892654@mail01.infosat.net>
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
To: netfilter@lists.netfilter.org

How can i create a chaine and a rule that will block all
the non routed network ranges from entering the network
from the external interface incase someones trying to spoof
you?

when one 

On Sat, 03 Apr 2004 21:35:21 +0200
 "IT Clown" <iptables@mailbox.co.za> wrote:
> Hi
> 
> How do you specifiy more than one netwrk range in a rule,
> is it possible? 
> 
> i want to do the following:
> iptables -A INPUT -s 10.0.0.0/8 169.254.0.0/16 -j DROP
> 
> Regards
> _______________________________________________________
> Herbalife Independent Distributor www.healthiest.co.za
> 

_______________________________________________________
Herbalife Independent Distributor www.healthiest.co.za

