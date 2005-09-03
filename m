From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: Sharing Limited Internet Connection
Date: Fri, 2 Sep 2005 23:39:54 -0500
Message-ID: <200509022339.54950.rob0@gmx.co.uk>
References: <025601c5afe2$21c119a0$0200a8c0@etpi>
	<a0f69e505090204074a5f0dbb@mail.gmail.com>
	<4319243B.3030007@canada.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4319243B.3030007@canada.com>
Content-Disposition: inline
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

On Friday 2005-September-02 23:19, David Leangen wrote:
> Can somebody please explain something to me?
>
> > # use MASQ if you get dynamic ip
> > iptables -A POSTROUTING -t nat -o eth0 -j MASQUERADE
>
> What's the difference between using "-o ppp0" and "-o eth0"?
> Obviously, one is using the ppp0 interface while the other is using
> the eth0 interface.

-o specifies the output interface. "-o ppp0" matches packets routed out 
ppp0. I'll leave it as an exercise for the reader to guess which 
packets match "-o eth0".

> But in terms of what happens to the packets, what's the diff?

-o is a matching option, not a target option. The target is the same, 
"-j MASQUERADE".

> Out of curiosity, I tried both: ppp0 works, while eth0 does not.

Not having any idea what your eth0 interface is used for, I cannot 
explain that to you, but I would guess that your default route to the 
Internet uses ppp0.
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

