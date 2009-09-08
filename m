From: Anatoly Muliarski <x86ever@gmail.com>
Subject: Re: iptree question
Date: Tue, 8 Sep 2009 10:57:17 +0300
Message-ID: <38db14850909080057w6caf2daeq4b287480a07ca2d0@mail.gmail.com>
References: <4AA5F9AC.8000701@infoservices.in>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type;
        bh=sh2STxeCXHLKo4iAa9zt6q/3ztVKo2FVIykAYPeIguA=;
        b=E8ZEHV3RyCWg3T59AkAq/itf2kZ5YYusjrVnNSqR6ReclslZXUUqzsFhpdYb+kSMyY
         tNS4D0ZtIMdZb/xQ1qCG/260MM5j+3UOf/SWWfuANIuFsp14HKbhPlJ2vn49iteVOyk1
         7Hb+8vtFgAJkX8hCkFc26qhHkdht7R0jpFxQg=
In-Reply-To: <4AA5F9AC.8000701@infoservices.in>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "J. Bakshi" <joydeep@infoservices.in>
Cc: netfilter@vger.kernel.org

2009/9/8, J. Bakshi <joydeep@infoservices.in>:
> Hello list,
>
> I am opening this new thread as I am working in a new direction with
> ipset ( as many of you suggested ).
>
> The present rules I am using to auto blacklist ips is like below
>
> ````````````````````````````
> iptables -N syn-flood
> iptables -A INPUT -i $IFACE -p tcp --syn -j syn-flood
> iptables -A syn-flood -p tcp --syn  -m hashlimit \
> --hashlimit 4/sec --hashlimit-burst 4 --hashlimit-htable-expire 300000 \
> --hashlimit-mode srcip --hashlimit-name testlimit -j RETURN
>
> # Drop bad IP and put then in blacklist
> iptables -A syn-flood -m recent --name blacklist --set -j DROP
> `````````````````````````````````
>
> To manage the ips properly I like to save ips  in iptree which is an
> option from ipset. Is there any way to migrate the ips from ipt_recent
> to iptree ?
>
> Or a new way as below  ?
>
> ```````````````````
> ipset --create  blacklistIP   iptree --timeout 3600
>
> iptables   -A PREROUTING    blacklistIP   -j DROP
>
>
> iptables -N syn-flood
> iptables -A INPUT -i $IFACE -p tcp --syn -j syn-flood
> iptables -A syn-flood -p tcp --syn  -m hashlimit \
> --hashlimit 4/sec --hashlimit-burst 4 --hashlimit-htable-expire 300000 \
> --hashlimit-mode srcip --hashlimit-name testlimit -j RETURN


Then you should insert the follow line:
iptables -A syn-flood -j SET --add-set blacklistIP src

>
> # Drop bad IP
> iptables  -A  syn-flood  -j DROP
>
> # save the src IP
> ipset -N blacklistIP -j SET --add-set src
> ipset -N blacklistIP -j syn-flood
> ``````````````````````
That is the wrong syntax. See above.

Remember, an IP in the blacklist will disappear in an hour after the
last adding into the set.

-- 
Best regards
Anatoly Muliarski
