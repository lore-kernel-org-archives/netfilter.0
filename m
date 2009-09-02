From: "John Lister" <john.lister@kickstone.com>
Subject: Re: Checking line status
Date: Wed, 2 Sep 2009 16:02:59 +0100
Message-ID: <E15BF2D74EEC4347AC3EA9A66551ABAB@squarepi.com>
References: <4A93CC1C.3070100@infoservices.in> <58261217A1E14FCCB2F0CF27FA977252@squarepi.com> <4A93DDA0.6000900@trash.net> <591B070B9C3D465CA4CCE1B11024DBEA@squarepi.com> <1251895652.23708.37.camel@enterprise.ims-firmen.de> <0DB67FCC2A774AFCA834C6CD4BE5DB12@squarepi.com> <1251901831.10035.8.camel@enterprise.ims-firmen.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: Thomas Jacob <jacob@internet24.de>
Cc: netfilter@vger.kernel.org

>Nope: The (initial) routing decision is taken first and then the chains
>are traversed as follows.

>http://ebtables.sourceforge.net/br_fw_ia/br_fw_ia.html#section3

Odd, the diagram I was using differed in where the routing decision was 
made. But that seems to fit more with what is happening...


>But apparently when you set fwmarks the kernel then reconsiders
>its routing  decision later on, don't ask me how that works, maybe
>some of the developers can answer that.

>Google dragged up this:

>http://rumytaulu.wordpress.com/2009/05/23/linux-loadbalancing-with-two-adsl-modems/

Cheers for the link, I think i'd read that before and others. My rules are 
similar (if expanded for more interfaces), that works fine for forwarded 
packets (as does mine) but not locally generated ones - unless you have a 
default route in. I've had trouble load balancing locally sourced packets - 
although I will only be using them to test the lines and modify the rules if 
a line goes down..

I'll post the script once i've tested things.

Thanks

