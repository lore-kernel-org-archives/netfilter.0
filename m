From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: RE: IP forwarding
Date: Thu, 4 Aug 2005 09:55:40 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0508040955280.27293@yvahk01.tjqt.qr>
References: <200508040415.j744FBjF040033@fenyo.mail.t-online.hu>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200508040415.j744FBjF040033@fenyo.mail.t-online.hu>
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
To: =?iso-8859-2?B?R/Zt9nJpIFpvbHThbg==?= <suf@freemail.hu>
Cc: netfilter@lists.netfilter.org

>> iptables -t nat -A PREROUTING -d 1.2.3.4 -p tcp --dport 80 -j DNAT
>> --to 192.168.1.202
>
>The roule should look like this:
>
>iptables -t nat -A PREROUTING -d 1.2.3.4 -p tcp --dport 80 -j DNAT
>--to-destination 192.168.1.202

Or just --to-dest ;-)



Jan Engelhardt
-- 

