From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Internal ip exiting network on firewall external nic despight rule
Date: Sat, 21 Sep 2002 00:01:33 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020920230140.RKRZ10370.mta02-svc.ntlworld.com@there>
References: <000101c260f4$c5861260$0801a8c0@s3ac>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000101c260f4$c5861260$0801a8c0@s3ac>
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

On Friday 20 September 2002 11:26 pm, Rowan Reid wrote:

> > I think the problem is your physical network setup - you should not have a
> > direct link between the internal and external interfaces of your firewall.
>
> True, but shouldn't I be able to separate the networks using subnets

No, not the way you might think.

I agree that everything you have put in your ruleset (except for the 
misunderstanding about INPUT vs. FORWARD, which I think we've now sorted 
out), makes sense and looks like it ought to work, but only if you physically 
separate your networks.

If you do not use two separate switches / hubs for the internal & external 
interfaces of your firewall, then it will not behave the way you expect it to.

> Since I'm cheap I don?t want to purchase another hub, I have my T1....

You have a T1 connections and you don't want to pay for another hub ?

Okay, but don't be surprised if your firewall doesn't work like that....

Sorry.

Antony.

-- 

It is also possible that putting the birds in a laboratory setting
inadvertently renders them relatively incompetent.

 - Daniel C Dennett

