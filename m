From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: 1. Switch Flooding 2. Chains traversal
Date: Wed, 14 Sep 2005 01:05:18 -0500
Message-ID: <200509140105.18536.rob0@gmx.co.uk>
References: <acf1defa050913213555e04129@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <acf1defa050913213555e04129@mail.gmail.com>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

On Tuesday 2005-September-13 23:35, venkata subramanian wrote:
> 1. Switch Flooding
>        We have a nice problem in our organisation. Due to viruses,
> some windows machine or the other starts flooding the network with
> packets. And, in the end, one of our switches comes down making us to
> manually restart the switch.

What kind of traffic is it? I've not seen layer 2 problems with viral 
machines. Maybe we caught ours before it got that bad.

>        I don't (intuitively) see how iptables can help in this
> scenario.... But, I want to know whether any solution exists to this?

Don't allow Windows machines out to the Internet. :)

Unless you're going to have firewalls between the infected machines and 
the switches, I don't think you can stop it that way.

> If I make all the machine's gateway as a linux system, and rate limit
> the packets there will it help?

Most of these infections are either spyware or spamware (or both). The 
spamware can be slowed down (but not stopped) by not allowing Windows 
clients out on 25/tcp.

Spyware generally phones home on port 80/tcp, although this is not a 
sure thing. HTTP proxying can control this. Both the SMTP and HTTP 
controls can help identify infected machines for reinstallation.

I use DNS poisoning to limit the damage at some sites. My nameserver 
claims authority for certain known hostile domains, and points a 
wildcard A record at an internal server. The httpd error logs at that 
server rapidly fill up with 404's when infected machines are running.

> 2. Chain traversal
>        Why is this chain traversal looking complicated? if there is

Power! :)

> atleast one rule in every inbuilt chain, it seems that there are many
> possible permutations of the chain traversal.

For any given packet, no, it can only come out one way. (This offer 
void, where taxed or prohibited by law, or where you're using limiting 
or strange stuff like fuzzy or random matching.)

It's handy, also, knowing that each packet only hits one of the built- 
in chains. (With the caveat that loopback packets hit OUTPUT on the way 
out and then INPUT on the way in.)

> How do you guys manage with it?

Think of it like a programming language. That's a good analogy. You 
check for conditions and branch based upon the results.
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

