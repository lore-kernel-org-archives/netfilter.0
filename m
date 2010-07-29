From: Portedaix <portedaix@gmail.com>
Subject: iptables rule for ovh
Date: Thu, 29 Jul 2010 11:08:31 +0200
Message-ID: <4C51450F.7070906@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:subject:content-type
         :content-transfer-encoding;
        bh=32ivHFk5y1wXFpnBfO+yEYGgDXiuuDfHibKz2yHLhBw=;
        b=tOeuxp8ubr4qu9RuO5hQqbJW3qgojS5OtFn8xaxrklekNCdNc483FQrJFRC9HXWI10
         7UuYpLBMJDWMXhj2QVvwEJgbjOZgNj+8saOLaCJ5yGF8SYLduG/VxXlycoTIpSJAJiV2
         vft/c+Zh4wjy+EgqLJmcoxgy7l3Go4qacW7AM=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

QUESTION - SHORT VERSION :
Is there a way to have a rule equivalent to the one below which is for 
kernel 2.6.14 and above,  with a linux kernel 2.6.9 ?
'#iptables -A INPUT -p udp -m udp --dport 5060 -m string --string 
"Cirpack KeepAlive Packet" --algo bm --to 65535 --source sip.ovh.net -j 
DROP'

QUESTION - DETAILED VERSION :

I use a sip telephone line from OVH and run asterisk PBX on a sme linux 
server to connect to it.
The asterisk command line is polluted by an error message.

#chan_sip.c:7289 determine_firstline_parts: Bad request protocol Packet

asterisk debug shows

#<--- SIP read from 91.121.129.17:5060 --->
#Cirpack KeepAlive Packet


I could avoid that by activating the rule

#iptables -A INPUT -p udp -m udp --dport 5060 -m string --string 
"Cirpack KeepAlive Packet" --algo bm --to 65535 --source sip.ovh.net -j DROP

But my main problem is this string module. My kernel is 2.6.9, and 
string module is used starting from 2.6.14 kernel. Upgrading the kernel 
on my production server is not easy, and may lead to a heavy 
reconfiguration. So if I can find a way just to have this rule 
activated, that would be fine.

Thanks in advance for any help.
Olivier


