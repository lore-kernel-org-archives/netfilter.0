From: Brad Knorr <bradley@knorrfamily.org>
Subject: Need help
Date: Mon, 25 Oct 2021 21:53:13 -0700
Message-ID: <dc004311d37bb7332b649c4973b0cbed@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=knorrfamily-org.20210112.gappssmtp.com; s=20210112;
        h=from:mime-version:thread-index:date:message-id:subject:to;
        bh=bIdNLYyl7MufDe7cvKRezWIN28r0GiYIkpKZSPSo1/0=;
        b=U+Nv1UPosRjMSzEmodUO87ov+xKl7nhddhEdsbARLSfT0vwsXmEnHpOSSgzWFVKGeO
         6rSX3HFDoPigHDofhW9DPb5GARrc3fUW1fT+wN1gFyWLrlnhesMxcZT89jK8tKzCMXZy
         9ccDXn1R0RmBRyw8zXqIDFcpBUEGv5X3ic9q6OKUr944DZgmTvZS05FNY55YfU+xkEEh
         JmPJkIF4RRort1HtmFnR8YWoT1ZgY/pv8Gv6+vqWAWlTfQoH+rAl83pA+ggkCZvibOKi
         dcQjMScE7D77XMO7nHbOriJi/QHu5Bz7QLS8gByZK0XFOltz/UGGwuAyGFP6GOeM6Op1
         cxZw==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I am new to nft commands.  I wish to use the map feature for port
forwarding.  What I want to achieve is the following

Sftp  incoming  to port 2222 on the public IP to be port forwarded to
private IP on port 22.  So what I found in the docs is this.

% nft add map nat foo { type inet_service : ipv4_addr . inet_service \; }

% nft add element nat foo { \
    1100 : 192.168.1.2 . 5061, \
    1101 : 192.168.1.3 . 5061, \
    1400 : 192.168.1.4 . 5061 \
}
% nft add rule nat pre ip protocol tcp dnat ip addr . port to tcp dport
map @foo


So when I issue the first command I get the following error:
Error: unqualified mapping data type specified in map definition

When I issue the command:  nft add map nat foo { type inet_service :
ipv4_addr \; }

It works just fine.  I am at a loss as to why this is happening.  The
reason I need the mapping is I need to add and remove port forwarding
rules easily with a simple command.

Any help would be greatly appreciated.
Brad
