From: Trixter aka Bret McDanel <trixter@0xdecafbad.com>
Subject: netfilter + perl payload mangling in userspace
Date: Sun, 26 Jul 2009 20:57:35 -0700
Message-ID: <1248667055.5801.355.camel@trixeee>
Reply-To: trixter@0xdecafbad.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I wanted to modify the payload of packets in userspace, preferably with
perl.  I have tried to google to find something, encountered some dead
links.  I have not be able to get the example Net::Divert to work,
however it appears that I am not able to divert properly.  I cant find
any working examples of how to do the iptables command to divert.  

Is there any other way to modify the payload of a packet from userspace,
preferably with perl?

can someone provide me with a working example of how to do iptables to
divert?


I have iptables 1.4.1.1 on eeebuntu (ubuntu base) and a kernel of 2.6.27

Thank you
-- 
Trixter http://www.0xdecafbad.com     Bret McDanel
pgp key: http://pgp.mit.edu:11371/pks/lookup?op=get&search=0x8AE5C721


