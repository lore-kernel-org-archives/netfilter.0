From: "Jason Vas Dias" <jason.vas.dias@ptt.ie>
Subject: RE: Linux netfilter / iptables : How to enable iptables TRACE chain
 handling with nf_log_syslog on RHEL8+?
Date: Sun, 25 Jun 2023 16:11:18 +0100
Message-ID: <hhr0pz60h5.fsf@jvdspc.jvds.net>
References: <hhttuv65e9.fsf@jvdspc.jvds.net>
Reply-To: "Jason Vas Dias" <jason.vas.dias@ptt.ie>,
          "Jason Vas Dias" <jason.vas.dias@gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ptt-ie.20221208.gappssmtp.com; s=20221208; t=1687705886; x=1690297886;
        h=mime-version:message-id:date:reply-to:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wqq4uIFbPmIYmGnD4oi4N5iew1ED+VVJ9JrQXNznywg=;
        b=4C5DTzsqJD8AJnfW8BdSTlUmulumo/X5OLpyftlg4d2vdgsXcgwgJ2oafg9RzeQo6l
         uU8CiZbfw17VBmcuuErqN61qVG4FPUUN4zbe0CASr/uXBGA2Foixts4x3i0II+yIhFxb
         lTvjlm2BIa/qp97dQ0+ymOXDMseic+h9oPJXb6FrAi7R+APO6kxZQiDxBs24LJSwkcps
         Zuc4kyvZeHM7CAxK8zPFAOR4GHc2gwGs81MNuLcHzYV+2j9eCblllHD1FOqZths1mn4q
         mwGYbx0kv7AMlqyf3pmf1RyvPZ+XIoH+1p2zlxaanRG4OX32krdY9VtkDNzazseACt5Q
         JgeA==
In-Reply-To: <20230625134039.GB3207@breakpoint.cc>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Florian Westphal <fw@strlen.de>
Cc: netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org, jason.vas.dias@gmail.com


Good day Florian -

  RE: you wrote:
  > Run "xtables-monitor --trace".

  Thanks for the info about xtables-monitor - yes, that does give alot
  of extra information about rule chain processing.

  But I'd just like to understand :
    Why does this work under kernel v6.2.16 and not under v4.18.0-477 ?
    :
    # iptables -t raw -A PREROUTING -p icmp -j TRACE
    # iptables -t raw -A OUTPUT -p icmp -j TRACE
    # modprobe nf_log_ipv4
    # echo nf_log_ipv4 > /proc/sys/net/netfilter/nf_log/2

  How can I enable the 'nf_log_syslog' module, so that it does
  in fact emit TRACE kernel messages to syslog, as it purports
  to be able to do, under v4.18.0-477 ?

  xtables-monitor is great, it provides ALOT of information, but
  really I'd like to just trace packet ingress / egress to from
  interfaces, with messages written to syslog .  Has this functionality
  been disabled somehow from the 'nf_log_syslog' module in v4.18.0-477 ?
  If so, how can I enable it ?

  There is very little documentation about nf_log_syslog, besides that
  it is meant to take over everything done by ipt_LOG .

  ipt_LOG WAS meant to log packets that meet the rules on the TRACE
  chain to syslog, no ? So how can I enable that functionality only
  with nf_log_syslog under v4.18.0-477 ?

  I am reading its source code, it SEEMS like it should be getting
  triggered when 'sysctl netfilter.nf_log.2' is not NONE, no ?
  But the v4.18.0-477 version of it it is not doing so.  Why ?

Best Regards,
Jason

 
 
