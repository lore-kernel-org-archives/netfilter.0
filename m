From: Pandu Poluan <pandu@poluan.info>
Subject: Re: Question on raw table and match state
Date: Fri, 11 Feb 2011 15:06:28 +0700
Message-ID: <AANLkTi=HmeFD06=BXZ2wL1BeK_UgR=3_RuJ9_asjPP9K@mail.gmail.com>
References: <AANLkTin7iGxO6rS4XiziUVWJt-4cfH8-h4-cg3354-2C@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTin7iGxO6rS4XiziUVWJt-4cfH8-h4-cg3354-2C@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On Fri, Feb 11, 2011 at 14:46, Pandu Poluan <pandu@poluan.info> wrote:
> I am wondering if the following rule will work:
>
> iptables -t raw -A PREROUTING -p icmp -m state --state
> RELATED,ESTABLISHED -j ACCEPT
>

Okay, to answer my own question: It won't work.

Method:

iptables -t raw -A PREROUTING -p icmp -m state --state
RELATED,ESTABLISHED -j LOG \
--log-prefix "RP ICMP MATCH:"
ping 192.168.1.1

(4 or 5 pings, then ^C)

dmesg

No log entries.

I did that right, didn't I?

Rgds,
--
Pandu E Poluan
~ IT Optimizer ~
Visit my Blog: http://pepoluan.posterous.com
Google Talk:    pepoluan
Y! messenger: pepoluan
MSN / Live:      pepoluan@hotmail.com (do not send email here)
Skype:            pepoluan
