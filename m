From: ypresente@mrv.com (Yaron Presente)
Subject: Re: DNAT & ARP
Date: Mon, 19 Jul 2004 17:16:13 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40FBD7AD.4060403@mrv.com>
References: <40FA4845.8030802@mrv.com> <1090234023.27791.10.camel@localhost>
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------010608060300060401050401"
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
To: "John A. Sullivan III" <jsullivan@opensourcedevelopmentcorp.com>
Cc: netfilter@lists.netfilter.org


--------------010608060300060401050401
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Hi John,
Thanks for your reply.
However, I'm not sure that it solves my problem (unless I misunderstood 
you).
Looking at your numeric example, let's say that I want to DNAT from 
10.1.1.0/24 to 1.1.1.0/24,
and that my public interface address is 10.1.1.5.
I need to reply to ARP for all hosts in 10.1.1.0/24, but without proxy 
arp I will only reply to my own address 10.1.1.5.
I don't think that adding the private range (1.1.1.0/24) to the public 
interface will do any good :(
Thanks,
Yaron

John A. Sullivan III wrote:

>On Sun, 2004-07-18 at 05:52, Yaron Presente wrote:
>  
>
>>Hi All,
>>I have a linux box (Montavista 2.4.18), which is connected to the 
>>external world through an IP subnet A.
>>I want to DNAT this subnet A to a private subnet B, and to do this I 
>>need to support proxy arp for hosts in class A, which don't actually exist.
>>My problems are all ARP related:
>>1. I want to reply on ARP requests for hosts on subnet A. looking at the 
>>arp code in net/ipv4/arp.c, it seems that
>>this should have been the default behaviour (i.e 
>>(rt->rt_flags&RTCF_DNAT) behaves the same as if a proxy arp was defined
>>on the interface). However, testing shows that the linux doesn't reply. 
>>why ?
>>2. To overcome the first problem, I can enable proxy arp explicitly. 
>>However, proxy arp does not answer to requests if the
>>routing lookup shows that the target is located on the incoming 
>>interface of the request. any ideas?
>>3. If there are real hosts of subnet A on my external interface, I do 
>>not want to serve as proxy arp for them.
>>is there a way to define these exceptions to the proxy arp? can I set a 
>>big proxy_delay in /proc and hope that the real host would
>>answer before my proxy?
>>Any help would be appreciated.
>>Thanks,
>>Yaron
>>    
>>
>
>If I understand you correctly, it is a pretty straightforward DNAT with
>exactly the proxy ARP issues you describe.  I typically handle this by
>binding the DNAT address to the public NIC using iproute2.  For example,
>if I NAT 10.1.1.5 to 1.1.1.5, I have the appropriate DNAT rule in
>iptables and then do a 
>
>ip address add 1.1.1.5/24 brd + dev eth0
>
>or whatever parameters are appropriate.  I'm not sure if the brd + is
>necessary if I already have an address for the same subnet bound to the
>NIC.  Perhaps someone else can comment.
>
>Once ISCS is available (http://iscs.sourceforge.net), it will
>automatically handle the ARP configuration when you assign a public
>address to a private host.  In fact, that code works now along with
>almost all the access control portion.  Good luck with it - John
>  
>

-- 
Yaron Presente
MRV International
Direct   : 972-4-9936237
Fax      : 972-4-9890564
Email   : ypresente@mrv.com
www.mrv.com





--------------010608060300060401050401
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: 7bit

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <title></title>
</head>
<body>
Hi John,<br>
Thanks for your reply.<br>
However, I'm not sure that it solves my problem (unless I misunderstood you).<br>
Looking at your numeric example, let's say that I want to DNAT from 10.1.1.0/24
to 1.1.1.0/24,<br>
and that my public interface address is 10.1.1.5. <br>
I need to reply to ARP for all hosts in 10.1.1.0/24, but without proxy arp
I will only reply to my own address 10.1.1.5.<br>
I don't think that adding the private range (1.1.1.0/24) to the public interface
will do any good :(<br>
Thanks,<br>
Yaron<br>
<br>
John A. Sullivan III wrote:<br>
<blockquote type="cite" cite="mid1090234023.27791.10.camel@localhost">
  <pre wrap="">On Sun, 2004-07-18 at 05:52, Yaron Presente wrote:
  </pre>
  <blockquote type="cite">
    <pre wrap="">Hi All,
I have a linux box (Montavista 2.4.18), which is connected to the 
external world through an IP subnet A.
I want to DNAT this subnet A to a private subnet B, and to do this I 
need to support proxy arp for hosts in class A, which don't actually exist.
My problems are all ARP related:
1. I want to reply on ARP requests for hosts on subnet A. looking at the 
arp code in net/ipv4/arp.c, it seems that
this should have been the default behaviour (i.e 
(rt-&gt;rt_flags&amp;RTCF_DNAT) behaves the same as if a proxy arp was defined
on the interface). However, testing shows that the linux doesn't reply. 
why ?
2. To overcome the first problem, I can enable proxy arp explicitly. 
However, proxy arp does not answer to requests if the
routing lookup shows that the target is located on the incoming 
interface of the request. any ideas?
3. If there are real hosts of subnet A on my external interface, I do 
not want to serve as proxy arp for them.
is there a way to define these exceptions to the proxy arp? can I set a 
big proxy_delay in /proc and hope that the real host would
answer before my proxy?
Any help would be appreciated.
Thanks,
Yaron
    </pre>
  </blockquote>
  <pre wrap=""><!---->
If I understand you correctly, it is a pretty straightforward DNAT with
exactly the proxy ARP issues you describe.  I typically handle this by
binding the DNAT address to the public NIC using iproute2.  For example,
if I NAT 10.1.1.5 to 1.1.1.5, I have the appropriate DNAT rule in
iptables and then do a 

ip address add 1.1.1.5/24 brd + dev eth0

or whatever parameters are appropriate.  I'm not sure if the brd + is
necessary if I already have an address for the same subnet bound to the
NIC.  Perhaps someone else can comment.

Once ISCS is available (<a class="moz-txt-link-freetext" href="http://iscs.sourceforge.net">http://iscs.sourceforge.net</a>), it will
automatically handle the ARP configuration when you assign a public
address to a private host.  In fact, that code works now along with
almost all the access control portion.  Good luck with it - John
  </pre>
</blockquote>
<br>
<pre class="moz-signature" cols="$mailwrapcol">-- 
Yaron Presente
MRV International
Direct   : 972-4-9936237
Fax      : 972-4-9890564
Email   : <a class="moz-txt-link-abbreviated" href="mailto:ypresente@mrv.com">ypresente@mrv.com</a>
<a class="moz-txt-link-abbreviated" href="http://www.mrv.com">www.mrv.com</a>


</pre>
<br>
</body>
</html>

--------------010608060300060401050401--


