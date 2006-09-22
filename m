From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: Forwarding multiple UDP ports
Date: Fri, 22 Sep 2006 21:06:32 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0609222105190.7758@yvahk01.tjqt.qr>
References: <45140C99.8040205@samera.com.py>
	<Pine.LNX.4.61.0609221821100.12304@yvahk01.tjqt.qr>
	<451410CD.6020102@samera.com.py>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <451410CD.6020102@samera.com.py>
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
To: "Oliver Schulze L." <oliver@samera.com.py>
Cc: netfilter@lists.netfilter.org

>
> Explanation:
> INTRA_SERVER sends UDP traffic to the INTRA_ROUTER IP, then, INTRA_ROUTER
> forwards those packets to the public IP INET_IP

In that case, DNAT is ok. Just make sure that no packet (in either 
direction) can evade INTRA_ROUTER (such as hubs/switches and other 
sorts of bridges), because that nullifies NAT.


Jan Engelhardt
-- 

