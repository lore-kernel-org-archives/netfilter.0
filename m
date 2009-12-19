From: Scott Shambarger <scott-netfilter@shambarger.net>
Subject: Re: Returning nat packets vanishing after mangle:PREROUTING and conntrack
 processing
Date: Sat, 19 Dec 2009 06:37:03 -0800
Message-ID: <40efba0ec31032f27b200a4da7b17ae9@localhost>
References: <7ad63010a18944d3264b5ba158c236df@localhost> <4B2CD13D.504@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4B2CD13D.504@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org


On Sat, 19 Dec 2009 14:12:29 +0100, Pascal Hambourg

<pascal.mail@plouf.fr.eu.org> wrote:

> 

> It may be a source validation issue, which is common in multihomed

> setups. If sysctl net.ipv4.conf.<input_interface>.rp_filter is set to 1,

> does setting it to 0 fix the problem ?

> 



Fantastic, works great.  Changed to 'net.ipv4.conf.default.rp_filter = 0'

in sysctl.conf (was set to 1).



Oddly, I had rp_filter enabled on the system in kernel 2.6.30 and it

worked.  Has rp_filter changed somehow in the newer kernel (or is it now

working 'correctly'?).



Thanks,

Scott
