From: "Walter H." <walter.h@mathemainzel.info>
Subject: IPtables and HTTP/2-Push?
Date: Thu, 14 Sep 2017 10:42:07 +0200
Message-ID: <ba7e09d692a6bdb55ad32d7e106e33c7.1505378527@squirrel.mail>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mathemainzel.info; s=dkim11;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:To:From:Subject:Date:Message-ID; bh=BwLoNOSVLlM/paYG1o3MnSt4azTAaFsPj5YpR9idIBw=;
        b=BblyKl+2UrPL3gF0yESBWMbRyUXQyPyTVpFFTS3UC9gfOUOi0euKVRcN5glu3PVOb/mF82Yp5DuICyJOF5sBwrXuJVq9x/o4iHjiAWvWj0ep4dgHPWG2Y8VUKVv4PbBtmo/CrbgQ1p+tcVaKTLqcZ/RVOB7gsqNuXaE2+fOyCGE=;
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello,

when I have these two rules on client side (Browser)

# Allow anything out on WAN
-A OUTPUT -o iface-wan -j ACCEPT
# Allow established, related packets back in
-A INPUT -i iface-wan -m state --state ESTABLISHED,RELATED -j ACCEPT

or on firewalls/routers

# Allow anything out on WAN
-A FORWARD -i iface-lan -o iface-wan -j ACCEPT
# Allow established, related packets back in
-A FORWARD -i iface-wan -o iface-lan -m state --state ESTABLISHED,RELATED
-j ACCEPT


what happens to to packets that the Server pushes without request?

I ask this because I see in the logs regularly a few entries like this

[13-Sep-2017; 16:42:06.415850] IPv6[FWD]: IN=sit1 OUT=br0
SRC=2a00:1450:4001:0811:0000:0000:0000:200e
DST=LANprefix:0000:0000:0000:1234 LEN=123 TC=0 HOPLIMIT=60 FLOWLBL=262223

as I filtered away INVALID, I can imagine, that these blocked packets come
from HTTP/2-Push ...

Am i right?

Greetings,
Walter

