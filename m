From: "Juan Antonio Rodriguez Moreno" <pushakk@limbo.ari.es>
Subject: Ugly problem with ebtables
Date: Mon, 27 Apr 2009 12:02:15 +0200 (CEST)
Message-ID: <c5f74e0f56607a07b993f7b3e858a659.squirrel@limbo.ari.es>
Reply-To: pushakk@limbo.ari.es
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello,

excuse me about my bad english, I'll try to explain my ugly issue

I have a linux bridged machine, with eth1 and eth2 port on br0. I'm using
ebtables to up smtp traffic on routing process and iptables to mark it. I
route this traffic over openvpn tunnel tun0.

That's all right but when IP fragment a packet and send the former frame
without the PUSH flag, this frame dissapear.
I can see all traffic on the sending point of the tunel, but the frames
without the PUSH flag set don't arrive on the another side.

For example I send a mail and this is the trace

On client  #ngrep -d tun0 host 192.168.11.150 and port 25

... Traffic ....

T xxx.xxx.xxx.xxx:25 -> 192.168.11.150:2286 [AP]
  354 End data with <CR><LF>.<CR><LF>..

192.168.11.150:2286 -> xxx.xxx.xxx.xxx:25 [A]
From: "copperpot" <copperpot@xxxx.com>..To:
<jrodriguez@xxxx.com>..Subject: Prueba de correo..Date: Mon, 27 Apr 2009
11:24:21 +0200..Message-ID: <006e01c9c719$f37dfd80$da79f880$@com> [ ...
Continue .....]

T 192.168.11.150:2286 -> xxx.xxx.xxx.xxx:25 [AP]
...font-size:11.0pt;...font-family:"Calibri","sans-serif";}..a:link,
span.MsoHyperlink...{mso-style-priority:99;...color:blue; [ .... continue
.....]

... Traffic ....

On server side  #ngrep -d tun1 host 192.168.11.150 and port 25

... Traffic ....

T xxx.xxx.xxx.xxx:25 -> 192.168.11.150:2258 [AP]
  354 End data with <CR><LF>.<CR><LF>..

T 192.168.11.150:2258 -> xxx..xxx.xxx.xxx:25 [AP]
  ...font-size:11.0pt;...font-family:"Calibri","sans-serif";}..a:link [
...Coninue ... ]

... Traffic ...

Like will see the frame

192.168.11.150:2286 -> xxx.xxx.xxx.xxx:25 [A]
From: "copperpot" <copperpot@xxxx.com>..To: <jrodriguez@xxxx.com>..Subject:

dissapear so the mail proccess fail.

Thank you very much.


