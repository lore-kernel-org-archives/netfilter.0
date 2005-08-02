From: "James A Harrison" <jamesharrison@blackicehosting.com>
Subject: Re: Blocking a range of source IPs to a specific port
Date: Tue, 2 Aug 2005 14:20:45 +0100
Message-ID: <20664.2167679549$1122994331@news.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: gtaylor@riverviewtech.net
Cc: netfilter@lists.netfilter.org

Hi,

Replying on my PDA, so just a quick message to say thanks - i'll try that tomorrow.



James Harrison


-----Original Message-----
>From: "Grant Taylor"<gtaylor@riverviewtech.net>
>Sent: 02/08/05 04:05:49
>To: "netfilter"<netfilter@lists.netfilter.org>
>Subject: Re: Blocking a range of source IPs to a specific port
>
>James Harrison wrote:
>
>> Hi,
>>
>> I'm trying to use iptables to block a range of source IP addresses, 
>> but I can't figure out how to specify ranges- i'm trying to block 
>> everything from 172.150-250.*.* on port 8676- can someone help me out 
>> with the rule for this?
>>
>> Thanks,
>> James Harrison
>>
>James, you might want to look in to the IPRange match extension for 
>IPTables. I think you would be able to do something quite literally like 
>this:
>
>iptabels -t filter -A INPUT -p tcp --dport 8676 -m iprange --src-range 
>172.150.0.0-172.250.255.255 -j DROP
>
>I was able to successfully key the above line in to my firewall at the 
>house (test chain) with out any problems so I think the syntax is 
>correct.  However I have never used iprange in production to say what I 
>think of it.  Give it a try and see what you think.
>
>One suggestion is that you may want to send the traffic to a different 
>sub chain to be able to log the traffic before you DROP it.  Just a thought.
>
>
>
>Grant. . . .
>
>


