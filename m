From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: packets to local addresses
Date: Sat, 7 Apr 2007 20:40:39 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0704072040300.22181@yvahk01.tjqt.qr>
References: <fad2fb270704060522r4322a223g4e2e40605b3fb6a@mail.gmail.com>
	<46167157.3080409@rtij.nl>
	<fad2fb270704070713w37a73f82o3caaf14f987a0f7a@mail.gmail.com>
	<4617BC88.102@rtij.nl>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4617BC88.102@rtij.nl>
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
To: Martijn Lievaart <m@rtij.nl>
Cc: netfilter@lists.netfilter.org, MKS <rekordmeister@gmail.com>


On Apr 7 2007 17:45, Martijn Lievaart wrote:
> MKS wrote:
>> What is the best way to change this behaviour, that is force "general"
>> packets out a specific interface. iptables route target???
>
> Dunno. Maybe the ROUTE target can be of assistence. As I said earlier, hping2
> probably can do this.

Use MARK and iproute2.

Jan
-- 

