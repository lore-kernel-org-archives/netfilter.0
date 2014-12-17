From: "Hassan Sultan" <hsultan@thefroid.net>
Subject: Intercepting connection creation/close with libnetfilter_conntrack
Date: Tue, 16 Dec 2014 16:06:58 -0800
Message-ID: <op.xqzjxwt51jp0b1@win8mac>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=thefroid.net; h=
	content-type:to:date:subject:mime-version
	:content-transfer-encoding:from:message-id; s=thefroid.net; bh=a
	J3KIbBaHQ49YX6ip0s6EWhHJTk=; b=GC1AuVjngtljnkq9dAhw9YOj5jGMKGRwV
	dKAFDcBDPAmd6z7/HOoiyucHeyIfoMemY/wOpHzeLiOnV1iUMUfZD9atUcI3NcSx
	sK19f+pQoJGV1OFrKp8EKI3rFdOLePodsuQhM5yK/q2rynG5tSTVQ0vvgdChWacU
	X6KYWsAi6Q=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
To: netfilter@vger.kernel.org

Hi,

I am trying to write a simple app, that will intercept all connection  
creation/close (any TCP connection and hopefully also any UDP  
reception/emission).

I tried simply copying examples (I'm on Ubuntu 14.04 x64 with a 3.13-032  
kernel) like this one :

https://git.netfilter.org/libnetfilter_conntrack/plain/utils/conntrack_events.c

However, when I launch it (using sudo so it's as root) and then create a  
tcp connection (to localhost using telnet, confirming the connection was  
created), nothing shows up.

What am I missing ? Do I need to enable auditing in the kernel/iptables  
somehow ?

Thanks,

Hassan
