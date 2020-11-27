From: "G.W. Haywood" <netfilter@jubileegroup.co.uk>
Subject: Re: How to Unblock IP Address of Email Client in Linux iptables
 Firewall in Linux Mail Server
Date: Fri, 27 Nov 2020 13:10:43 +0000 (GMT)
Message-ID: <alpine.DEB.2.21.2011271306030.14589@piplus.local.jubileegroup.co.uk>
References: <506d31d3d8f03a2ab00ad7739942dc2e@teo-en-ming.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <506d31d3d8f03a2ab00ad7739942dc2e@teo-en-ming.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Turritopsis Dohrnii Teo En Ming <ceo@teo-en-ming.com>
Cc: netfilter@vger.kernel.org

Hi there,

On Fri, 27 Nov 2020, Turritopsis Dohrnii Teo En Ming wrote:

> ... Mr. Turritopsis Dohrnii Teo En Ming ... is a TARGETED INDIVIDUAL ...

He is now:

$ grep Ming /etc/mail/extensible-milter/rules
'return "REJECT|551|5.7.1|Administrative prohibition." if( {mfrom} =~ /Teo.En.Ming/i || {subject} =~ /Teo.En.Ming/i );'

-- 

73,
Ged.
