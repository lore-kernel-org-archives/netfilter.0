From: Paul Frieden <pfrieden@users.sourceforge.net>
Subject: Re: Firewall help
Date: Wed, 11 Dec 2002 16:00:02 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DF7B562.70902@users.sourceforge.net>
References: <000301c2a14e$7733f510$0114a8c0@CyberDawn.Net> <358420000.1039638027@wookie.shorewall.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <358420000.1039638027@wookie.shorewall.net>
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

I would also recommend looking at my project PacketFlow Firewall 
Generator.  You can download it from 
http://packetflowfw.sourceforge.net.  It generates rules from a simple 
XML configuration format.  It includes several examples, including 
single and multi DMZ configs.  It should be simple to modify one of 
these to your purposes.  It doesn't currently generate NAT rules, but 
I've found that they are fairly easy to make by hand.

PacketFlow is written in Python and uses libxml2.  Both of these should 
be included in RH8, so it shouldn't be any trouble.  If you have any 
questions, you can post them on the site and I'll help if I can.

Paul

Tom Eastep wrote:

>
>
> --On Wednesday, December 11, 2002 09:49:49 PM +0200 DeWet van Rooyen 
> <dewet@cyberdawn.co.za> wrote:
>
>> I installed a machine with Redhat 8 and are trying to set up a iptables
>> firewall with 2 internal segments (DMZ and internal network).
>> My machine have 3 Network cards.
>>
>>  Is this possible ?
>>
>>  I can seem to get all the segments to see each other. Can you give 
>> me an
>>  idea on how to do this. Is it just a question of routes / Nat and Arp
>>  entries ?
>>
>> DMZ - 192.168.1.0 / 255.255.255.0
>> Internal Network / 192.168.2.0 / 255.255.255.0
>> For the external interface, I have 64 ip addresses - 255.255.255.192
>>
>
> If you would be willing to forego using iptables directly, take a look 
> at http://shorewall.sf.net/three-interface.htm.
>
> -Tom
> -- 
> Tom Eastep   \ Shorewall - iptables made easy
> Shoreline,    \ http://shorewall.sf.net
> Washington USA \ teastep@shorewall.net
>
>



