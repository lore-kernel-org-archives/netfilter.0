From: Martijn Lievaart <m@rtij.nl>
Subject: Re: packets to local addresses
Date: Sat, 07 Apr 2007 23:39:57 +0200
Message-ID: <46180FAD.50209@rtij.nl>
References: <fad2fb270704060522r4322a223g4e2e40605b3fb6a@mail.gmail.com>
	<46167157.3080409@rtij.nl>
	<fad2fb270704070713w37a73f82o3caaf14f987a0f7a@mail.gmail.com>
	<4617BC88.102@rtij.nl>
	<Pine.LNX.4.61.0704072040300.22181@yvahk01.tjqt.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0704072040300.22181@yvahk01.tjqt.qr>
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
To: Jan Engelhardt <jengelh@linux01.gwdg.de>
Cc: netfilter@lists.netfilter.org, MKS <rekordmeister@gmail.com>

Jan Engelhardt wrote:
> On Apr 7 2007 17:45, Martijn Lievaart wrote:
>   
>> MKS wrote:
>>     
>>> What is the best way to change this behaviour, that is force "general"
>>> packets out a specific interface. iptables route target???
>>>       
>> Dunno. Maybe the ROUTE target can be of assistence. As I said earlier, hping2
>> probably can do this.
>>     
>
> Use MARK and iproute2.
>   

Are you sure? I thought you couldn't overrule the local table.

M4


