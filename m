From: "Alexander Economou" <aecon@gnet.gr>
Subject: Re: port forwarding not working
Date: Thu, 15 Apr 2004 17:28:02 +0300 (EEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <33770.212.251.31.59.1082039282.squirrel@newmail.gnet.gr>
References: <004601c422f1$9162a3c0$ce00a8c0@xppro1>
    <1082038036.23863.41.camel@raylinux.internal>
Reply-To: aecon@gnet.gr
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1082038036.23863.41.camel@raylinux.internal>
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
To: Ray Leach <raymondl@knowledgefactory.co.za>
Cc: netfilter@lists.netfilter.org

0                                                                                                                                                  


> On Thu, 2004-04-15 at 15:57, Nick Vazirianis wrote:
>> iptables v1.2.8
>> Linux Fedora Core 1
>> Kernel 2.6.3
>>
>> I am having some trouble getting port forwarding within the attached
>> script.
>>  Please refer the line starting     # enable port forwarding for
>> BitTorrent
>> Incoming packets to these ports are being dropped (and logged) by the
>> section lower down in the script, I have tried adding the enable port
>>  forward section in different parts of the script, but this makes no
>> difference.
>>
>> could soneone please help, I even tried adding the line
>> $IPTABLES -A INPUT -i $EXT_IF -p tcp --dport 6881:6885 -j ACCEPT
>> but i believe this only allows incoming into the firwall and not
>> redirecting to another host
>>
>> someone please help
> Maybe the source s not 6881 ...
> $IPTABLES -A FORWARD -s 6881 -p tcp --dport 6881 -j ACCEPT
> try
> $IPTABLES -A FORWARD -p tcp --dport 6881 -j ACCEPT
> instead
> --
> --
> Raymond Leach <raymondl@knowledgefactory.co.za>
> Network Support Specialist
> http://www.knowledgefactory.co.za
> "lynx -source http://www.rchq.co.za/raymondl.asc | gpg --import"
> Key fingerprint = 7209 A695 9EE0 E971 A9AD  00EE 8757 EE47 F06F FB28
> --
>
If i understood well , you have a linux firewall with a dmz ip and you
want to redirect traffic from a real ip to lan ip of your network.If i am
correct then you should do :

iptables -t nat -F
iptables -t nat -A POSTROUTING -o dmzinterface -j MASQUERADE

iptables -t nat -A PREROUTING -p tcp -d dmzip --dport 6181 -j DNAT --to
lanip:6181

iptables -t nat -A PREROUTING -p tcp -d dmzip --dport 6182 -j DNAT --to
lanip:6182

etc etc
dmzinterface is the interface with the real ip eg eth0

-- 
Alexander Economou


