From: Ottavio Campana <ottavio@campana.vi.it>
Subject: relaying RTSP
Date: Fri, 04 Feb 2011 18:39:49 +0100
Message-ID: <4D4C39E5.7090503@campana.vi.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

I am trying to implement a relay for RTSP or something similar for the
following situation:

+--------------+     +---------------------------+     +-----------+
|      pc      |     |         box with 2 NICs   |     |   camera  |
|192.168.0.1/24|<--->|192.168.0.2/24  10.0.0.1/24|<--->|10.0.0.2/24|
+--------------+     +---------------------------+     +-----------+

On the pc I have a *crappy* software that has to read some data from the
box with 2 NICs and receive the RTSP video from the camera. The easiest
solution would be opening two connections to two different IPs on the
192.168.0.0/24 lan, but the software can deal with just one IP. Thus,
since I only need to receive the video from the camera, I considered the
solution I just showed you, by hiding the camera in the lan 10.0.0.0/24
and relaying it.

Now the question is: can I do RTSP relaying with netfilter? I have
several doubts, for example what happens when the pc issues a DESCRIBE
command? I mean, the pc will send a describe command with the ip
192.168.0.2, but it if is forwarded to the camera it should be changed
to 10.0.0.2 .

So, do you think it is possible to achieve a working configuration with
netfilter or do I have to look for a relay in user space? In the latter
case, do you know any program that can solve my problem?

Thank you for your ideas,

Ottavio

-- 
Non c'e' piu' forza nella normalita', c'e' solo monotonia.
