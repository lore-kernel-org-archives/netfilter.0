From: "Carlo Florendo" <carlo@hq.astra.ph>
Subject: Re: DNAT from an IP address that does not exist to another that exists
Date: Wed, 30 Jul 2003 12:06:26 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <008601c3564f$f2b3ca60$200aa8c0@thorin>
References: <09B04A55822EFF4DA48D2E0BB2941D4A0192D4@wardrive.citadelcomputer.com.au>
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
Content-Type: text/plain; charset="us-ascii"
To: George Vieira <georgev@citadelcomputer.com.au>, netfilter@lists.netfilter.org

Hello George,

Thanks a lot for this!!!!!  That was fast!!!!   I tried your first post and was about to send a follow up when you immediately sent
the modified syntax.

Everything works well now.

Thanks so much!  :-)

Best Regards,

Carlo
------
Carlo Florendo
Astra Philippines Inc.
URL: http://www.hq.astra.ph







----- Original Message -----
From: "George Vieira" <georgev@citadelcomputer.com.au>
To: "George Vieira" <georgev@citadelcomputer.com.au>; "Carlo Florendo" <carlo@hq.astra.ph>; <netfilter@lists.netfilter.org>
Sent: Wednesday, July 30, 2003 11:48 AM
Subject: RE: DNAT from an IP address that does not exist to another that exists


sorry, foot in mouth... syntax was wrong..

iptables -I PREROUTING  -t nat -s 192.168.30.0/24 -i $INTDEV -d 192.168.40.40 -j DNAT --to 192.168.30.11
iptables -I POSTROUTING -t nat -s 192.168.30.0/24 -o $INTDEV -d 192.168.30.11 -j SNAT --to 192.168.30.1

I think that's better...


Thanks,
____________________________________________
George Vieira
Systems Manager
georgev@citadelcomputer.com.au

Citadel Computer Systems Pty Ltd
http://www.citadelcomputer.com.au

Phone   : +61 2 9955 2644
HelpDesk: +61 2 9955 2698


-----Original Message-----
From: George Vieira
Sent: Wednesday, July 30, 2003 1:41 PM
To: Carlo Florendo; netfilter@lists.netfilter.org
Subject: RE: DNAT from an IP address that does not exist to another that
exists


You must

iptables -I PREROUTING  -t nat -s 192.168.30.0/24 -i $INTDEV -d 192.168.40.40 -j DNAT --to 192.168.40.40
iptables -I POSTROUTING -t nat -s 192.168.30.0/24 -d 192.168.40.40 -j SNAT --to 192.168.30.1

so basically your masquerading the internal users like you would if the server was outside, you replace the source IP with the masq
server so the 192.168.40.40 (192.168.30.11) machine knows it MUST send it back via the gateway and NOT DIRECT to the 192.168.30.X
user...



