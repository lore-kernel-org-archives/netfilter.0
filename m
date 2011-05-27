From: Erik Schorr <erik-lists@arpa.org>
Subject: Re: iptables-restore - does  it breaks existing connections?
Date: Fri, 27 May 2011 15:31:46 -0700
Message-ID: <4DE02652.9020104@arpa.org>
References: <1748026766.20110525102949@yandex.ru> <4DDFBDE8.8010808@arpa.org> <alpine.LNX.2.01.1105271758030.6326@frira.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.01.1105271758030.6326@frira.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org
Cc: Jan Engelhardt <jengelh@medozas.de>, gapsf@yandex.ru

On 5/27/2011 8:58 AM, Jan Engelhardt wrote:
> Though these dates,-m conntrack --ctstate ESTABLISHED,RELATED is used.

Is there a practical, performance, or functional difference between 
using -m state and -m conntrack?
