From: zhackwyatt@gmail.com
Subject: Re: Queue all traffic...even if not destined for local machine
Date: Wed, 27 Aug 2008 11:32:00 -0700
Message-ID: <7915e7b50808271132p38cb7fe8w11091cec20080165@mail.gmail.com>
References: <6886667862162200006@unknownmsgid>
	 <7915e7b50808251926j1ed07815k84ab2e1ca6cddb5@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=loCwjj5byg51dK2oO+/nWfMfkBA0E0yCl8bb0jjqhYk=;
        b=byms9h5ZZGBb83zMBQYWAPTfzsFrosNkU6TGzF8tnw5DtJkJ1qIiRS88H1uFCSTSde
         UgaPun7KffvTGg8ZMCTo0zpZUMYoW0tPQZ4WJVHxHaX/PerQKnSDkGOZsEKhs8WbIiKC
         z6MrCWTyej2BYPxSfys04u2qDS2Rf0dnsoipU=
In-Reply-To: <7915e7b50808251926j1ed07815k84ab2e1ca6cddb5@mail.gmail.com>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I have verified  that Wireshark can see the incoming packets.  Also if
I do iptables -t nat -I PREROUTING -j QUEUE does it too...but I have
read that isn't a good idea.

On 8/25/08, Curtis Wyatt <zhackwyatt@gmail.com> wrote:
> Hello all, me again:
>
>
> I have a box with two Nic cards on it. What I will be doing is taking
> a packet coming in on one nic, encapsulating it, and then sticking it
> on the other card. I know how to Queue traffic destined for that
> machine (iptables --insert INPUT 1 --in-interface eth+). But how do I
> get traffic not destined for itself? --insert FORWARD 1 doesn't seem
> to work.
>
> Do I need to look at promiscuous mode?
>
> Thank you very much
> -----------------------------
> Curtis
>


-- 
-----------------------------
Curtis
http://gocalipso.com
