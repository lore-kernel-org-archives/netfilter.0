From: Art Reisman <astormchaser2002@yahoo.com>
Subject: Re: tcpdump behavior not getting all packets in promisc mode
Date: Mon, 3 Jun 2002 06:36:12 -0700 (PDT)
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020603133612.47251.qmail@web10404.mail.yahoo.com>
References: <007a01c20ac1$3071b780$4000a8c0@thought>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <007a01c20ac1$3071b780$4000a8c0@thought>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.samba.org

Thanks for the advice , I have not read all the
responses yet. I'll likely not get mess with this
unitl MTN time evening, and I'll publish my findings
no matter how bone headed, because this is maddenning!


Yes I know this is not quite on topic , but I'm geting
there, before I can use iptables the way I wanted ,
this was sort of background work.

Here is my topology


T1----->Gateway---->Hub-------Wireless----->PC1
                     |
                     |------>eth0---->PC2--->TCPDUMP
                                     (SUSE Linux)


The hub is stupid, not switched.

I see ARP packets, but nothing specific for host PC1
in
the tcpdump on PC2. 

PC1 and PC2 have static IP addresses.


I am in the process of trying a few more things, and
if I have to I'll get down into the ethernet driver
and put fricking print statements!





__________________________________________________
Do You Yahoo!?
Yahoo! - Official partner of 2002 FIFA World Cup
http://fifaworldcup.yahoo.com

