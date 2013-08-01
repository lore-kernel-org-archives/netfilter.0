From: Nick Edwards <nick.z.edwards@gmail.com>
Subject: Re: net unreachable ipv6
Date: Fri, 2 Aug 2013 09:28:15 +1000
Message-ID: <CAMD-=VKHbG8dXDtrUJAsZMG3ipHOBED6u=dCQUwifc8bQo8CQA@mail.gmail.com>
References: <CAMD-=VJjymnAL9FuGnSTLvxFLnmAy9nrO9mdMkvbWNdiDxw1GA@mail.gmail.com>
	<51FAA2EF.4070001@ngtech.co.il>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=zYKXgj/XFRihefMUx8O+48OseSfvzz4zYYBlX9d7RM4=;
        b=Il3fiyH9/ZBCbQRlB+U55iu7XDsYECi9BSsJLZvAQKWR2iGBv/a1A2fCDj1KqPsxYz
         GBKD8xYTkuM4LzcJJtj7JbJ0APYnNdeBFwo2gns/DdPPcBNqXjPya0z6JK3C/X1H4NLp
         FCFm9bjoXkXrEmgIzP8KRIAaABgEOD49VOuiuF56IrrB5dYIkvGvfGRoRHojYQfXb370
         VViha3uk30jLhhPOPtDCR4J3ZPpWB6hLa/2xGa1rsvnce7L2J6Lcc6NjG1zaXUtb0IMG
         swr2schWiU0DjvQbHDdbTNRv8ul9aAhR6JALZYCeLG+OQHTFkEM7VMm0PSxHe3S3ESUd
         f4fg==
In-Reply-To: <51FAA2EF.4070001@ngtech.co.il>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eliezer Croitoru <eliezer@ngtech.co.il>
Cc: netfilter@vger.kernel.org

On 8/2/13, Eliezer Croitoru <eliezer@ngtech.co.il> wrote:
> On 08/01/2013 05:28 PM, Nick Edwards wrote:
>> and before anyone asks, yes, IPv4 works perfect
> What is the command you use to ping?
> also please try to just post ipv6 rules so we can read it and assume
> that if you are asking about IPV6 this is your major problem.
>
> Eliezer
>
ping6  any_hostname
ping6  any_ipv6_ip

it not just ping, perhaps its a side effect or unrelated, but the main
purpose of my post is  it runs mail server which is unreachable on
ipv6 when ip6tables is active

in point form the problem is

1/   policy input set to drop all traffic
2/  complete accept rule for remote so it can access any port.
3/  accept rule for mail port from anyone

so there are two conditions that say let-me-in, but iptables is not
honoring EITHER of the accept rules, this is how it always worked with
ipv4 regardless of icmp settings, but apparently, not with ipv6, or
the mail server (inc ssh) would be reachable

Even with policy drop, and as with #2 above, complete access rule for
any port it should be able to ping in.

further, the ping out, is via a default policy output of accept, so
even if it hissies at inbound it should be unhindered for anything
outbound


/usr/sbin/ip6tables -F

/usr/sbin/ip6tables -P INPUT DROP
/usr/sbin/ip6tables -P OUTPUT ACCEPT
/usr/sbin/ip6tables -P FORWARD DROP

/usr/sbin/ip6tables -A INPUT -i lo -j ACCEPT
/usr/sbin/ip6tables -A INPUT -s fe80::/10 -j ACCEPT
/usr/sbin/ip6tables -A INPUT -d ff00::/8 -j ACCEPT

/usr/sbin/ip6tables -A INPUT -s 2a00:1c18:401:c00::531:2 -j ACCEPT
/usr/sbin/ip6tables -A INPUT -m conntrack --ctstate
ESTABLISHED,RELATED -j ACCEPT
/usr/sbin/ip6tables -A INPUT -p tcp --dport 25 -j ACCEPT

/usr/sbin/ip6tables -A INPUT -p icmpv6 --icmpv6-type 1 -j ACCEPT
/usr/sbin/ip6tables -A INPUT -p icmpv6 --icmpv6-type 2 -j ACCEPT
/usr/sbin/ip6tables -A INPUT -p icmpv6 --icmpv6-type 3 -j ACCEPT
/usr/sbin/ip6tables -A INPUT -p icmpv6 --icmpv6-type 4 -j ACCEPT
/usr/sbin/ip6tables -A INPUT -p icmpv6 -j DROP
^^ I even commented that line out which made no difference

Thanks
