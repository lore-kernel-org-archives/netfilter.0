From: =?ISO-8859-1?Q?Humberto_Juc=E1?= <betolj@gmail.com>
Subject: Multipath routing x kernel > 3.6 (without routing cache)
Date: Sun, 2 Mar 2014 09:09:04 -0400
Message-ID: <CACuyg26ntrABcy39_Obtf+cUKMnOcMtwoE45ZEJkdR=WtwvPdA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=ru4I+iZ/8fM+ESQvReWBqsvByBlA2qwnXWkMsgxbb3k=;
        b=bnf6zU0tgqb71263Pp0JPdCJ5gZAd8/J8ZOQIGjYzhXPsQl1mirqSPbz52q1ULl4HO
         pNoOA+pXzwKXKJi2Q3QJQTXv+ACKqlBIly4c1uG6pdiz5SoB4q7yVd4miKz8EW9CZRYP
         riS1iw67jaXbugERgt481fUOyVzFIfXhy89TnOW34uCGyzQKiVdk6l4NzE5LOnE5EyCP
         nuCT3qj+cZ4I13ZcPki/V7+h6CXKAB/08GebYph3mZOr4yODM8bo5vMWs8T3v79kWOgZ
         oAzfoudK/la1lOWa9zptbvFUMW4WjKbMohLGJW34a8DwujURlz/Y9gdGRio20feHTtBS
         OaXg==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

This issue has already been discussed here, but we have not reached a
conclusion. I'm reviewing my firewall script (iptables yet) and I
would like to review the configuration of link load balancing.

The problem is that setting too complicated without the routing cache.

With cache I could set a per-flow balancing. To do this, i configured
"gc_interval" as 1 and defined a higher value for "gc_timeout". Thus I
forced distribution by origin and destination every second (1s), but
the routing path was maintained by "gc_timeout".

This was the best way I found to balancing Internet links. IMHO, this
worked well because it was a flow load balance. So, my connection
could be distributed by different links, but not in a short time to
the same destination. This avoided problems with HTTS sessions or
webmail, for example.

From what I understand... without routing cache, i need to do a
firewall configuration via CONNMARK. To do this its simple. However
this creates a balancing per connection, not per flow. I didn't like
to see a routing path changed in a https session - In many cases,
local socket is changed constantly.

I know that I can set the path for certain cases by the firewall rule,
but that would be too much unproductive.

I don't understand why such a radical step in the kernel code. Would
have been much better to have the possibility to enable or disable the
routing cache instead of removing the code completely. Recently I
needed to return the kernel version of one firewall (I need to review
my scripts first).

How do the load balancing per flow without routing cache?
Any ideas?

Thanks
