From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: Forward UDP broadcast
Date: Tue, 3 Jun 2003 15:49:11 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A0D6D96@wardrive.citadelcomputer.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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

Umm.. broadcasts don't route which is probably why it doesn't work. Your =
basically trying to use iptables as a bridging mechanism where you =
really need a bridge.

If the rule didn't work and there is no p-o-m to do something funky like =
this then I think your out of luck.. but I might be wrong..

Thanks,
____________________________________________
George Vieira
Systems Manager
georgev@citadelcomputer.com.au

Citadel Computer Systems Pty Ltd
http://www.citadelcomputer.com.au
=20

-----Original Message-----
From: Rommy Taslim [mailto:rommyt@transportservices.com.au]
Sent: Tuesday, June 03, 2003 3:29 PM
To: netfilter@lists.netfilter.org
Subject: Forward UDP broadcast


Hi,

Anyone knows how to forward UDP broadcast using iptables ?
I need to do something like ipportfw does:
ipportfw -A -u 192.168.4.255/699 -R 192.168.2.255/699

which forward all the broadcast on network 4 for port 699 to network 2.

I have something like this for iptables:

iptables -t nat -A PREROUTING -p udp \
        -d 192.168.4.255 --dport 699 \
        --to-destination 192.168.2.255:699

But it didn't work.

Anyone can give me some pointers ??

Thanks in advance.

Rommy


