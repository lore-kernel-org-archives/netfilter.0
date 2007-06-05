From: Steven M Campbell <Netfilter@SCampbell.net>
Subject: Re: syn DDoS attack solution
Date: Tue, 05 Jun 2007 10:16:40 -0400
Message-ID: <46657048.4040600@SCampbell.net>
References: <5C9E8CCEEB81ED498AC0C3B0054704F3029B6DE0@webmail.latis.com>
	<46651F04.9020709@bgs.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <46651F04.9020709@bgs.hu>
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
To: Bgs <bgs@bgs.hu>
Cc: Ric Messier <kilroy@WasHere.COM>, netfilter@lists.netfilter.org

And, most important for folks here, do egress filtering on your 
firewall!    Help prevent zombie machines on your own networks from 
being a problem, you can't stop your end users from bringing infections 
into your network but you can control their spread.

Bgs wrote:
>  You can have defense against many kind of ddos attacks but victory is 
> not sure at all. Take the case for example when a very large number of 
> distributed bots issues many but slow SYN/ACK bounce attacks or plain 
> protocol connections to your site. If they do it 'right' you will end 
> up with up to millions of sources doing 'ordinary' things with random 
> sources. No source will ever trigger anything above an average user. 
> One important step in taking ddos seriously was when the first ISP 
> went broke because it was a target.
>
>  So take up the fight when it happens. Most attackers are not 
> resourceful enough (either by available hw/bots or technical 
> knowledge), so on the long term you can usually win. But loosing the 
> war is always a possibility no matter how good you are...
>
> Martin McKeay wrote:


