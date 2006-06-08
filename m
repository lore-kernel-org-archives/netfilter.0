From: "robee" <mlody@elpec.com>
Subject: Re: iptables - resource temporary unavailable
Date: Thu, 8 Jun 2006 08:18:59 +0200
Message-ID: <002601c68ac3$7188bbc0$0e01050a@robee>
References: <000001c68abb$b71dd1a0$0101000a@sterenborg.info>
Reply-To: robee <mlody@elpec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: netfilter@lists.netfilter.org

----- Original Message ----- 
From: "Rob Sterenborg" <rob@sterenborg.info>
To: <netfilter@lists.netfilter.org>
Sent: Thursday, June 08, 2006 7:23 AM
Subject: RE: iptables - resource temporary unavailable

>> On 06/07/2006 05:54 PM, robee wrote:
>>> any time when i'm restarting my firewall rules (NAT mostly, about
>>> 500 users) i got this error -> iptables - resource temporary
>>> unavailable. but, if i unplug users (main switch off) and restart
>>> firewall everyting is fine my system is fedora core 4, iptables
>>> 1.3.5, kernel 2.6.16.18
>> I don't think it is lack of memory, the error message for that
>> includes the word memory.  Resource temporarily unavailable means
>> that something else is currently using the resource.  Is it
>> possible that another iptables instance is running at the same time?
> (Not that I know the solution, but..) Iptables is a userspace utility to
> setup rules. Once the rule is setup, iptables itself terminates and
> Netfilter (kernelspace) will use the rule.
> Although you could add the same rule multiple times (which is a bit
> useless..), AFAICS there's no way to have Netfilter "running" multiple
> times.
> But you do have a point: is the OP flushing all rules/deleting all
> user-chains when he is restarting the firewall script ?
> Gr,
> Rob

yes, the first rules are:

iptables -F
iptables -F -t nat
iptables -F -t mangle

but, the same time firewall is restarting there also pppoe server working. 
if-up.local file contain iptables rules also and it might be that iptables 
lines from firewall and from if-up.local script are running the same time.


robee


