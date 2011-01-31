From: JeHo Park <linuxpark@gmail.com>
Subject: [HELP] why the string match does not work in nat tables?
Date: Mon, 31 Jan 2011 10:53:33 +0900
Message-ID: <AANLkTinoBfMTDNVLHuBhMFJHHSrMmP0gwYTz2AX3f_ew@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:date:message-id:subject:from:to
         :content-type;
        bh=c+c09AVA2jqZMVggfVC3ARBWX0FFolN62Q9fuK9AZV0=;
        b=mg7vVzVCm8LRUE7jr56bv2tBqGs/SsD7fc0ZwBy4JqGBPHpvceTzpIXeksiAGqvD+I
         tnRc8oIAQsgEQtjM5Qj3Yx18WBpL2UptXpD2XA1WyoroxxUmjUG+1cixpTBdMbU72GVL
         izlAfkfPIS86TI2cHlTlMaJB4ddFLVY/Zf69k=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org

hi there

i have been trying to apply the string match or external wurlmatch to
my NAT environment.
but the matches was not valid in NAT or tproxy
so i tried to verify TCP payload with debugging code in the string
match during runtime, and then i found there is no TCP data in skbuff

the string match works well in filter table, but it does not work in NAT.
i want to know why the string match does not work in NAT.
if you know that reason, please let me know


i used following iptables rules
#  iptables -A PREROUTING -t nat -p tcp --dport 80 -m string --string
"goole.com" --algo bm -j DNAT --to-destination 10.10.10.125:80

10.10.10.125 is IP address of my linux router and there is HTTP proxy server
