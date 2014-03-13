From: Rodrigo <rodrigo.tumaian@gmail.com>
Subject: Iptables quota usage and web redirection
Date: Thu, 13 Mar 2014 15:55:37 -0300
Message-ID: <CANnn4rcJk2TL_=H-Eo67ctBZV=96psJdxrzRc80MFq=m86BGcw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=wPccXgRzOqgXG9vOfC7g6sgvudYtC83z1VfoW4OvVvo=;
        b=i064xdWiw103XoN/zKuYGlJ7U4/7ahlg7DTK6KEUrchpZYj4CfDNwZ+w31O2sCNsvg
         pEHyNAgnajdFEdvp5CCAjXHIHWEOtfXhOlgHG47mid4qo3ri4q/4kZxp7KLe/MNy58V5
         JGID10Dq4RhVGjs0rbO6hu3Z7X2Osc3vZRxrUDS5kKFKfA0wgBLZw7X1Zs5xqGmcdSpT
         Nsxp90UM0hGR+9zrIhUTwWeL1zFQXNQK+z+RFqMTncmmQIuAPEJkfs0/G78cE7IfAp1S
         5R3gXrW9iq8psyEbYwy62FS2flVMcprvionY6UiFbb15VcYsmqtYcn4wzd4ihGb10HA6
         tizQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi, I've been two days trying to solve this issue, but I am getting
some problems that I do not understand.
I hope that somebody could help me with this issue.

I have an iptables firewall as a package filter.

Some days ago one of my customers requested me to apply an bandwidth
quota for their users.
Once the users reach that quota, they must be redirected to a webpage
provided by the client.

In this scenario i've try a lot of possible iptables rules and I got
to some certainties and some uncertainties.

My last try:

iptables -t mangle -I INPUT -m quota ! --quota 2097152 -s
192.168.245.251 -d 192.168.34.1 -p tcp --dport 8080 -j MARK --set-mark
22
* I've decided that when I reach to quota 2097152 (2Mb -just for
testing-) I start marking traffic

iptables -I INPUT -m mark --mark 22 -m conntrack --ctstate ESTABLISHED
-s 192.168.245.251 -d 192.168.34.1 -p tcp --dport 8080 -j REJECT
* If the packet are mark, I reject all established connections.

iptables -t nat -A PREROUTING -m mark --mark 22 -s 192.168.245.251 -d
192.168.34.1 -p tcp --dport 8080  -j DNAT --to 192.168.33.171:80
* And if the package are marked, I make a redirection.

Checking the Ip-tables flow..
(http://upload.wikimedia.org/wikipedia/commons/3/37/Netfilter-packet-flow.svg)
i get this:

 === [NAT | Pre-routing] == [ Mangle | Input ]== [ Filter | Input ] == >

First Package:

First Flow : [NAT | Pre-routing] No package marked.. No redirecction.
Second Flow: [Mangle | INPUT ] No marks untill I reach 2097152 bytes
Third Flow : [filter | INPUT ] No marks, nothing to drop.

When I reach the quota, first package:

First Flow : [NAT | Pre-routing] No package marked.. No redirecction.
Second Flow: [Mangle | INPUT ] I reach the quota, start marking
Third Flow : [filter | INPUT ] Start droping package

When I reach the quota, second package:

First Flow : [NAT | Pre-routing] Start redirecction

-----------------

Theoricaly everything works fine, but it's not happening.

Here is a picture that i will explain:

http://s8.postimg.org/866rpy6gz/Problemas_marcas.jpg
(Just to make clear something.. just in case.. in the image, when you
see 687K, this is the amount of data over the 2097152 bytes.

the -m quota ! --quota <Value> make the rule 0, untill you reach the
<Value>, then starts to count.)

The two first rules work fine, we can see how te traffic starts to be
marked when i reach the quota.

The problem is I am not getting the redirecction, the traffic in the
nat table altought is mark is not redirected.

Does anyone know what could be the problem?

Kindly Regards,
Rodrigo
