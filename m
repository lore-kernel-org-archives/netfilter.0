From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: can iptables block ARPS
Date: Sat, 30 Sep 2006 18:58:24 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0609301857550.4615@yvahk01.tjqt.qr>
References: <b06339d40609290721o57703505m4de20360ac6aca30@mail.gmail.com>
	<451D2D66.20301@zoomnet.ro>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <451D2D66.20301@zoomnet.ro>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexandru Dragoi <alex@zoomnet.ro>
Cc: netfilter@lists.netfilter.org, Ralph Blach <ralph.blach@gmail.com>

>> Can Ip Tables Block arp request from certain Mac address or IP address?
>> 
>> If so, what is the syntax.
>> 
>> thanks
>> 
>> Chip
>> 
> Nope, use arptables. It has similar syntax with iptables.
>
One may use ebtables to actually get some more control over arp.


Jan Engelhardt
-- 

