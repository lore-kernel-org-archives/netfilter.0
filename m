From: "Ethy H. Brito" <ethy.brito@inexo.com.br>
Subject: Fw: shaping vlans - revisited
Date: Thu, 3 Feb 2011 15:29:44 -0200
Message-ID: <20110203152944.635b42e8@pulsar.inexo.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Date: Thu, 3 Feb 2011 15:28:59 -0200
From: "Ethy H. Brito" <ethy.brito@inexo.com.br>
To: Marek Kierdelewicz <marek@piasta.pl>
Subject: Re: shaping vlans - revisited


On Thu, 3 Feb 2011 16:46:53 +0100
Marek Kierdelewicz <marek@piasta.pl> wrote:

> >Hi All
> 
> Hi,
> 
> >I can see the counters increase (tc -s ...) for classid 1:2345 (eth0)
> >but they are zero for classid 2:2345 (eth1 - which the vlans are
> >attached in)
> 
> Are you seeing any traffic on root class on eth1? 

Yes I am.

> What's the output of following commang:
> 
> tc -s -d class sh dev eth1|grep -A 5 'root'

as requested:

# tc -s -d class sh dev eth1|grep -A 5 'root'
class htb 2:1 root rate 102400Kbit ceil 102400Kbit burst 52992b/8 mpu 0b overhead 0b cburst 52992b/8 mpu 0b overhead 0b level 7 
 Sent 8736060613 bytes 26878684 pkt (dropped 0, overlimits 0 requeues 0) 
 rate 3463Kbit 1547pps backlog 0b 0p requeues 0 
 lended: 0 borrowed: 0 giants: 0
 tokens: 4039 ctokens: 4039



-- 

Ethy H. Brito         /"\
InterNexo Ltda.       \ /  CAMPANHA DA FITA ASCII - CONTRA MAIL HTML
+55 (12) 3797-6860     X   ASCII RIBBON CAMPAIGN - AGAINST HTML MAIL
S.J.Campos - Brasil   / \ 
 
PGP key: http://www.inexo.com.br/~ethy/0xC3F222A0.asc
