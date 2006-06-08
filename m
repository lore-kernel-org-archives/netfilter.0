From: Philip Craig <philipc@snapgear.com>
Subject: Re: iptables - resource temporary unavailable
Date: Thu, 08 Jun 2006 17:39:14 +1000
Message-ID: <4487D422.7090707@snapgear.com>
References: <000001c68abb$b71dd1a0$0101000a@sterenborg.info>
	<002601c68ac3$7188bbc0$0e01050a@robee>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <002601c68ac3$7188bbc0$0e01050a@robee>
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
To: robee <mlody@elpec.com>
Cc: netfilter@lists.netfilter.org

On 06/08/2006 04:18 PM, robee wrote:
>> (Not that I know the solution, but..) Iptables is a userspace utility to
>> setup rules. Once the rule is setup, iptables itself terminates and
>> Netfilter (kernelspace) will use the rule.
>> Although you could add the same rule multiple times (which is a bit
>> useless..), AFAICS there's no way to have Netfilter "running" multiple
>> times.
>> But you do have a point: is the OP flushing all rules/deleting all
>> user-chains when he is restarting the firewall script ?
>> Gr,
>> Rob
> 
> yes, the first rules are:
> 
> iptables -F
> iptables -F -t nat
> iptables -F -t mangle
> 
> but, the same time firewall is restarting there also pppoe server working. 
> if-up.local file contain iptables rules also and it might be that iptables 
> lines from firewall and from if-up.local script are running the same time.

Yes, that is what I meant... the iptables userspace program has to use
a kernel interface to install the rules.  If another instance of the
iptables userspace program is currently installing some rules already,
then the kernel interface will be in use, and you'll get this error.
Or something like that; I haven't looked at the source code in detail.

I've never seen this error myself, but I use locking around all calls
to iptables.  You should be doing this anyway if you are using iptables
rather than iptables-restore, since your script's operation isn't
atomic if it calls iptables multiple times.

