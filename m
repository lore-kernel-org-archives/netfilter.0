From: Konstantin Svist <kostya@relevad.com>
Subject: Re: need advice for high traffic network
Date: Thu, 19 Jul 2007 16:17:20 -0700
Message-ID: <469FF100.5020509@relevad.com>
References: <469FE2DC.90300@relevad.com>	<Pine.LNX.4.63.0707191516340.23721@qynat.qvtvafvgr.pbz>	<469FE85B.3010502@relevad.com>
	<20070719225931.GA17114@internet24.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20070719225931.GA17114@internet24.de>
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

How do I reduce those timers?


Thomas Jacob wrote:
> On Thu, Jul 19, 2007 at 03:40:27PM -0700, Konstantin Svist wrote:
>   
>> # cat /proc/sys/net/netfilter/nf_conntrack_max
>> 65536
>>
>> somehow I doubt I have THAT many connections :)
>>
>> highest load right now is around 600 requests per second, and ~60% 
>> complete within 10ms - the rest complete within 200ms (unless the 
>> firewall is turned on - then some start timing out 3s and up)
>>     
>
> 600s * 120s ip_conntrack_tcp_timeout_time_wait = 72000 entries
>
> ( =>  http://www.isi.edu/touch/pubs/infocomm99/infocomm99-web/ )
>
> You might want to try to reduce those timers or just push
> up your hash bucket = max entry values to maybe twice that.


