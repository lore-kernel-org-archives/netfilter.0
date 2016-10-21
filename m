From: Sverd Johnsen <sverd.johnsen@googlemail.com>
Subject: nftables: log in netdev not possible? (Error: Could not process rule:
 No such file or directory)
Date: Fri, 21 Oct 2016 12:53:56 +0200
Message-ID: <CAGmahrSLeMcs4Q+nmtgQ=qnvzeXEWbNz37VtpMoPffWVJL0iZQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20120113;
        h=mime-version:from:date:message-id:subject:to;
        bh=nnigT+7gWLk0FHxvDGbJskbiktHJYfWoqU29abiniyU=;
        b=kGBVfmO2i0YZZEMgaWTvuIUjQVbarmy3C4CvM811Fi+hwoC1jB+q7C1TXNo4U/Fl9h
         ewCOOOMuy/wkqIiC8SiD+kWK0g/IHN+LlMv01jV21HFs9anRh6HUptADy33R2hI8nfDS
         zYmm3aNmRXh5rIPAwRIDCEW6tBn2aLi5cfGLYLkbT31tT+OLlat4MJhBaQ+JuEozQ4rf
         SiaAaHEkeWDYwAomIoy0LMiDpmCjv7Z3HRTlDQuxGLr9/9S+BB0cZw89mH6OJ/UzXX79
         x22cEhyhY6R9EbLBz8kuw3Cwgz5nP+d8YFImjgn+RsBqVWop4q3jgDIlSBMsnTGDaNWv
         hywQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

This works:

table netdev filter {
    chain test {
        type filter hook ingress device eth0 priority 0; policy accept;
        counter packets 43 bytes 2820
    }
}

This does not:

table netdev filter {
  chain test {
  type filter hook ingress device eth0 priority 0;
    counter log
  }
}

# nft -f /etc/nftables.conf




 :(
/etc/nftables.conf:112:1-2: Error: Could not process rule: No such
file or directory
table netdev filter {
^^
