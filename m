From: Christian Theil <christiantheilhave@gmail.com>
Subject: Re: Iptables Media Server Performance
Date: Wed, 29 Dec 2004 10:08:24 +0100
Message-ID: <33d4ee9404122901085b18d4@mail.gmail.com>
References: <41D33C62.1010505@wildcash.com>
Reply-To: Christian Theil <christiantheilhave@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <41D33C62.1010505@wildcash.com>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

> from this machine and will add more with DNS round robin.

DNS round robin is probably one of the poorest solutions you can pick. 
You will likely get unfair loadbalancing. Remember that clients will likely
cache DNS entries.

There are other solutions which will provide better loadbalancing. Linux
virtual server or sleipner or something. 
 
> Does it everything look OK to you? Or am I tripping out?

You might want to look into to QoS/traffic control to put your
bandwidth to better use (if you are not allready doing this). The
place to start is the linux advanced routing howto.

/christian.

