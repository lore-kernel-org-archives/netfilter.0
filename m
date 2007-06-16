From: Kashif Ali Bukhari <kbukhari@gmail.com>
Subject: Re: regarding iptables and DROP
Date: Sun, 17 Jun 2007 02:20:46 +0500
Message-ID: <4674542E.5090800@gmail.com>
References: <34b8543c0706160514g966862cj31dddbdd9cbc7da9@mail.gmail.com>
	<34b8543c0706160519g4c238ffdkc867eac3eff5990c@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:user-agent:mime-version:to:cc:subject:references:in-reply-to:content-type:content-transfer-encoding;
	b=VJ1f0QG+IjbYFXDUNyJ9rkIY7fDiI+6OLYsJ4N5W2sN/PIr4ciIqRmFwfcZcQ0v0vOHEL8lx1wKAPl0FUjd+SEZ5fj0a2cvl0vCmyKU3lDtwIz5SZ3E5P+tWLw6jLLMLzMJfhbaoL0rnRbjwITunakOHApwEKpbM5OGLZWCrV08=
In-Reply-To: <34b8543c0706160519g4c238ffdkc867eac3eff5990c@mail.gmail.com>
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
To: Mohammad Norouzi <mnrz57@gmail.com>
Cc: netfilter@lists.netfilter.org

Mohammad Norouzi wrote:
> Hello
> I am new to this mailing list, I have a problem with iptables 
> configuration
>
> I have an iptables file with following content:
>
> [I just briefed the content]
> --------------------------
> :PREROUTING ACCEPT [831:64633]
> :POSTROUTING ACCEPT [20:1927]
> :OUTPUT ACCEPT [11:1333]
>
>
> -A POSTROUTING -s 192.168.0.1 -o eth1 -j MASQUERADE   # LINE 1
> -A PREROUTING  -s 192.168.0.1  -p tcp -m mac --mac-source !
> 00:30:48:54:AA:5A  -j DROP  #LINE 2
> ------------------------------
>
> at first it was just "LINE 1" but soon I figured out that some users
> cloning the existing IPs and try to connect to the internet. so I
> added the "LINE 2" to match their MAC Address and drop the packets if
> it isnt original.
>
> but now it seems that internet pages loading speed is diminished, I
> think this action (adding line 2) caused  checking packets too much
> and that is why the it is slowed down.
>

False! It should work fine may be its just due to some other reason or 
you are using slow processor ( i.e celeron)
> my question is if there is another way to determine the cloned IPs and
> drop them.
> is REJECTING faster than DROP? if yes how to use REJECT option ?
>
Reject is the fast method, which tels the source that packet is 
rejected. and DROP method will not alert the source.
> any suggestion would be of a great help.
>
> thank you very much in advance.
>
>
>


