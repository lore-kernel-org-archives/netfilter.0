From: rahul shrivastava <shrivastavaone@gmail.com>
Subject: -f option used with iptables
Date: Thu, 21 Jun 2012 16:16:56 +0530
Message-ID: <CAE1WnGeiopf-gCWFzSVpZSDU6H56VqaPxL6K5AVL_o2xZm1pVw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=gCF4mqpk8UpX7iRTkJC7Q3YYKiTfj5ZBgFYbsbS56zM=;
        b=mYwDE8wCV5oakBWJMfgbgzBqVLRgdzWtbHV0qwWTlOkRmZRlTiXtv2NzQik/r0tLta
         Vf/v1daKFDY4XZoy7b7kW2zAlZKQkiL1IBkQbq4KPl3NcbL3Dg0433cJZU2DErbOWSGx
         GeiwOv3EXOYj3C1zUhVdDWx2b6qBiQDpHl7xYuusEYITD6LTDpbDaJt4Op7dRYIx39q6
         FjiGqWonJJBstfgDbSw1m9iQpiFgxQ9olarxK4Fk0ZMpTSR+0krB1jZmgG5t7hqPCV7q
         NEc7W6i0oMs/P6U3lnesOXaqKMTFe5sh97Im+8nQkky4P5qUpFDnOyb69mlxMV97eV0R
         eJXA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,
kernel version is 2.6.35+
I am defining following ACL

iptables -A INPUT -p icmp -i eth1 -m iprange --src-range
172.31.114.1-172.31.114.254 -m iprange --dst-range 192.168.1.1-192.168.1.254 -j
DROP

with above rule i can dop all icmp packets on eth1 interface
but when i add -f option to deny on fragmented packets rule doesnt work

iptables -A INPUT -p icmp -i eth1 -m iprange --src-range
172.31.114.1-172.31.114.254 -m iprange --dst-range 192.168.1.1-192.168.1.254 -f
-j DROP

My abjective is to deny only fragmented packets with specified ip, protocol and
interface and "-f" option doesnt seem to work

Thanks and Regards,
Rahul Shrivastava
