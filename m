From: "cmlitguy@gmail.com" <cmlitguy@gmail.com>
Subject: Make a redirect if NAT out interface is down
Date: Sat, 03 Mar 2012 01:49:47 +0200
Message-ID: <4F515C9B.3030209@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :content-type:content-transfer-encoding;
        bh=2M4JJ7k50Kfq7nj84WPo3gvwlzYr3vgAXJ/dLf7EGsw=;
        b=kngnS4L5Mg9dfF1E1lmiOsTQgTKGIIc2MB9t3QYzhfVWoh9zM+Ii69uWSVvM9idoVQ
         /dVJNrOOfAuYZ0JoJyhuo8CUv2F6Q/cQI0VyykvavVkIkqcii2BiZ/+ePneyhQf1dpkl
         Qc4BPIfUYAq1VW+h5tHEvm28IlplQoLhknmpUSyx9sjyClYJCaatJBfkKvhUpR086BuC
         QjHtEfUE5D2j1+qeZnLluWa/cGrSRG7PP/8sgR70LzkUndgxFdF/DgvvfOIM8mS88nt4
         0hD51QyJssy/nz3Rgf5URMWXFFBCsWHWzipufywYocSJf30Md/ODl9lOpaocWzFT4fFt
         pWmQ==
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

Sorry for my english.
