From: "hareram" <hareram@sol.net.in>
Subject: Re: yahoo mail problem
Date: Mon, 7 Mar 2005 12:48:32 +0530
Message-ID: <0f7a01c522e5$deac0dc0$09603fca@southern>
References: <0dd101c5215c$7393efb0$09603fca@southern>
	<4229C04F.1000103@cardvn.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="response"
To: Nguyen Dinh Nam <64vn@cardvn.net>
Cc: netfilter@lists.netfilter.org

Hi

no iam not using pppoe
iam using plain ethernet based connectivity to my ISP

any other suggestions

hare
----- Original Message ----- 
From: "Nguyen Dinh Nam" <64vn@cardvn.net>
To: "hareram" <hareram@sol.net.in>
Cc: <netfilter@lists.netfilter.org>
Sent: Saturday, March 05, 2005 7:51 PM
Subject: Re: yahoo mail problem


> If you use pppoe, and your ISP blocks ICMP packets (many incompetent ISPs 
> do so), you will need tp CLAMP MSS:
> http://lists.roaringpenguin.com/pipermail/rp-pppoe/2004-August/000006.html
>
> hareram wrote:
>
>> Hi all
>>
>> I have iptables running with FC3
>> I have some different problem
>> when iam doing NAT and masq.. iam not able to check yahoo mails
>> when i use the public IP i could able to check mails and send/receive
>>
>> iam doing ip masq using 1 public ip address.
>> when i change to another public ip for 2 days iam able to check the yahoo 
>> mails send/receive ok.
>> then again start getting the same yahoo mail problem
>>
>> does any one face this kind of problem or any solution for this kind of 
>> situation ??
>>
>> suggestion and some docs will be appreciated
>>
>> hare
>
>
>
> 



