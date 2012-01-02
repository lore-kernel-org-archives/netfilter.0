From: "Lloyd Standish" <lloyd@crnatural.net>
Subject: Re: problem with multi-level SNAT? (multiple uplinks/providers)
Date: Mon, 02 Jan 2012 13:01:45 -0600
Message-ID: <op.v7g0g7k4x1lyi3@debiandesk2.net>
References: <op.v7e0qja7x1lyi3@debiandesk2.net>
 <1325528733.2270.32.camel@andybev-desktop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1325528733.2270.32.camel@andybev-desktop>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed	delsp=yes"
To: Andrew Beverley <andy@andybev.com>
Cc: netfilter@vger.kernel.org

On Mon, 02 Jan 2012 12:25:33 -0600, Andrew Beverley <andy@andybev.com> wrote:

>> As a related aside, I'd appreciate comments on whether or not the "-p
>>  tcp" in the following example rule is advisable (I omitted "-p tcp"
>>  from my SNAT rules.): iptables -t nat -A POSTROUTING -p tcp -o eth0 -j
>>  SNAT --to-source 194.236.50.155
> Well, I never put a -p tcp in SNAT for any of my configurations. I'm not
> sure why you would want to limit SNAT to just TCP?

Thanks for the comment.  I asked because I have seen "-p tcp" in other people's load-balancing scripts, and I couldn't understand why they were limiting to tcp.  I thought there must be something here I'm missing.  (Maybe they used it in order to be able to specify a port range for the SNAT).

I think that since SNAT applies to entire connections, other protocols will be SNATted with '-p tcp' if they are RELATED to an initial (NEW) tcp packet.  Maybe that is why the 'p tcp' specifier appears not to give trouble.

Anyway, I'm glad my logic is the same as yours.  I'll leave '-p tcp' out of my SNAT rules.  I want all traffic balanced over my interfaces - except of course packets that match certain policy routing rules.

(By the way, my new load-balancing router is working great, and my ISP and I are very relieved, after weeks of mysteriously-broken connections and disgruntled users.)

--
Lloyd
