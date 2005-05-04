From: Mogens Valentin <monz@danbbs.dk>
Subject: Re: Iptables logs on High bandwidth traffic network
Date: Thu, 05 May 2005 00:40:39 +0200
Message-ID: <42794F67.7060803@danbbs.dk>
References: <4278C3DE.7010403@au-kbc.org> <4278F150.4000806@riverviewtech.net>
Reply-To: monz@danbbs.dk
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4278F150.4000806@riverviewtech.net>
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
Cc: "Taylor, Grant" <gtaylor@riverviewtech.net>

Taylor, Grant wrote:
>> Hi all,
>>         I am planning to implement iptables log feature on a server
>> machine(Dual xeon processor,Intel e100 cards,80GB SCSI and 2GB RAM)
>> which is running in bridge mode (On RH 7.3).The average traffic on this
>> machine is vary from 40-60Mbps.Hence I require some suggestion for some
>> my questions like,
>>
 > The reason that
> LOG is not meant for high volume logging is that it relies on SysLog to 
> log it's data which in and of it's self is not meant for high volume 
> longing.  SysLog will quite often become disk bound if you try to log 
> such high volumes to it and thus the system will sort of flounder...

How about using a fifo (man mkfifo and man syslog) and let syslog pipe 
to that fifo. Some program can then read from the fifo, parse data, and 
maybe use a database for storing the parsed, now more limited, data.
Might be a good ide to have the database on another system :-

-- 
Kind regards,
Mogens Valentin


