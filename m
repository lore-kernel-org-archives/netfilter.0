From: Daniel Huhardeaux <daniel.huhardeaux@tootai.com>
Subject: Port forwarding on host interface
Date: Wed, 23 Sep 2009 13:05:01 +0200
Message-ID: <4ABA00DD.70205@tootai.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi all,

I would like to redirect an external port to another port on the same 
machine. I read on some documents that the kernel doesn't allow DNAT to 
127.0.0.1 so I ended up with following setup:

let's say I want to redirect 59000 port on my 1.2.3.4 public IP to 5900 
port on the same public IP *but a direct connection to 5900 port on the 
public IP* is forbidden. At this time my packets are marked for iproute2 
(2 ISP), mark 201 (isp1) or 202 (Isp2).

Has someone a tip for me? Is it true that forwarding to 127.0.0.1 can't 
be done?

Thanks for any hint.

-- 
Daniel Huhardeaux       _____ ____ ____ _____ _____ _
enum   +33 368 460 088 (_  __) _  ) _  (_  __) _  _(_)  +48 222 472 472
iaxtel  1-700-849-6983  / / / // / // / / / / /_/ / /  GIZMO,SKYPE,GTALK
sip/iax:callto 101@sip./_/ ( ___( ___/ /_/ (_/ (_/_/.net   tootaiNET

