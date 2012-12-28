From: Piotr Kaczmarzyk <piotr@connecta.pl>
Subject: ipset - adding two MACs with same IP address
Date: Fri, 28 Dec 2012 18:45:09 +0100
Message-ID: <50DDDAA5.6020901@connecta.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi,

I'd like to create ip set, where some IP addresses have two or more 
possible MAC addresses. I.e. I want to replace following iptables entries:

iptables -A FORWARD -s 10.0.0.2 -m mac --mac-source 00:11:22:33:44:55 -j 
ACCEPT
iptables -A FORWARD -s 10.0.0.2 -m mac --mac-source 00:22:44:66:88:aa -j 
ACCEPT

with someting like:

ipset -A ACCEPTEDMAC "10.0.0.2,00:11:22:33:44:55"
ipset -A ACCEPTEDMAC "10.0.0.2,00:22:44:66:88:aa"

but after second command ipset says:

ipset v6.16.1: Element cannot be added to the set: it's already added

Is there any way to do this with ipset? Or maybe another way to speed up 
this filtering?

Best regards,

Piotr
