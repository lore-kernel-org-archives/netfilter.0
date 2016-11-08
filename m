From: Art Emius <art@emius.ru>
Subject: matching process
Date: Tue, 8 Nov 2016 08:46:41 +0300
Message-ID: <CANY1rLgxygkJXdLVEQbE_O3fsf0=4Qye8TjdKaYY1d-FzvPj6w@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:from:date:message-id:subject:to;
        bh=bbWeGrR6wiJJO+GfQdTfYrWXe8yjamAZQ3vuUAsS6zs=;
        b=lbGipm0hbk/uWc6cD0fsD9dKVEuaukjjvFlt3VnbyGl078XZAlawkOW6LpJefuzTqh
         oEbVvlI5TeQAoEVtMkPFtHgR/PEmsXUpM3f2n7GaV4wogbl2s8uXmhYtS+Uo5C5Npi7W
         jET0xtx318X2HLGGPx/Wl35VBp+3ThDG2vjrvP0oaVo/NFgqSUTG5zT1BKSUq0SBjpAI
         ihGylSHoz+qGilbEEfBhePK2nQs4JJMo9LNHVWGLuTpbD5K/2NqgH3WjHAwaoXljU9YI
         0Ozk59mgeOlNmx2hGIHEBAodEnnb1fknRDEncZNeOrd97mc/eKRHRhPhbuREqjBqktG1
         l4sg==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello netfilter people,

Being concerned about iptables performance I thought about if criteria
number and order in rule does matter. Unfortunately I didn't find much
info about it in the internet, so... here are my questions.

Does criteria number matter? Two example rules are written below.
iptables -t filter -A FORWARD -i eth0 -p icmp -j ACCEPT
iptables -t filter -A FORWARD -i eth1 -s 10.10.10.10 -d 10.20.20.20 -p
icmp -j ACCEPT
Will it take same time to match packet by these rules, or first rule
will take less time?

How does matching process exactly happens?
Let's say we have a rule like:
iptables -t filter -A FORWARD -i eth0 -s 10.10.10.10 -d 10.20.20.20 -p
udp --dport 123 -j ACCEPT
And packet with
iif=eth1
src=10.10.10.10
dst=10.20.20.20
proto=udp
dport=123

Will netfilter match packet with all criteria specified and make
decision in the end, or it will jump to next rule when first criteria
mismatch happen?

And third question. Is it all fair if using ipset? Will packet be
matched with SET2 if it doesn't match SET1?
iptables -t filter -A FORWARD -m set --match-set SET1 src,src -m set
--match-set SET2 dst,dst -j ACCEPT

--
Regards,
Emius
