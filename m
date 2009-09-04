From: "J. Bakshi" <joydeep@infoservices.in>
Subject: site becomes slow dut to syn-flood protection
Date: Fri, 04 Sep 2009 18:47:57 +0530
Message-ID: <4AA11385.6050102@infoservices.in>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello list ,

I have these codes before my incoming rules as a sync flood protection

`````````````
# Check hashlimit-htable-expire after 5 min ( 300000 mili second )
iptables -N syn-flood
iptables -A INPUT -i $IFACE -p tcp --syn -j syn-flood
iptables -A syn-flood -p tcp --syn  -m hashlimit \
--hashlimit 4/sec --hashlimit-burst 4 --hashlimit-htable-expire 300000 \
--hashlimit-mode srcip --hashlimit-name testlimit -j RETURN
# Drop IP bad IP and put then in blacklist
iptables -A syn-flood -m recent --name blacklist --set -j DROP
iptables -A INPUT -j syn-flood
````````````````````````````````````

and this makes the sites running at the server very slow, if I comment
the above again the sites running well.  What might be the safe options of

--hashlimit 4/sec --hashlimit-burst 4  

to get back the normal apache connection ?

Thanks
