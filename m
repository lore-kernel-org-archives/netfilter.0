From: Stewart Thompson <stewart.thompson@shaw.ca>
Subject: RE: Multiple VPN Masquerading Works !! Thanks Everyone !
Date: Sun, 08 Sep 2002 19:04:53 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FLEKIPPLAEDMJMOOBBDPOEPPCNAA.stewart.thompson@shaw.ca>
References: <1031533259.3437.59.camel@hyperno>
Reply-To: stewart.thompson@shaw.ca
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <1031533259.3437.59.camel@hyperno>
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
To: Rommy Taslim <rommyt@transportservices.com.au>, netfilter@lists.netfilter.org


Rommy:

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Rommy Taslim
Sent: September 8, 2002 6:01 PM
To: netfilter@lists.netfilter.org
Subject: Multiple VPN Masquerading Works !! Thanks Everyone !

Hi All,

I just want to thank you all for the time and help to get my multiple
vpn masquerading works.

Thanks to Harald Welte, Rob Sterenborg, Stewart Thompson, hard_ware
(till now I don't really know your name, sorry), and anyone else that I
forgot to mention here (sorry about that) but have been helpfull for me.

Turns out my problem was because my routing isn't right. The pptp server
should have a default gateway to the netfilter box (like hard_ware
said), and also in my iptables rules I need to set the default rules to
DROP for INPUT and OUTPUT. I guess it won't work if we have ACCEPT for
all INPUT and OUTPUT when we try to do DNAT (correct me if I'm wrong).

Stu-This won't prevent things from working as long as you aren't trying to
forward and use the same ports on the Firewall Machine. Things won't
quite work the way you expect. Using the Drop Policy is just good
security. However, it is jut one facet of security. Disabling unused
functions, your hosts and access files etc are all part of it.

Well, that what I think. Sorry if I still got this all wrong. But the
main thing is my multiple vpn masquerading works fine now. Once again,
thanks to all of you guys that have spared some times to help me out. I
really appreciate it.
Glad to hear you got things straitened out.

Stu........



Regards,
Rommy



