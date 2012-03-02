From: "cmlitgUy@gmail.com" <cmlitguy@gmail.com>
Subject: Make a redirect if NAT out interface is down
Date: Sat, 03 Mar 2012 01:45:55 +0200
Message-ID: <4F515BB3.2060603@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :content-type:content-transfer-encoding;
        bh=VOV112841xjTnR0J79VRYnNOWBiDcvDc0Wibca1szfg=;
        b=URT2f0qhns4bzf17C8sZ4YylDAW9YIcEoJGOdFJwKPZcsocMM/U29Gjn78fq43Wl6l
         J9tciW/k0dehVfy8alMgT6UHLilh6n+62e8zKLHkvTpC2C4YeNGWS/cidOSts44cTr+K
         ll7z0c+QrJRjDSZTPmu5Uesx+vYm6my4vhn7dyJWhovqqudyhREPUESTYRRG6FW6cWnC
         IUgTJwLzvJ40OR7DX9FSD5/HdXazRNyJgQlA8UI6z9zJqhnPpt+BklwF3CSX89qVcwsp
         AFIdlHlxJlDWVw83pHdC+spab8HvYwFwHwys9fgt+xqbP/08qgmv/jmevGuR38qusDZT
         cI9Q==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hello,
I have a question about possibility of making a redirect if  NAT out 
interface tun0 is down.
This is iptables rule for Masquerading our network via VPN connection.

iptables  --table  nat  --append  POSTROUTING  --out-interface  tun0  -j  MASQUERADE  -m  comment  --comment  "Masquerading"

When VPN goes down, we can't access some resources and we need to verify 
its status and establish it again.
Is it possible to make a redirect of all traffic to another host - Web 
Site(via IP address) of tun0 is down ?
In this case all users immediately be seen that VPN should be established.

Thanks.

Sorry for my English.
