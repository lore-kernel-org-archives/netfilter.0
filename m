From: ypresente@mrv.com (Yaron Presente)
Subject: Re: DNAT & ARP
Date: Mon, 19 Jul 2004 18:31:26 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40FBE94E.3030209@mrv.com>
References: <40FA4845.8030802@mrv.com> <1090234023.27791.10.camel@localhost>	 <40FBD7AD.4060403@mrv.com> <1090248902.27794.41.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: "John A. Sullivan III" <jsullivan@opensourcedevelopmentcorp.com>
Cc: netfilter@lists.netfilter.org

Hi John,
OK, That's exactly what I'm trying to do and the idea is interesting.
However, there are 2 problems that I currently see in this solution:
a. I need to know exactly which hosts of the 1.1.1.0/24 are fake and to 
explicitly
define them on eth0. I cannot add the whole range because I may get into 
conflict
with real 1.1.1.0/24 hosts that are located on my eth0 interface.
b. because there are many secondaries on eth0 that belong to the same 
subnet,
I can not guarantee that my host will always use the right one (1.1.1.5) 
to talk to the outer world.
Am I right?
Yaron

John A. Sullivan III wrote:

>Yes, I think there is some misunderstanding there.  My apologies. Let me
>be a little more specific.
>
>Let's assume that you have a gateway with a public address of 1.1.1.5 on
>the network 1.1.1.0/24 and bound to interface eth0 and that it protects
>the private network 10.1.1.0/24 with a second interface, eth1, to which
>is bound the private address 10.1.1.1.  Now let's also say that I have
>internal hosts at 10.1.1.8, 10.1.1.3, 10.1.1.6 and 10.1.1.13.  I wish to
>NAT these to the world at the addresses 1.1.1.8,1.1.1.3, 1.1.1.6 and
>1.1.1.13 respectively.  Is that what you are trying to do?
>
>To do so, I would create a script on the NAT gateway to run the
>commands:
>
>ip address add 1.1.1.8/24 brd + dev eth0
>ip address add 1.1.1.3/24 brd + dev eth0
>ip address add 1.1.1.6/24 brd + dev eth0
>ip address add 1.1.1.13/24 brd + dev eth0
>
>eth0 will now respond to ARP requests for all those addresses as well as
>1.1.1.5.  The subsequent packets will be dutifully passed to netfilter
>which will NAT them to 10.1.1.8, 10.1.1.3, 10.1.1.6 and 10.1.1.13 and
>route them on their way (assuming forwarding is enabled).
>
>I hope I have not misunderstood what you are trying to do - John
>
>On Mon, 2004-07-19 at 10:16, Yaron Presente wrote:
>  
>
>>Hi John,
>>Thanks for your reply.
>>However, I'm not sure that it solves my problem (unless I
>>misunderstood you).
>>Looking at your numeric example, let's say that I want to DNAT from
>>10.1.1.0/24 to 1.1.1.0/24,
>>and that my public interface address is 10.1.1.5. 
>>I need to reply to ARP for all hosts in 10.1.1.0/24, but without proxy
>>arp I will only reply to my own address 10.1.1.5.
>>I don't think that adding the private range (1.1.1.0/24) to the public
>>interface will do any good :(
>>Thanks,
>>Yaron
>>
>>John A. Sullivan III wrote:
>>    
>>
>>>On Sun, 2004-07-18 at 05:52, Yaron Presente wrote:
>>>  
>>>      
>>>
>>>>Hi All,
>>>>I have a linux box (Montavista 2.4.18), which is connected to the 
>>>>external world through an IP subnet A.
>>>>I want to DNAT this subnet A to a private subnet B, and to do this I 
>>>>need to support proxy arp for hosts in class A, which don't actually exist.
>>>>My problems are all ARP related:
>>>>1. I want to reply on ARP requests for hosts on subnet A. looking at the 
>>>>arp code in net/ipv4/arp.c, it seems that
>>>>this should have been the default behaviour (i.e 
>>>>(rt->rt_flags&RTCF_DNAT) behaves the same as if a proxy arp was defined
>>>>on the interface). However, testing shows that the linux doesn't reply. 
>>>>why ?
>>>>2. To overcome the first problem, I can enable proxy arp explicitly. 
>>>>However, proxy arp does not answer to requests if the
>>>>routing lookup shows that the target is located on the incoming 
>>>>interface of the request. any ideas?
>>>>3. If there are real hosts of subnet A on my external interface, I do 
>>>>not want to serve as proxy arp for them.
>>>>is there a way to define these exceptions to the proxy arp? can I set a 
>>>>big proxy_delay in /proc and hope that the real host would
>>>>answer before my proxy?
>>>>Any help would be appreciated.
>>>>Thanks,
>>>>Yaron
>>>>    
>>>>        
>>>>
>>>If I understand you correctly, it is a pretty straightforward DNAT with
>>>exactly the proxy ARP issues you describe.  I typically handle this by
>>>binding the DNAT address to the public NIC using iproute2.  For example,
>>>if I NAT 10.1.1.5 to 1.1.1.5, I have the appropriate DNAT rule in
>>>iptables and then do a 
>>>
>>>ip address add 1.1.1.5/24 brd + dev eth0
>>>
>>>or whatever parameters are appropriate.  I'm not sure if the brd + is
>>>necessary if I already have an address for the same subnet bound to the
>>>NIC.  Perhaps someone else can comment.
>>>
>>>Once ISCS is available (http://iscs.sourceforge.net), it will
>>>automatically handle the ARP configuration when you assign a public
>>>address to a private host.  In fact, that code works now along with
>>>almost all the access control portion.  Good luck with it - John
>>>  
>>>      
>>>
>>-- 
>>Yaron Presente
>>MRV International
>>Direct   : 972-4-9936237
>>Fax      : 972-4-9890564
>>Email   : ypresente@mrv.com
>>www.mrv.com
>>    
>>

-- 
Yaron Presente
MRV International
Direct   : 972-4-9936237
Fax      : 972-4-9890564
Email   : ypresente@mrv.com
www.mrv.com






