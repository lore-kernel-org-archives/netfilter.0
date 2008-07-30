From: "Richard Hartmann" <richih.mailinglist@gmail.com>
Subject: Re: iptables, NAT, DNS & Dan Kaminsky
Date: Wed, 30 Jul 2008 19:19:23 +0200
Message-ID: <2d460de70807301019y68e592f1x8e00af9fabff1ff6@mail.gmail.com>
References: <2d460de70807300753h6673017i29374763ca9f763@mail.gmail.com>
	 <1217435970.14516.17.camel@enterprise.ims-firmen.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=95Jac3nFWGspFdUrvPtthMLrRzLYxBBQzJfeROQNhco=;
        b=Dc3BZIDDxkP9U2InaDfTxCyz0e4wFFmscOVGxRn1tPdRa7QUZDVwmOE6mb6Ud6Ig9t
         xDapvg5YAQ+gstmffrTzAePqUaARbupgGqKoqTNKynSCYMR0+6dngU7FAzGqlyKIFXyk
         Hc5sQXZ4PHmqeVEhJBcdUeRnVEEfnEf6r17Po=
In-Reply-To: <1217435970.14516.17.camel@enterprise.ims-firmen.de>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Thomas Jacob <jacob@internet24.de>
Cc: netfilter@vger.kernel.org

On Wed, Jul 30, 2008 at 18:39, Thomas Jacob <jacob@internet24.de> wrote:

> One of the main points of the Kaminsky exploits allegedly is
> (but who knows for sure, it hasn't been published yet)

The exploit _has_ been published and Dan confirmed it. The
current Metasploit implementation is not as fast as Dan's
version, but it works. Several people reported expoits in
the wild that are actively abusing said security hole.


> The question therefore is if you will really gain a lot
> of security with respect to the exploit in question. Hmm..

Yes. You increase the entropy from 2^16 to 2^32 - 1025.
This is not great security and DNSSEC is the only viable
long-term solution, but right now, I am concerned to fully
understand the impact of the exploit with regards to my
three questions.


> We'll know next week :)

We know right now. You have a chance of approximately
1/3000 to successfully exploit an old DNS caching server.
But you have to sit off the TTL each time so the attack
vector is impractical for most uses. Now, you can mount
a hundred attacks per second. That means you can
chew through the 3000 tries you need on average in less
than a minute.
With the higher entropy, I don't know the chances for a
successful exploit, but they are so low as to provide
some protection.


I am especially concerned about question 2:
Do all versions of iptables available in kernels 2.4 and 2.6
use the original source port for their NAT traffic, by default?
If not, what are the earliest versions that did this?


Thanks,
Richard
