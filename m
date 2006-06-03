From: zottmann <zottmann@ig.com.br>
Subject: Re: Possible conntrack problem
Date: Sat, 3 Jun 2006 15:53:58 -0300
Message-ID: <20060603_185358_073665.zottmann@ig.com.br>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="Message-Boundary-by-Mail-Sender-1149360838"
Return-path: <netfilter-bounces@lists.netfilter.org>
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
To: justin@expertron.co.za, Sietse van Zanen <sietse@wizdom.nu>
Cc: netfilter@lists.netfilter.org

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

--Message-Boundary-by-Mail-Sender-1149360838
Content-type: text/plain; charset=ISO-8859-1
Content-description: Mail message body
Content-transfer-encoding: 8bit
Content-disposition: inline

Hi !! 

Thank you both for your answers!! 

We are not getting any reports regarding problems with our webserver, but 
surely these logs are weird. 

We are going to try ip_conntrack_tcp_be_liberal and see what happens. By the 
way, what does it really means? 

Regards, 
Carlos. 


Em (14:15:13), Justin Schoeman escreveu: 


>Can also try: 
> 
>echo "1" > /proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_be_liberal 
> 
>Seems to help if there is a PIX between your clients and servers... 
> 
>-justin 
> 
>Sietse van Zanen wrote: 
>> This usually happens with clients behaving badly or misconfigured 
servers. 
>Very unlikely (I would say less 1% chance) to be a netfilter issue. 
>> If you don't get any reports about you webserver being unreachable or 
>unusable, all is working exactly as it should. 
>> 
>> If people do have problems with your webserver, check the configuration 
of 
>the server and clients. 
>> 
>> -Sietse 
>> 
>> ________________________________ 
>> 
>> From: netfilter-bounces@lists.netfilter.org on behalf of 
>zottmann@ig.com.br 
>> Sent: Thu 01-Jun-06 13:56 
>> To: netfilter@lists.netfilter.org 
>> Subject: Possible conntrack problem 
>> 
>> 
>> 
>> Hi !! 
>> 
>> I am having a problem that I think may be related to conntrack. 
>> 
>> I am getting dropped packets in the firewall coming from our web server, 
>> source port 80, and going to external machines on high ports, with both 
>ACK 
>> and SEQ numbers set. 
>> 
>> It seems to me that these packets are answers from our webserver to 
>> connections estabilished with it, but, for some reason, the connection 
>> information is being lost (maybe due to timeout?). 
>> 
>> How can I track this? Has anyone gone through something like it? 
>> 
>> Thanks in advance, 
>> Carlos. 
>> 
>> 
>> 
>> 
>> 
> 
>---------- 



--Message-Boundary-by-Mail-Sender-1149360838--


