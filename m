From: Kim Jensen <kimj@dawn.dk>
Subject: Re: newbie question about port blocking
Date: Thu, 17 Apr 2003 16:37:12 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200304171637.12672.kimj@dawn.dk>
References: <003901c304e8$24b56fa0$2d64a8c0@murrahboy> <200304171622.51239.kimj@dawn.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200304171622.51239.kimj@dawn.dk>
Content-Disposition: inline
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: kenn murrah <kenn@thebytebusiness.com>, netfilter@lists.netfilter.org

Whoopsie,

Rules should be:
$ iptables -t filter -A INPUT -i lo -j ACCEPT
$ iptables -t filter -A INPUT -p tcp --dport 80 -j ACCEPT
$ iptables -t filter -A INPUT -j DROP
$ iptables -t filter -A FORWARD -p tcp --dport 80 -j ACCEPT
$ iptables -t filter -A FORWARD -j DROP

This allows nothing but web, however you may wish to open up other things as 
well, such as a few ICMP services, and as I mentioned - if you are using a 
transparent proxy, you have to add some additional rules to allow the proxy 
to work..

/Kim

On Thursday 17 April 2003 15:49, kenn murrah wrote:
> Sorry for the elementary nature of this question ... I've just installed
> linux and have a transparent proxy working using iptables ... but my goal
> is to block ALL non-http traffic in both directions ... that is, i want to
> allow web access but no instant messenging, no ftp, etc.
>
> is there a simple line or two that i can add to iptables?  please feel free
> to tell me to RTFM, but the tutorial i just downloaded is 151 pages, and i
> admit that i'm looking for a fast solution this morning ... (i'll study the
> manual on the way home tonight on the train -- i promise!)
>
> can anyone help me out?  all advice MOST appreciated.


