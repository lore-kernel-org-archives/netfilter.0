From: Mogens Valentin <monz@danbbs.dk>
Subject: Re: Iptables logs on High bandwidth traffic network
Date: Thu, 05 May 2005 13:24:06 +0200
Message-ID: <427A0256.5080709@danbbs.dk>
References: <4278C3DE.7010403@au-kbc.org>
	<4278F150.4000806@riverviewtech.net>	<42794F67.7060803@danbbs.dk>
	<4279570A.1090509@riverviewtech.net>	<Pine.LNX.4.58.0505050848090.21265@blackhole.kfki.hu>	<4279CA3E.3000104@riverviewtech.net>
	<Pine.LNX.4.58.0505051010140.21324@blackhole.kfki.hu>
Reply-To: monz@danbbs.dk
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.58.0505051010140.21324@blackhole.kfki.hu>
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

Jozsef Kadlecsik wrote:
> On Thu, 5 May 2005, Taylor, Grant wrote:
> 
> 
>>>Why where a FIFO and a program which parses and transmit the data to
>>>another system any faster than syslog/syslog-ng/ulogd/etc? (Why reinvent
>>>the wheel?)
>>
>>It is my belief that Syslog and the mechanism that it uses to log is not
>>meant for extreme volume of login.  As I understand it Syslog will log
>>each and every individual packet that passes through the IPTables LOG
>>target individually, thus causing a write through the kernel in to
>>SysLog space and possibly to disk for a VERY small amount of data.
> 
> 
> That depends on how syslog is configured - you can easily disable syncing
> at every log event.

Yes, but doing so may cause loss of logging, or maybe it'll just delay 
some messages due to not sync'ing at once. Lack of experience here :p
I do use the non-sync feature to some extend; doesn't seem to cause too 
much delay, though.

-- 
Kind regards,
Mogens Valentin


