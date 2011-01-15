From: =?UTF-8?Q?Mamadou_Tour=C3=A9?= <e2ia.ci@gmail.com>
Subject: get byte count per rule and ip address
Date: Sat, 15 Jan 2011 12:09:41 +0000
Message-ID: <AANLkTimcqgfuk6mxKeANn4tS_saGwbUTGVSJHSTyozQs@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:date:message-id:subject:from:to
         :content-type;
        bh=dDYwhxNyOMVybxuY8JQ5/3+WUVVGePT/P31ahixx58w=;
        b=BSYQpifZeuonIEGw12vV7+uy9hyUw2RM73ZtXcHU0cIDQp5PzN6unxYJVNR2Gru2lV
         2nAF2Ou29uF3a0Zw3s5dFLswFQwBMVY0r+t6nRmUfLjAvPh80nB/wObnp3FElha8b7jI
         F3kGYgZjTIn/J8p4AqDgDifeqOa29tGnE8G/8=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi, all
i've these rule :
r1 : iptables  -t mangle  -A POSTROUTING     -m layer7 --l7proto  bgp
-j MARK --set-mark 1
r2 : iptables  -t mangle  -A POSTROUTING     -m layer7 --l7proto  biff
 -j MARK --set-mark 2

for both r1 and r2 I'd like to get the byte count of packets that have
match rules.
also i'd like to get byte count of packets according to the IP address.
I need your help plz.
regards.
