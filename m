From: Alexander Kolesnik <alexander.kolesnik@awanti.com>
Subject: Re[2]: ulog: losing packets
Date: Mon, 2 Mar 2009 10:57:58 +0300
Message-ID: <1687794505.20090302105758@awanti.com>
References: <547716004.20090227172654@awanti.com> <49AA5FF8.5010409@netfilter.org>
Reply-To: Alexander Kolesnik <alexander.kolesnik@awanti.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <49AA5FF8.5010409@netfilter.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

Hello Pablo,

Thanks for the answer!

>> /etc/ulogd.conf:
>> rmem=442368
PNA>        ^^^^^^
PNA> Rising this value will delay hitting ENOBUFS. This is the size of the
PNA> receiver buffer.

1. "delay" means I will get ENOBUFS in any case (early or later)?

2. What ENOBUFS does depend on? Packets per second? Bytes per second?
Amount of iptables/shaping rules? CPU performance?

3. Is there any way to calculate or predict the high limit of
traffic rate/number of rules/etc when the system will still manage to
process ULOG without alerting with ENOBUFS?

4. ipcad buffers (I suppose this is the same as rmem for ulogd) is set
to 4M:
/etc/ipcad.conf:
buffers = 4194304;
But I'm still losing ULOG messages. Does that mean I have to rise this
value more?

-- 
Best regards,
 Alexander

