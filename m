From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: How to bind 2 WAN 1 LAN ?
Date: Thu, 24 Oct 2002 10:57:29 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200210240957.g9O9vcL04037@vulcan.rissington.net>
References: <000b01c27b1e$36efdd80$5101a8c0@dinyi.com.tw>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000b01c27b1e$36efdd80$5101a8c0@dinyi.com.tw>
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
To: netfilter@lists.samba.org

On Thursday 24 October 2002 6:25 am, ?? wrote:

> Dear all...
>
> I'm a Chinese and I don't think that my English is well .

Don't worry.   I'm sure it will get better :-)

> I have a Linux server (Turbo Linux7.0 in kernel 2.4.9-3) to be my NAT
> server .
> I have make it running iptables-1.2.2-6 .
> It have 3 NIC(Network interface Card) eth0.eth1.eth2 .
> I have 1 LAN and 2 WAN interface they are 192.168.1.0/255.255.255.0 and 2
> ADSL (one of my ADSL is pppoe another one is static IP) .
> Now I want to bind thy all in my NAT server .
> I rty to cut my LAN to 4 part are 192.168.1.0/255.255.255.192 &
> 192.168.1.64/255.255.255.192 & 192.168.1.128/255.255.255.192 &
> 192.168.1.192/255.255.255.192 .
>
> That I wish the preceding 3 part go out and in with the pppoe ADSL (ppp0)
> and the final part go through with static IP(because they are my servers) .

You need to use iproute2 to set up source-based policy routing.

Netfilter will not change the routing of your packets for you, therefore it 
will not help you do what you want.

Iproute2 will let you set up a more complicated routing table than the 
standard 'route' command, and then netfilter will happily process the packets 
as they go through.

Antony.

-- 

Never write it in Perl if you can do it in Awk.
Never do it in Awk if sed can handle it.
Never use sed when tr can do the job.
Never invoke tr when cat is sufficient.
Avoid using cat whenever possible.

