From: Dave Barnum <dave@leaplab.com>
Subject: Re: Making a Bridging firewall
Date: Mon, 12 Apr 2004 10:47:55 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <407AD64B.4010605@leaplab.com>
References: <407AD23A.3030905@leaplab.com> <407AD469.1000101@shorewall.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <407AD469.1000101@shorewall.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Tom Eastep wrote:

> Dave Barnum wrote:
>
>> Hello.. I've been wanting to rewrite my firewall for a little bit but 
>> i'm not that familiar with iptables..  Up until now i've had a 
>> shorewall based firewall that also did bridging between my gateway 
>> and a VPN gateway over the internet (to link our houses.)  I used the 
>> bridge-nf patch on the 2.4 kernel to be able to manage the bridge 
>> traffic and block certain broadcast packets (like DHCP)  I've now 
>> upgraded to the 2.6 kernel because i heard it may fix some other 
>> issues i was having but now my bridge (DHCP blocking) rules no longer 
>> work... I'd like to get rid of shorewall and write my own IPTables in 
>> the hopes that i could get my ability to control the bridge back.  
>> Can anyone make any suggestions, or point to a guide that does this 
>> with the 2.6 kernel?
>
>
> Shorewall 2.0.1 contains bridge/firewall support -- it works well with 
> 2.6 kernels.
>
> -Tom

Hmm, Perhaps i will give it a shot.  I was running into a problem with 
my current installation (1.4.8) where the "All All REJECT" policy would 
reject anything coming from the bridge (br0)  I could not figure out 
what rule/policy to add in to get it to work.. but when i did "ALL ALL 
ACCEPT" it would work fine.


