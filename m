From: Mauro Santos <registo.mailling@gmail.com>
Subject: Re: Help/guidance with automatic CT helper assignment
Date: Tue, 11 Apr 2017 13:56:10 +0100
Message-ID: <e494d582-2241-2374-bf86-2eb2c421bd22@gmail.com>
References: <4be4e306-a7e4-4aa9-feae-ec00de07b463@gmail.com>
 <0f597416-2d74-d98b-f969-f21391797b6a@familie-kuntze.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=mppl5KF0yRMb9Univw3dnecyyksI/6UTCNakr7PE9JM=;
        b=e/TOOhlSjFKjDZP20yaGm8s5Pvav1jRJ1YfcYpvgPa25F+24HjgFAMG6kJTUDPYnp/
         mc0OpPH+77PolliEJSVQzg6lVRmrwawoVAkZqe46YFikNkKEEA7L+8uY4LrRgVtAzTqC
         V6J3vB5BsW23dQUNbbiQL78nFWBaIKz4dWoL4CySV7n3Ya1QEzDSIaR7dqeIt/uhBtpV
         T4S5H7kgjv1WpJqYSd8eqhi9iO8U4rjJs/xWGjkDZk/4YfwBwXSYgpH5rrwGBzDfy7SC
         Za81N9iwr9nFQixhZ5sA3tOFbPA7xQcAqCkhAwdb2e0ww1Dx8xkHNVXI7UVy/srSk1jE
         gy0A==
In-Reply-To: <0f597416-2d74-d98b-f969-f21391797b6a@familie-kuntze.de>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Noel Kuntze <noel@familie-kuntze.de>, netfilter@vger.kernel.org

On 11-04-2017 11:31, Noel Kuntze wrote:
>> What I would like some help/guidance with is finding out what is causing
>> this, that is, finding out which program would cause an automatic helper
>> to be loaded if automatic loading was enabled.
>>
> Receiving of packets of protocols (or ports) for which helpers exist, but aren't assigned.

Yes you are correct, I have gotten ahead of myself. My plan is to narrow
down which packets of protocols (or ports) would trigger an automatic
assignment so that in the end I could try figure out which program is
sending those packets (that is, if this is not caused by a random port
scan).

>> I have currently setup two helpers, one for ftp and one for pptp (which
>> pulls the gre helper if I'm not mistaken). These two helpers have been
>> added with:
>> iptables -t raw -A OUTPUT -p tcp --dport 21 -j CT --helper ftp
>> iptables -t raw -A OUTPUT -p tcp --dport 1723 -j CT --helper pptp
>  
> 
>> I have tried monitoring incoming and outgoing connections with source
>> and destination ports that the other helpers should work with (I've
>> taken the list from here http://www.shorewall.net/Helpers.html) but the
>> timestamps of the messages (ports log and nf_conntrack message) are too
>> far for me to believe I'm catching what is causing this.
> 
> The helpers and what packets are not handled are obviously not the same!
> The two groups also do not intersect! Receiving a GRE packet can cause this message, too!

Then if I understand correctly I should log not only tcp/udp but also
gre (which should not be much traffic I hope). Your comment also made me
realize that I might have made a reasoning error, I have assigned the
pptp and ftp helpers for outgoing packets but I have not done the same
for incoming packets so I suppose that incoming pptp or ftp could also
trigger the message. Am I correct in this reasoning?

>> Short of logging everything in bulk, is there anything else I can try to
>> catch the culprit? I'd like to avoid logging in bulk because I have not
>> found a way to trigger this on demand and sometimes I see the
>> nf_conntrack message several hours after boot, which would make for huge
>> logs with normal machine usage (youtube, video calls, etc).
> 
> The list of conntrack helpers is limited. You don't need to log everything.
> See this[1] blog article.
> 
> [1] https://home.regit.org/netfilter-en/secure-use-of-helpers/

That is the exact page I have found when the warning/message about the
behavior change first started to show up in my kernel logs.

From the information on that page I suppose I should use the raw table
to do the monitoring and as a starting point I should monitor on the
default ports of the protocols for which there are helpers (and for the
ones I have not assigned). Is this reasoning correct or am I (still)
missing something obvious?

-- 
Mauro Santos
