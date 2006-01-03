From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: tarpit before or after adding chain?
Date: Tue, 3 Jan 2006 08:24:42 +0100 (MET)
Message-ID: <Pine.LNX.4.61.0601030823320.23554@yvahk01.tjqt.qr>
References: <43A3ADF3.7050406@comcast.net> <43A3D6BB.4010709@gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <43A3D6BB.4010709@gmail.com>
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
To: Georgi Alexandrov <georgi.alexandrov@gmail.com>
Cc: netfilter@lists.netfilter.org

>> iptables -A INPUT -i eth0 -p tcp  --dport 80 -m string --algo bm --string
>> "/default.ida?"     -j SPECIAL
> And again ... why do you need all this, when you're running linux and those are
> no harm in any way to your system?
> Or you are with those guys trying to complex their lifes every single day?

Yes, that's what TARPIT was invented for.


Jan Engelhardt
-- 

