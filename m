From: "robee" <mlody@elpec.com>
Subject: Re: packets loging
Date: Fri, 21 Apr 2006 09:36:06 +0200
Message-ID: <002801c66516$40ff0ae0$0e01050a@CyberAdmin>
References: <002d01c66445$01dd28f0$0e01050a@CyberAdmin><4447F34C.6030500@yahoo.com.mx><000d01c6650d$99afe6e0$0e01050a@CyberAdmin>
	<60102.193.173.147.3.1145604135.squirrel@webmail.sterenborg.info>
Reply-To: robee <mlody@elpec.com>
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: netfilter@lists.netfilter.org

----- Original Message ----- 
From: "Rob Sterenborg" <rob@sterenborg.info>
To: <netfilter@lists.netfilter.org>
Sent: Friday, April 21, 2006 9:22 AM
Subject: Re: packets loging

> On Fri, April 21, 2006 08:34, robee wrote:
>> my rules looks like this:
>>     iptables -I FORWARD -p tcp -i ! eth0 --dport 80 -m state --state
>> NEW -j LOG --log-prefix HTTP_ --log-level info
>> and i get something like this in /var/log/kernel
>>     Apr 21 04:09:20 master kernel: HTTP_IN=eth2 OUT=eth0 SRC=10.11.9.2
>> DST=213.54.82.29 LEN=48 TOS=0x00 PREC=0x00 TTL=127 ID=57962 DF PROTO=TCP
>> SPT=3636 DPT=80 WINDOW=64240 RES=0x00 SYN URGP=0
>> but i want only this:
>>     Apr 21 04:09:20 master kernel: HTTP_IN=eth2 OUT=eth0 SRC=10.11.9.2
>> DST=213.54.82.29
>> any sugestion?
> AFAIK that isn't possible.
> Why would you want to anyway ?
> Gr,
> Rob


less data to write, less disk load

robee

