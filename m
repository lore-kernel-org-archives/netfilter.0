From: Binish A R <binishar@poornam.com>
Subject: Re: iptables LOG options
Date: Tue, 24 May 2005 11:09:55 +0530
Message-ID: <4292BE2B.3060206@poornam.com>
References: <4292A1A7.3020401@poornam.com>	<4292A6CF.4020904@rfgt.net>	<4292AABF.4060009@poornam.com>	<4292B530.3070801@rfgt.net>	<4292B892.7060603@poornam.com>
	<4292BC01.8060202@rfgt.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4292BC01.8060202@rfgt.net>
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

Robert Vangel wrote:

> Binish A R wrote:
>
>> Is there any way, I can use environment variables while logging ?
>
>
> From what I can think of, no. Environmental variables are parsed then 
> and there. Using $USER in your script would translate into `--log 
> prefix "root NO SSH ALLOWED"' since the user you are running the 
> iptables command as is root.

Yes exactly ... thats what is happening. The shell is expanding $USER as root.
I hope there was any way out to log the username :(

Thanks for the replies Robert.




