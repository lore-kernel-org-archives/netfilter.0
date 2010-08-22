From: Jack Andrews <jack@andrewsmail.co.uk>
Subject: routing VPN users through transparent Squid using iptables
Date: Sun, 22 Aug 2010 11:39:50 +0100
Message-ID: <4C70FE76.1060204@andrewsmail.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

  Hello all!

I'm hoping someone can help me out - I've been tearing my hair out over 
this!

I have pptpd and squid set up.  I want give these users access to the 
internet, but would like to send http traffic through a squid proxy.

Hopefully this rough diagram will give you an idea of what I'm trying to 
achieve:

[CODE]

VPN users connect to pptpd (via eth0)
     \ | /
       |
       |
      / \
  http   everything else
    |     |
    |     |
    |     |
squid    |
    |     |
     \   /
      \ /
       |
      NAT
       |
   internet (via eth0)
[/CODE]

If I set up the following iptables rule, users can connect to the internet:
[CODE]iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE[/CODE]

I can also connect to squid it works as expected.

Now, I was hoping another simple rule would redirect all http traffic 
through squid:
[CODE]iptables -t nat -A PREROUTING -i ppp+ -p tcp --dport 80 -j 
REDIRECT --to-port 3128[/CODE]

But this doesn't seem to work (I'm also hoping ppp+ is the correct 
formatting for a wildcard?).  Http traffic is never redirected and 
bypasses the proxy.

Can anyone suggest how to get this working?

I don't really know much about this stuff I'm afraid.  I would also love 
some recommendations for ways in which I can debug the system, e.g. 
which log files to look at, tcpdump commands etc.  I find the iptables 
documentation extremely bewildering!

Thanks!
