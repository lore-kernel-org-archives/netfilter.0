From: Petteri Matilainen <pmatil@gmail.com>
Subject: [ULOGD2] Timestamp without year in logemu
Date: Tue, 3 Jan 2017 21:28:21 +0200
Message-ID: <8f188faf-3890-c157-74ed-22808f915b05@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-transfer-encoding;
        bh=Je0Nl7WTSK2g8e8hWBe3JA9zR/t4J8zNIcum9OnEzB0=;
        b=Xjd2zcXpcU1I0GqFF+5WmrCt4K2sBSYboRjIVx8l1pCGfrJaMJcO7puULxNwPrln5m
         0TDPdsndJIJ5K2/wfxbhvJDTVVlulXBctDGQu4r4LP9zhSurkOxmbkt7yT+HHy8JFRil
         yvADAkJmyiNcLv0WORPmC5mEXzFfLBBDBAfsUeq6nsMRdu+VmyMaDOePvnXkvmCgYVRq
         DhKRCEsa+s6oijKEPgp6IWm1zqSBXXjXTFUW1li8aCWLobaMW9o93GJjArl7RfbzNFvA
         JThLyRVuybQbhbJgmsm8/if14rljfpkooubzKz9NSNVygxuuZfzssKmSPchnILZ6Fcyk
         tatw==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hello list,

I'm using iptables firewall and I'm logging blocked packets with NFLOG 
target and ULOGD2. I have the following configuration in ulogd.conf:

# this is a stack for logging packets to firewall.log after a collect 
via NFLOG
stack=firewall6:NFLOG,base6:BASE,ifi6:IFINDEX,ip2str6:IP2STR,print6:PRINTPKT,logemu6:LOGEMU

[logemu6]
file="/var/log/firewall.log"
sync=1

The logging itself works just fine, but I noticed the timestamps are 
missing the year, like so:

Apr 23 10:38:04 Router In_New_TCP IN=eth0 OUT=...

Any ideas why? This causes problems with the system I'm using to graph 
the logs and make statistics. My system is Debian with kernel 3.16.7. 
Ulogd version is 2.0.4. I found an online manual for ulogd2 which 
mentioned a LOCAL filter but my ulogd does not recognize it.
