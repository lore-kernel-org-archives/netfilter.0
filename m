From: "Eric Joe" <sysop@tje1.com>
Subject: Re: redirection
Date: Tue, 8 Apr 2003 18:49:32 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <43075.208.33.29.212.1049842172.squirrel@www.tje1.com>
References: <Pine.LNX.4.44.0304081443120.28439-100000@ns2.tje1.com>
        <200304082140.27919.lyra@fastwebnet.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200304082140.27919.lyra@fastwebnet.it>
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
To: lyra@fastwebnet.it
Cc: netfilter@lists.netfilter.org

I didnt catch the fact that you need the source address. Are you tracking
this for a reason? You can probably have iptables log the source address.
This does in fact work, been using it for  about 6 months now. Let me post
my exact rules (IPs are obsfucated)

iptables -t nat -A PREROUTING -i eth0 -s 192.168.1.0/24 -p tcp --dport 80
-d 192.168.1.7 -j DNAT --to 192.168.1.7

iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -d 192.168.1.7 -j
DNAT --to 192.168.1.11:80
iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to 192.168.1.7


Regards
Eric






-- 
Eric Joe
Network Operations
Journey's End Internet/Computer Connection Inc

> On Tuesday 08 April 2003 08:44 pm, Eric Joe wrote:
>
>> Do this
>>
>>
>> iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -d x.y.z.1 -j
>> DNAT --to x.y.z.2:80
>>
>> iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to x.y.z.1
>
> am i wrong or i loose the original connection source address?
>
> if i check the log in x.y.z.2 i see connections from x.y.z.1.
> I really need to preserve the source address.
> Thank you very much
> xchris




