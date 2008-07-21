From: Bernhard Bock <mailinglists@bock.nu>
Subject: Re: Iptables find invalid packets
Date: Mon, 21 Jul 2008 18:02:22 +0200
Message-ID: <4884B30E.3020904@bock.nu>
References: <48847F16.8040604@itool.com> <488487E3.2020906@bock.nu> <48849E47.30901@itool.com> <48849FB7.7070607@bock.nu> <4884AED9.8010306@itool.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4884AED9.8010306@itool.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Dimitri GOURDON <dgourdon@itool.com>
Cc: netfilter@vger.kernel.org

Hi,

Dimitri GOURDON wrote:
> Finally, I've successed to modify the 2 parameters. I have respectively 
> modify them with 131072 and 16384. And the problem stay entire...

Well, it certainly worked for me. You may try to increase these values 
further. Apart from this, I do not have any idea. I do, however, use a 
newer kernel (2.6.25). So upgrading your kernel - as proposed by others 
- may help. YMMV.

best regards
Bernhard

