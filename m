From: Al Grant <bigal.nz@gmail.com>
Subject: IPTables
Date: Wed, 11 Apr 2012 15:03:46 +1200
Message-ID: <CAODtcdf9shdm-KWvrjGHyDwjJL_p9pE4BdeSKELSTC6ww0p03g@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=iCY/cwdfXasST6sIyKlBu/gg4b9hDBIK+KxL2C4MefA=;
        b=iPbnC7PgXFiFmFEE+4O2uNOwdxXMe6/Xl7NRrOjZxIQMsANNP3YePmXzIJyF5YfaAG
         REKRgNJF/+Kaq2ux1KksvD5RZxpUKQnHV4pcALXUN+qzRlV4cIi4HbEejpg19w2rq7Ju
         nJeJYx76YamRH8nt+UXefu6itaGnQa6phOsEMJJmVS/U35Vwy0OK3AJWJYknABBcb5SH
         C+jEhF4M4qvuXKz70VQajSDTK6xxTHEnHLuFyuzOjE7u/J3HtJemdOxmDf7KbAiCFqfM
         yhBHrmcgc+AyjfBThiBA4uuewlXN0yba/BEFn/OUYMD1Zr89CMFD73YQCJysBiWED6BV
         /BmA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter <netfilter@vger.kernel.org>

Hiya All,



I am after a little guidance please on the following problem:



My topology is as follows:



inet----router 192.168.1.254-------wlan0 192.168.1.71 && eth0
192.168.70.121------ip camera 192.168.70.140:80



Note:

(1) eth0 and wlan0 are on a PC running Ubuntu.

(2) Port 5555 on the router is forwarded to 80 on 192.168.1.71

(2) in sysctl I have set sysctl net.ipv4.ip_forward=1



Now what I need to do is to be able to access the IP camera from the inet.



So I have tried adding IPTables:

iptables -t nat -A PREROUTING -i wlan0 -d 192.168.1.71 -p tcp --dport
5555 -j DNAT --to 192.168.70.140:80



Now this should allow me to access the camera by pointing a web
browser to the real world public ip on port 5555, however I get page
cannot be displayed.



I have verified that:

1. That camera is accessable from the Ubuntu computer via web browser and ping



Various people have suggsted I may need to modify conntrack and others
have suggested I may need a second rule.



Can anyone please help?



Thanks in advance

AL


--
"Beat it punk!"
- Clint Eastwood
