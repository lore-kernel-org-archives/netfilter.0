From: netfilter_user <netfilter_user@o2.pl>
Subject: Re[2]: SNMP and IPTABLES
Date: Sun, 3 Aug 2003 23:55:14 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1417368385.20030803235514@o2.pl>
References: <Pine.LNX.4.44.0308021426450.16350-100000@localhost>
Reply-To: netfilter_user <netfilter_user@o2.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0308021426450.16350-100000@localhost>
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
To: Chris Wilson <chris@netservers.co.uk>
Cc: netfilter@lists.netfilter.org

Hello Chris,

Saturday, August 2, 2003, 3:28:14 PM, you wrote:

CW> Hello netfilter_user,

>> BUT: the problem is when MRTG try to receive SNMP information from this
>> same machine that is installed ( MRTG is installed on Linux machine -
>> gateway). I dont know why because i set: iptables -A INPUT -i eth1 -p tcp -m multiport --dport 21,80,161,3128 -j ACCEPT
>>                                          iptables -A INPUT -i eth1 -p udp -m multiport --dport 80,67,161 -j ACCEPT
>>                               ...and it should resolve problem...but
>>                               it wont
>> 
>> !!!!!THIS IS IMPORTANT!!!!
>> when I set all INPUT ACCETP then it works. So there is no problem with
>> snmp and MRTG but with my iptables config :/

CW> The kernel will route packets for the local machine over the "lo" device, 
CW> not any ethernet interface. You haven't allowed packets in from the "lo" 
CW> device, which is why SNMP (and probably other things such as pinging 
CW> yourself) won't work.

CW>   iptables -I INPUT -i lo -j ACCEPT

CW> Cheers, Chris.

Wise advice... ofcourse it helped. Thanks alot.

-- 
Best regards,
mailto:netfilter_user@o2.pl


