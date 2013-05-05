From: Timothy Arceri <t_arceri@yahoo.com.au>
Subject: Using IPTABLES to simulate router dropping TCP connection
Date: Sun, 05 May 2013 15:10:23 +1000
Message-ID: <5185E9BF.3050201@yahoo.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com.au; s=s1024; t=1367730626; bh=5Ixn635lwnWZRsxFwomJe9xuthbtYyM4/tnUSMh/Z5E=; h=X-Yahoo-Newman-Id:X-Yahoo-Newman-Property:X-YMail-OSG:X-Yahoo-SMTP:X-Rocket-Received:Message-ID:Date:From:User-Agent:MIME-Version:To:Subject:Content-Type:Content-Transfer-Encoding; b=xFsx9MHaA5FaOPIDchbLykb+jU4jyWtFvGPNWnsnfW6jLvQXgkcDnYlQ85NxlL0YQmbH+AeULzBPE8H2XDZZkn8P7DM8RC2CI5zYqxQQfUOcfcDHvzitNyh7hKkVFJFz6E49vsxkNGjiZ58eSUoLo+5jSttyZd4g7Wp2XCnn19o=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi All,

I'm trying to figure out a way to simulate the behaviour described here:
http://tldp.org/HOWTO/TCP-Keepalive-HOWTO/overview.html in section 2.4.
Basically I want to be able to get the firewall on my local system to
behave in a similar way. Why would I want to do this? Well I'm trying to
get GNOME's Nautilus/gvfs to handle this scenario better as it does
happen in real world scenarios, and I need a way to simulate this.
Ideally it would be great if I could do this to any connection that is
idle after 30 seconds.

Thanks for you time,
Tim
