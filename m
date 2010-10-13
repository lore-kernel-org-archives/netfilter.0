From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: event-driven connection tracking
Date: Wed, 13 Oct 2010 16:24:07 +0100
Message-ID: <4CB5CF17.3090302@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:message-id
         :disposition-notification-to:date:from:user-agent:mime-version:to:cc
         :subject:content-type:content-transfer-encoding;
        bh=3sw5zTxZe9w9AbV1CXps+flCzDOJ5ck8NmfZ/ekqcyk=;
        b=NS6Jzh4U4t/Rlldrx3IJPIpTiVsD+Jb3YVj3NT578otuydjZQnkDaaEj7YIJqi7VPc
         VwFosexJUrWYDE7vRcpxdtQyNZEquuWPHOyMhXtLGgeKvkWonz2bqboSxwhaamzDXTbv
         2sMuu2hdTTzeoXMlzY5Nz+vAVBNIavlUveKKM=
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Netfilter Developer Mailing List <netfilter-devel@vger.kernel.org>
Cc: netfilter@vger.kernel.org

Is it possible to use event-driven connection tracking - with 
conntrack-utils or by other means?

Ideally, what I would like to do is 'register' a handler for particular 
connection events (when new connection is established and then closed 
for example) based on particular pre-defined filter (say, by protocol, 
source/destination ip etc) and execute a program code/function (if done 
programmatically) or a script (if done outside the connection-tracking 
domain) to do what I want?

Currently, the only way to track such 'events' is if I include a 
separate chain in iptables tracking a particular connection (and logging 
the event via a normal log jump), but that is not enough for me as I 
also need to trigger a full dump based on that particular 'filter' and 
end this dump when the connection is closed. Any ideas?
