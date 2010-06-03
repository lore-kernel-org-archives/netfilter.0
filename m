From: Marek Kierdelewicz <marek@piasta.pl>
Subject: Re: Troubles doing transparent proxy for virtual machines
Date: Thu, 3 Jun 2010 23:20:41 +0200
Message-ID: <20100603232041.7b18a208@catlap>
References: <4C08181A.1010304@ngenera.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C08181A.1010304@ngenera.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

>I guess what's confusing me is that everything runs on the same box.

Yup. Packet traverses nat table when it passes bridge and it cannot
traverse this table second time entering virbr0 interface.

Try this:
echo 0 > /proc/sys/net/bridge/bridge-nf-call-iptables

For permament solution add appropriate entry in /etc/sysctl.conf.

Best regards,
Marek
