From: Scott van Looy <scott@ethosuk.org.uk>
Subject: Re: throttling an internal IP's upstream bandwidth
Date: Sun, 18 Feb 2007 12:33:50 +0000 (GMT)
Message-ID: <Pine.LNX.4.64.0702181232550.32641@novak.ethosuk.org.uk>
References: <Pine.LNX.4.64.0702091134220.18820@novak.ethosuk.org.uk>
	<45D83C7C.6000501@rtij.nl>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <45D83C7C.6000501@rtij.nl>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
Cc: netfilter@lists.netfilter.org

Today Martijn Lievaart did spake thusly:

> Scott van Looy wrote:
>> 
>> I'm on DSL, I only have small upstream and big downstream. Everything goes 
>> through a 1:1 NAT iptables firewall - so internal IPs are directly mapped 
>> to an external IP. I want to throttle the internal upstream bandwidth so 
>> the internal machines can't upload at more than 25k/s as the maxing out of 
>> the upstream is killing the much faster downstream...is there a way to do 
>> this using iptables?
>> 
>
> Google for wondershaper.

I use wondershaper, it doesn't let me throttle on a per machine basis tho 
- I want the firewall to only allow a max of 25k out for each of my 
internal machines

-- 
Scott van Looy - email:me@ethosuk.org.uk | web:www.ethosuk.org.uk
site:www.freakcity.net - the in place for outcasts since 2003
PGP Fingerprint: 7180 5543 C6C4 747B 7E74  802C 7CF9 E526 44D9 D4A7
       -------------------------------------------
       |/// /// /// /// WIDE LOAD /// /// /// ///|
       -------------------------------------------

Guillotine, n.:
 	A French chopping center.

