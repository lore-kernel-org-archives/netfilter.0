From: "Oliver Schulze L." <oliver@samera.com.py>
Subject: Re: Forwarding multiple UDP ports
Date: Fri, 22 Sep 2006 12:35:25 -0400
Message-ID: <451410CD.6020102@samera.com.py>
References: <45140C99.8040205@samera.com.py>
	<Pine.LNX.4.61.0609221821100.12304@yvahk01.tjqt.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0609221821100.12304@yvahk01.tjqt.qr>
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

Hi Jan,
sorry about not specifying.

INTRA_SERVER: intranet ip of the server initiation the udp traffic to 
the INTRA_ROUTER IP
INTRA_ROUTER: intranet ip of the router
INET_IP: a random public IP

The traffic flow should be:
INTRA_SERVER -> intranet -> INTRA_ROUTER -> internet -> INET_IP

Explanation:
INTRA_SERVER sends UDP traffic to the INTRA_ROUTER IP, then, INTRA_ROUTER
forwards those packets to the public IP INET_IP

Thanks
Oliver


Jan Engelhardt wrote:
>> My question is: can I forward UDP trafic from and internal server to the
>> Internet?
>> Can I use this line:
>>
>> iptables -t nat -A PREROUTING -p udp -s INTRA_SERVER -d INTRA_ROUTER 
>> --dport 1024:6000 -j DNAT --to-destination INET_IP:1024-6000
>>
>> I'm testing it and I see the rule matched, the byte and packet counters are
>> incrementing.
>> But, I see no traffic going out of the Internet NIC.
>> I'm not sure if the multi-port specification will work.
>>     
>
> Who is INET_IP? Is it the same host as INTRA_ROUTER?
>
>
> Jan Engelhardt
>   

-- 
Oliver Schulze L.
Get my e-mail after a captcha test in: http://tinymailto.com/oliver


