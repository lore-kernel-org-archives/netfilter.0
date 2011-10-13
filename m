From: Jan Sarenik <jasan@x31.com>
Subject: Re: masquerade error
Date: Thu, 13 Oct 2011 16:09:00 +0200
Message-ID: <20111013140900.GB9363@ams1.x31.com>
References: <4E93E9B8.3010005@gmail.com> <4E94480C.4050604@googlemail.com> <4E95D9E2.4010002@gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4E95D9E2.4010002@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi J!

On Wed, Oct 12, 2011 at 07:18:10PM +0100, J Webster wrote:
> Thanks. If that is the case, then how do I postroute on a virtual network?

According to http://forum.openvz.org/index.php?t=msg&goto=42693&
you have to enable iptable_nat on host.

The error you are getting is anyway strange and I suppose it
can be a version mismatch between host kernel and guest iptables
(either too recent or too old iptables on your virtual node).

  HTH, Jasan
