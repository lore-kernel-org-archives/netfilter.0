From: George Nychis <gnychis@cmu.edu>
Subject: Re: getting random and average to accept decimals?
Date: Fri, 28 Apr 2006 22:16:06 -0400
Message-ID: <4452CC66.40402@cmu.edu>
References: <33064.128.2.140.234.1146248997.squirrel@128.2.140.234>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <33064.128.2.140.234.1146248997.squirrel@128.2.140.234>
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
To: George P Nychis <gnychis@cmu.edu>
Cc: netfilter@lists.netfilter.org

Daniel made a really helpful suggestion on #iptables to solve my problem:

iptables -N CENTAPKT; iptables -A INPUT -m random --average 1 -j 
CENTAPKT; iptables -A CENTAPKT -m random --average 1 -j DROP

yey, 0.01% packet loss :)

George P Nychis wrote:
> Hi,
> 
> I need a very high precision loss model, and right now it seems as though --average can only accept integer numbers
> 
> I would for example like to introduce .01% packet loss, .1% packet loss, 1% packet loss, 1.5% packet loss ... except it seemas though out of that set, i would only be able to do 1% packet loss
> 
> lanthanum-ini ~ # iptables -A FORWARD -p all -m random --average .25 -j DROP
> iptables v1.3.5: bad --average `.25', must be between 1 and 99
> Try `iptables -h' or 'iptables --help' for more information.
> 
> is there any way i can get higher precision?
> 
> Thanks!
> George
> 
> 
> 

