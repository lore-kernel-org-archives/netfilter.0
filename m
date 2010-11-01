From: Alex <mysqlstudent@gmail.com>
Subject: Using iptables for throttling SMTP traffic
Date: Mon, 1 Nov 2010 15:07:11 -0400
Message-ID: <AANLkTinMmFLt=23wMYdGKcrtLxdAGgCyRqJSbP2g0_iJ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:content-type;
        bh=jZMuluClPYb+2dJAMaFUFYp0mjdyp+BsKlsn+HGX1DA=;
        b=x+cUZ2dwdQLEuOD/XPF/R8CpcnabPyHT3pZWSlRmeHUBIziiJmfi4kra6VryH1G1Fe
         ZHnME+d4aAAfHTDLcss/fpthKM2sXSb7ay1ePMNRQ5J9i1/ylJ9LZagsgRDJg9LrCz3t
         +kiUpycUk5NCZdC34aBqIjCfeJtf5W+GCB8tk=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I've set up a few basic rules to throttle SMTP traffic from an
individual host should they make more than 10 connections in ten
seconds:

iptables -I INPUT -p tcp --dport 25 -i eth0 -m state --state NEW -m recent --set
iptables -I INPUT -p tcp --dport 25 -i eth0 -m state --state NEW -m
recent --update --seconds 10 --hitcount 10 -j LOG
iptables -I INPUT -p tcp --dport 25 -i eth0 -m state --state NEW -m
recent --update --seconds 10 --hitcount 10 -j DROP

Is this the correct way to do this? I notice the seconds value can't
be any greater than 20. What is the reason for this? I'd like to do
something like permit up to 100 messages/connections over any
60-second period. Is this possible?

My hope is to block hundreds of connections on my mail server from
bulk mail senders like constantcontact, as well as the flood of
connections from spam bots that are rejected by zen anyway.

How can I tell what rules are currently in place for a particular IP?
In other words, I see log entries for the initial block, but it
doesn't appear that an actual rule is added, correct?

Thanks,
Alex
