From: Lane Powers <lpowers@mis.net>
Subject: Re: finding out the culprit ip
Date: Thu, 04 Sep 2003 15:49:01 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F57972D.7060709@mis.net>
References: <20030905183420.GA1850@linux.local> <006b01c37317$c1cfd0d0$0a90a8c0@zen>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <006b01c37317$c1cfd0d0$0a90a8c0@zen>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Payal Rathod <payal-iptables@staticky.com>
Cc: netfilter@lists.netfilter.org

Well, any easy quick way to identify the culprit, would simply be to use 
tcpdump...

according to 
http://securityresponse.symantec.com/avcenter/venc/data/w32.sobig.f@mm.html
sobig will attempt to get ntp at least once per hour

so something simple like;

tcpdump -n -i eth1 udp port 123 (assuming that eth1 is your internal 
interface and you aren't currently legitimately making outbound ntp 
requests on all your workstations :) )


or you could use netfilter to block the traffic and then check your logs


Lane
www.rstack.net

>>Hi,
>>A particular machine in my LAN is affected by SoBig virus and is sending
>>mails to remote sites. I need to find that IP. The only lead I have is
>>that it is that IP which is generating maximum SMTP traffic. How do I
>>find it out and block it (or maybe clean it)?
>>
>>Any ideas on this?
>>With warm regards,
>>-Payal
>>
>>    
>>
>
>
>
>
>  
>


