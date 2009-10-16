From: "Roderick Groesbeek" <r.groesbeek@triple-it.nl>
Subject: RE: conntrack generates UDP 'ghost traffic'
Date: Fri, 16 Oct 2009 11:54:51 +0200
Message-ID: <3F6AD08836AD044C935E9FAC3A76474201366841@pandora.triple.lan>
References: <3F6AD08836AD044C935E9FAC3A764742024241BE@pandora.triple.lan>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-class: urn:content-classes:message
In-Reply-To: <3F6AD08836AD044C935E9FAC3A764742024241BE@pandora.triple.lan>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

-----Original Message-----
>But the SOURCE is dead!
>[root@pollux conntrack-tools-0.9.13 ]# ping  -w 3 192.168.14.57
>PING 192.168.14.57 (192.168.14.57) 56(84) bytes of data.
>--- 192.168.14.57 ping statistics ---
>4 packets transmitted, 0 received, 100% packet loss, time 2999ms
>[root@pollux conntrack-tools-0.9.13 ]#
>
>Problem:
>========
>In this situation the UDP traffic is flooded through our SWITCH
>infrastructure!
>
>
>Question:
>=========
>How can we avoid this?

Manually work-around:
- Option1: Change the state of the TCP established conntrack rule?
- Option2: Insert/inject FIN packets with 'packit'?

Ad Option1
"conntrack -D" does only some administration changes. To what state can
we
Change the rule to force disconnection of the TCP connection?


Automatic work-around:
- Monitor ICMP traffic (for instance with the nf_conntrack_rtsp module?)
- Is there a solution available?


GR,
RG

