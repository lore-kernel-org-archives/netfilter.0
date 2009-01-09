From: =?UTF-8?B?QXJ0xatyYXMgxaBsYWp1cw==?= <x11@arturaz.net>
Subject: Re: (Ab)using iptables to record byte count per IP?
Date: Fri, 09 Jan 2009 13:50:43 +0200
Message-ID: <49673A13.6050807@arturaz.net>
References: <2d460de70901090327y625afd60g792467e843d3f1d@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <2d460de70901090327y625afd60g792467e843d3f1d@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Richard Hartmann <richih.mailinglist@gmail.com>
Cc: netfilter@vger.kernel.org

Richard Hartmann wrote:
 > Hi all,
 >
 > I need to log the traffic each local IP in a NAT'ed network generates
 > per day.
 >
 > Unfortunately, the environment is rather restricted and compiling new
 > software is not an option. Thus, I am wondering if I can abuse iptables,
 > which is in use anyway, to log for me, as well.
 >
 > The end result should be a log which contains IP, date and traffic
 > generated. I don't really care about the output format as I will perl it
 > into the format I need, anyway.

iptables -N ACCOUNTING
iptables -A FORWARD -j ACCOUNTING
iptables -A ACCOUNTING -s your_user_ip -j ACCEPT
iptables -A ACCOUNTING -d your_user_ip -j ACCEPT

bam, with iptables -L ACCOUNTING -n -v you can have packet/byte counters ;)
