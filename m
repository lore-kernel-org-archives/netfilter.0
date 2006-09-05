From: Dmitri <dk-netfilter@nth.ca>
Subject: Re: matching -d to a given interface without specifying ip address
Date: Tue, 05 Sep 2006 00:42:37 -0400
Message-ID: <44FD003D.7080509@nth.ca>
References: <009601c6cfdf$c4406910$0101000a@tanjian>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <009601c6cfdf$c4406910$0101000a@tanjian>
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

Rob Sterenborg wrote:
>> Is there a way to define a condition "those packets whose destination
>> is the IP address of the given interface" without specifying the
>> actual IP address? (it changes, thus needs to be detected and updated)
> 
> No. -d expects an IP address.
I was looking for a (non-existent) option like 
--dest-ip-address-matches-that-of eth1. Meaning the connection is 
addressed to the box, as opposed to passing through it to some other 
machine but to the same port.

The problem with specifying an IP is that it may change, which breaks 
the rules and requires an update (and detection as well). Event for a 
static IP, that's an extra dependency to watch out for.

> What is it exactly what you want to accomplish?

Maybe this is contrived and not a good method..

I want the above-described kind of option, to pick out and DNAT 
connections on a certain port (say, http) directed at the box, but not 
those on the same port but directed elsewhere (like google being 
accessed through the box being the gateway). Purpose - to 
DNAT-encapsulate some service by the box.

(It doesn't matter from which direction it came, on which interface, its 
contents, etc. - only the destination ip.)

If i say "-d <ip.of.the.box> --dport 80 -j DNAT ..", that works, but it 
introduces the unwanted dependency on the actual IP value.

If i say "-i <interface> --dport 80..." for an internal interface, that 
catches anything, whether it was meant for the box or google.

Thanks,
--Dmitri

