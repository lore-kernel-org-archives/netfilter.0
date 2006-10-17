From: piraguasu <grtruchet@gigared.com>
Subject: Re: Re: Can't get access remote LAN through firewall
Date: Tue, 17 Oct 2006 15:41:03 -0300
Message-ID: <453523BF.3020902@gigared.com>
References: <453178E2.5020602@gigared.com> <453233EB.3080404@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <453233EB.3080404@plouf.fr.eu.org>
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

Pascal Hambourg wrote:
> Hello,
>
>
>>
>> I have two LAN, both connected to Internet through proxy/firewall on 
>> Linux. One is my working LAN and other remote. I want to see internal 
>> machines of remote LAN from any computers of my LAN, for this I setup 
>> a tunnel and when the  firewall  is down in both LAN, all OK.
>>
>> When firewall is up, my problem is forwarding between tunnel device 
>> and internal card (eth1), I can't get pass through firewall, iptables 
>> rules don't work.
>
> Does the FORWARD chain contains rules which accept packets between the 
> tunnel interface and the LAN interface in both directions ?
>
> Something like :
> iptables -A FORWARD -i eth1 -o tun0 -j ACCEPT
> iptables -A FORWARD -i tun0 -o eth1 -j ACCEPT
>
>
Hi Pascal

Yes, the rules are:
#
# On my LAN

iptables -A FORWARD -i eth1 -s $MY_LAN -d $REMOTE_LAN -o tun0 -j ACCEPT
iptables -A FORWARD -i tun0 -s $REMOTE_LAN  -d $MY_LAN -o eth1 -j ACCEPT

#
# On remote LAN

iptables -A FORWARD -i eth1 -s $REMOTE_LAN -d $MY_LAN -o tun0 -j ACCEPT
iptables -A FORWARD -i tun0 -s $MY_LAN  -d $REMOTE_LAN -o eth1 -j ACCEPT


The packets can't gain access to tunnel tcpdump say me.

If you have any idea, wellcome ........
Thank you
Gerardo


