From: "Joey" <Joey@Web56.net>
Subject: General question about chains
Date: Wed, 15 Oct 2008 23:46:52 -0400
Message-ID: <001501c92f41$d380c0a0$7a8241e0$@net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
References: 
In-Reply-To: 
Content-Language: en-us
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello All,

While I have used iptables for a while, I have found that I needed to gain
more knowledge to push what I am doing with it to another level.

I have read through a few things on-line and in the readme stuff, but have
some confusion that I want to clear up.

I am thinking that a chain is a group of rules, and I can create multiple
chains to define rules for different things.
Lets say FTP-RULES, SPAM-RULES etc.

If I do this I can hopefully flush just one group or chain without effecting
the other rules is what I am thinking.

When I execute a rule I do this:
iptables -A INPUT -p tcp -s 118.242.0.0/16 -j LOG --log-prefix SPAM-BLOCK-
CIDR-ASIAN
iptables -A INPUT -p tcp -s 118.242.0.0/16 --dport 25 -j DROP


I wanted to change it to add it to a chain like so:
iptables CIDR-ASIAN -A INPUT -p tcp -s 118.242.0.0/16 -j LOG --log-prefix
SPAM-BLOCK-CIDR-ASIAN
iptables CIDR-ASIAN -A INPUT -p tcp -s 118.242.0.0/16 --dport 25 -j DROP

iptables -N CIDR-ASIAN -A INPUT -p tcp -s 118.242.0.0/16 -j LOG --log-prefix
SPAM-BLOCK-CIDR-ASIAN
iptables -N CIDR-ASIAN -A INPUT -p tcp -s 118.242.0.0/16 --dport 25 -j DROP

This didn't work for me and I have tried several varients with no luck.

So my first question is do I understand correcty how to utilize chains?

Will I be able to load and unload chains rather than flush everything end
reload everything? ( I have a lot of rules )

Sample syntax would be great because I have found a million sites without
seeing what I really want.

Finally when I go to save these chains like the docs say
iptables-save -t fail2ban-VSFTPD I get the following error:
iptables-save v1.2.11: Can't initialize: Table does not exist (do you need
to
insmod?)

This happens on different versions of Centos & on a RH as well.

Thanks! ( sorry for the long description ).


